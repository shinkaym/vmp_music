import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderables/reorderables.dart';
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
        // Upcoming songs - Reorderable list
        Expanded(
          child: ReorderableColumn(
            children: List.generate(
              state.queue.length,
              (index) {
                final music = state.queue[index];
                final isCurrentIndex = index == state.currentIndex;

                return Padding(
                  key: ValueKey(music.id),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCurrentIndex
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Drag handle
                        ReorderableDelayedDragStartListener(
                          index: index,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.drag_handle, size: 20),
                          ),
                        ),
                        // Music tile
                        Expanded(
                          child: CompactMusicTile(
                            music: music,
                            index: index,
                            onTap: () {
                              ref
                                  .read(queueProvider.notifier)
                                  .jumpToIndex(index);
                            },
                          ),
                        ),
                        // Remove button
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: () {
                            ref
                                .read(queueProvider.notifier)
                                .removeFromQueue(index);
                          },
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            onReorder: (oldIndex, newIndex) {
              ref.read(queueProvider.notifier).reorderQueue(oldIndex, newIndex);
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
