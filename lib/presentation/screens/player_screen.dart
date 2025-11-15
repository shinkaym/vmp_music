import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/presentation/providers/audio_player_provider.dart'
    as audio;
import 'package:vmp_music/presentation/widgets/index.dart';

/// Full screen music player
///
/// Displays current playing track with album art, metadata, controls, and progress
class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(audio.audioPlayerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.queue_music),
            onPressed: () {
              // Navigate to queue screen
            },
            tooltip: 'Queue',
          ),
        ],
      ),
      body: playerState.currentMusic == null
          ? _buildEmptyState(context)
          : _buildPlayerContent(context, ref, playerState),
    );
  }

  /// Build empty state when no music is playing
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.music_note, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 24),
          Text(
            'No music playing',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Go to library to select a song',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }

  /// Build the main player content
  Widget _buildPlayerContent(
    BuildContext context,
    WidgetRef ref,
    AudioPlayerState state,
  ) {
    final music = state.currentMusic!;

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            kToolbarHeight -
            MediaQuery.of(context).padding.top,
        child: Column(
          children: [
            // Album art section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _buildAlbumArt(music),
              ),
            ),
            // Music info and controls
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and artist
                    _buildMusicInfo(context, music),
                    const SizedBox(height: 32),
                    // Progress bar
                    ProgressBarWidget(
                      currentPosition: state.currentPosition,
                      totalDuration: state.duration,
                      onSeek: (position) {
                        ref
                            .read(audio.audioPlayerProvider.notifier)
                            .seekTo(position);
                      },
                    ),
                    const SizedBox(height: 32),
                    // Playback controls
                    _buildPlaybackControls(context, ref, state),
                    const SizedBox(height: 32),
                    // Bottom controls (volume, queue)
                    _buildBottomControls(context, ref, state),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build album art display
  Widget _buildAlbumArt(music) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: music.albumArtPath.isNotEmpty
            ? Image.asset(
                music.albumArtPath,
                fit: BoxFit.cover,
              )
            : Container(
                color: Colors.grey[300],
                child: const Icon(
                  Icons.music_note,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }

  /// Build music title and artist info
  Widget _buildMusicInfo(BuildContext context, music) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          music.title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          music.artist,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// Build main playback controls
  Widget _buildPlaybackControls(
    BuildContext context,
    WidgetRef ref,
    AudioPlayerState state,
  ) {
    return Center(
      child: PlaybackControlsWidget(
        isPlaying: state.isPlaying,
        onPlayPause: () {
          if (state.isPlaying) {
            ref.read(audio.audioPlayerProvider.notifier).pause();
          } else {
            ref.read(audio.audioPlayerProvider.notifier).resume();
          }
        },
        onNextPressed: () {
          // Will be implemented with queue management
        },
        onPreviousPressed: () {
          // Will be implemented with queue management
        },
        playMode: _convertPlayMode(state.playMode),
        buttonSize: 64,
      ),
    );
  }

  /// Build bottom controls (volume, queue)
  Widget _buildBottomControls(
    BuildContext context,
    WidgetRef ref,
    AudioPlayerState state,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Volume control
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.volume_down, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Slider(
                  value: state.volume,
                  onChanged: (value) {
                    ref
                        .read(audio.audioPlayerProvider.notifier)
                        .setVolumeLevel(value);
                  },
                  max: 1.0,
                ),
              ),
              const Icon(Icons.volume_up, size: 20),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Favorite button
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.grey[600],
          ),
          onPressed: () {
            // Will integrate with music library favorite functionality
          },
        ),
      ],
    );
  }

  /// Convert AudioPlayerState PlayMode to widget PlayMode
  PlayMode _convertPlayMode(audio.PlayMode playMode) {
    return switch (playMode) {
      audio.PlayMode.normal => PlayMode.normal,
      audio.PlayMode.repeatOne => PlayMode.repeatOne,
      audio.PlayMode.repeatAll => PlayMode.repeatAll,
      audio.PlayMode.shuffle => PlayMode.shuffle,
    };
  }
}
