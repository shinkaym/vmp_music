import 'package:flutter/material.dart';
import 'package:vmp_music/domain/entities/music.dart';
import 'common/index.dart';

/// Widget to display a music item in a list
///
/// Shows music title, artist, and duration with optional favorite button
/// and context menu for additional actions
class MusicTile extends StatelessWidget {
  final Music music;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onPlayTap;
  final VoidCallback? onDeleteTap;
  final bool isSelected;
  final bool showFavoriteButton;

  const MusicTile({
    super.key,
    required this.music,
    this.onTap,
    this.onFavoriteTap,
    this.onPlayTap,
    this.onDeleteTap,
    this.isSelected = false,
    this.showFavoriteButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: _buildLeadingIcon(),
      title: music.title,
      subtitle: music.artist,
      trailing: _buildTrailingButtons(context),
      onTap: onTap,
      backgroundColor:
          isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  /// Build the leading icon (album art or default music icon)
  Widget _buildLeadingIcon() {
    if (music.albumArtPath.isNotEmpty) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(music.albumArtPath),
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
        Icons.music_note,
        color: Colors.grey,
      ),
    );
  }

  /// Build trailing buttons (favorite, duration, more options)
  Widget _buildTrailingButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Duration
        Text(
          music.durationFormatted,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 8),
        // Favorite button
        if (showFavoriteButton)
          IconButton(
            icon: Icon(
              music.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: music.isFavorite ? Colors.red : null,
              size: 20,
            ),
            onPressed: onFavoriteTap,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(4),
            splashRadius: 20,
          ),
        // More options button
        PopupMenuButton<String>(
          onSelected: (String value) {
            switch (value) {
              case 'play':
                onPlayTap?.call();
                break;
              case 'delete':
                onDeleteTap?.call();
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'play',
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  SizedBox(width: 8),
                  Text('Play'),
                ],
              ),
            ),
            const PopupMenuDivider(),
            if (onDeleteTap != null)
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
          ],
          icon: const Icon(Icons.more_vert, size: 20),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(4),
        ),
      ],
    );
  }
}

/// Compact version of MusicTile for minimal layouts
class CompactMusicTile extends StatelessWidget {
  final Music music;
  final VoidCallback? onTap;
  final int? index;

  const CompactMusicTile({
    super.key,
    required this.music,
    this.onTap,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: index != null
          ? SizedBox(
              width: 40,
              child: Center(
                child: Text('${index! + 1}'),
              ),
            )
          : null,
      title: music.title,
      subtitle: music.artist,
      trailing: Text(
        music.durationFormatted,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
