import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/presentation/providers/playlist_provider.dart';
import 'package:vmp_music/presentation/widgets/index.dart';

/// Screen to display and manage a specific playlist
class PlaylistDetailScreen extends ConsumerStatefulWidget {
  final String playlistId;

  const PlaylistDetailScreen({
    super.key,
    required this.playlistId,
  });

  @override
  ConsumerState<PlaylistDetailScreen> createState() =>
      _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends ConsumerState<PlaylistDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Load playlist details
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(playlistProvider.notifier)
          .loadPlaylistById(widget.playlistId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final playlistState = ref.watch(playlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
        elevation: 0,
      ),
      body: _buildPlaylistDetail(context, playlistState),
    );
  }

  /// Build playlist detail view
  Widget _buildPlaylistDetail(BuildContext context, PlaylistState state) {
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
              onPressed: () {
                ref
                    .read(playlistProvider.notifier)
                    .loadPlaylistById(widget.playlistId);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final playlist = state.currentPlaylist;
    if (playlist == null) {
      return const Center(
        child: Text('Playlist not found'),
      );
    }

    return Column(
      children: [
        // Playlist header
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                playlist.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                playlist.displayInfo,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
        // Songs list
        Expanded(
          child: playlist.isEmpty
              ? _buildEmptyPlaylist(context)
              : _buildSongsList(context, state),
        ),
      ],
    );
  }

  /// Build empty playlist view
  Widget _buildEmptyPlaylist(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.music_note, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text('No songs in this playlist'),
          const SizedBox(height: 24),
          CustomButton(
            label: 'Add Songs',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add songs functionality coming soon'),
                ),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }

  /// Build songs list
  Widget _buildSongsList(BuildContext context, PlaylistState state) {
    final playlist = state.currentPlaylist!;

    return ListView.builder(
      itemCount: playlist.musicIds.length,
      itemBuilder: (context, index) {
        // TODO: Fetch music entity by ID from library
        // For now, show placeholder
        return CompactMusicTile(
          music: state.currentPlaylist!.musicIds[index] as dynamic,
          index: index,
          onTap: () {
            // Play song
          },
        );
      },
    );
  }
}
