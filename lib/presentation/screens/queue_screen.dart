import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/presentation/providers/queue_provider.dart';
import 'package:vmp_music/presentation/widgets/index.dart';

/// Screen to display and manage the playback queue
class QueueScreen extends ConsumerStatefulWidget {
  const QueueScreen({super.key});

  @override
  ConsumerState<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends ConsumerState<QueueScreen> {
  @override
  void initState() {
    super.initState();
    // Load queue when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(queueProvider.notifier).loadQueue();
    });
  }

  @override
  Widget build(BuildContext context) {
    final queueState = ref.watch(queueProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Queue'),
        elevation: 0,
        actions: [
          if (queueState.queue.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () => _showClearConfirmation(context),
              tooltip: 'Clear Queue',
            ),
        ],
      ),
      body: _buildQueueList(context, queueState),
    );
  }

  /// Build the queue list
  Widget _buildQueueList(BuildContext context, QueueState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  ref.read(queueProvider.notifier).loadQueue(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.queue.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.queue_music, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Queue is empty',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Add songs from library to queue',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Current playing song
        if (state.currentIndex >= 0 && state.currentIndex < state.queue.length)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CompactMusicTile(
                music: state.queue[state.currentIndex],
                onTap: () {
                  // Play current song
                },
              ),
            ),
          ),
        // Divider
        if (state.currentIndex >= 0 && state.currentIndex < state.queue.length)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
        // Upcoming songs
        Expanded(
          child: ListView.builder(
            itemCount: state.queue.length,
            itemBuilder: (context, index) {
              final music = state.queue[index];
              final isCurrentIndex = index == state.currentIndex;

              return CompactMusicTile(
                music: music,
                index: index,
                onTap: () {
                  // Jump to song in queue
                  ref.read(queueProvider.notifier).jumpToIndex(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// Show clear queue confirmation
  void _showClearConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Queue'),
        content: const Text('Are you sure you want to clear the queue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(queueProvider.notifier).clearQueue();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Queue cleared')),
              );
            },
            child: const Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
