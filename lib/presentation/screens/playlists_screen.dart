import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vmp_music/presentation/providers/playlist_provider.dart';
import 'package:vmp_music/presentation/widgets/index.dart';
import 'package:vmp_music/core/routing/route_paths.dart';

/// Screen to display and manage playlists
class PlaylistsScreen extends ConsumerStatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  ConsumerState<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen> {
  @override
  void initState() {
    super.initState();
    // Load playlists when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(playlistProvider.notifier).loadAllPlaylists();
    });
  }

  @override
  Widget build(BuildContext context) {
    final playlistState = ref.watch(playlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
        elevation: 0,
      ),
      body: _buildPlaylistList(context, playlistState),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreatePlaylistDialog(context),
        tooltip: 'Create Playlist',
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Build the playlist list
  Widget _buildPlaylistList(BuildContext context, PlaylistState state) {
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
                  ref.read(playlistProvider.notifier).loadAllPlaylists(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.playlists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.album, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No playlists yet',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Create Playlist',
              onPressed: () => _showCreatePlaylistDialog(context),
              icon: Icons.add,
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: state.playlists.length,
      itemBuilder: (context, index) {
        final playlist = state.playlists[index];
        return PlaylistCard(
          playlist: playlist,
          onTap: () {
            context.pushNamed(
              RoutePaths.playlistDetailName,
              pathParameters: {'playlistId': playlist.id},
            );
          },
          onDeleteTap: () => _showDeleteConfirmation(context, playlist.id, playlist.name),
          onFavoriteTap: () {
            ref.read(playlistProvider.notifier).toggleFavorite(playlist.id);
          },
        );
      },
    );
  }

  /// Show create playlist dialog
  void _showCreatePlaylistDialog(BuildContext context) {
    final controller = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Playlist'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Playlist Name',
                hintText: 'Enter playlist name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Enter description',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(playlistProvider.notifier).createPlaylist(
                  controller.text,
                  description: descController.text,
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Playlist created')),
                );
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  /// Show delete confirmation
  void _showDeleteConfirmation(
    BuildContext context,
    String playlistId,
    String playlistName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Playlist'),
        content: Text('Are you sure you want to delete "$playlistName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(playlistProvider.notifier).deletePlaylist(playlistId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Playlist deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
