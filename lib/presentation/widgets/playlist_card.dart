import 'package:flutter/material.dart';
import 'package:vmp_music/domain/entities/playlist.dart';
import 'common/index.dart';

/// Widget to display a playlist preview card
///
/// Shows playlist name, song count, and cover image with action buttons
class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback? onTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onFavoriteTap;
  final bool showActions;

  const PlaylistCard({
    super.key,
    required this.playlist,
    this.onTap,
    this.onEditTap,
    this.onDeleteTap,
    this.onFavoriteTap,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover image and play button
          _buildCoverSection(context),
          const SizedBox(height: 12),
          // Title
          Text(
            playlist.name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Song count and description
          Text(
            '${playlist.songCount} song${playlist.songCount != 1 ? 's' : ''}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (playlist.description.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              playlist.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (showActions) ...[
            const SizedBox(height: 12),
            _buildActionButtons(context),
          ],
        ],
      ),
    );
  }

  /// Build cover image section with play button overlay
  Widget _buildCoverSection(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Cover image
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
            image: playlist.coverPath.isNotEmpty
                ? DecorationImage(
                    image: AssetImage(playlist.coverPath),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: playlist.coverPath.isEmpty
              ? const Icon(
                  Icons.album,
                  size: 64,
                  color: Colors.grey,
                )
              : null,
        ),
        // Play button overlay
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.3),
          ),
          child: IconButton(
            icon: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
            onPressed: onTap,
            splashRadius: 28,
          ),
        ),
      ],
    );
  }

  /// Build action buttons (edit, delete, favorite)
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Favorite button
        if (onFavoriteTap != null)
          IconButton(
            icon: Icon(
              playlist.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: playlist.isFavorite ? Colors.red : null,
            ),
            onPressed: onFavoriteTap,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(4),
          ),
        // Spacer
        const Spacer(),
        // Edit button
        if (onEditTap != null)
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEditTap,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(4),
            tooltip: 'Edit',
          ),
        // Delete button
        if (onDeleteTap != null)
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDeleteTap,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(4),
            tooltip: 'Delete',
          ),
      ],
    );
  }
}

/// Compact version of PlaylistCard for list view
class CompactPlaylistTile extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback? onTap;
  final VoidCallback? onPlayTap;

  const CompactPlaylistTile({
    super.key,
    required this.playlist,
    this.onTap,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: _buildLeadingIcon(),
      title: playlist.name,
      subtitle:
          '${playlist.songCount} song${playlist.songCount != 1 ? 's' : ''}',
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow),
        onPressed: onPlayTap,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(4),
      ),
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }

  /// Build leading icon for playlist
  Widget _buildLeadingIcon() {
    if (playlist.coverPath.isNotEmpty) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(playlist.coverPath),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: const Icon(
        Icons.album,
        color: Colors.grey,
      ),
    );
  }
}
