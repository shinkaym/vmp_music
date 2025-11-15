import 'package:flutter/material.dart';

/// Play modes for the player
enum PlayMode { normal, repeatOne, repeatAll, shuffle }

/// Widget for playback control buttons
///
/// Provides play, pause, next, previous, repeat, and shuffle controls
class PlaybackControlsWidget extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback? onNextPressed;
  final VoidCallback? onPreviousPressed;
  final PlayMode playMode;
  final VoidCallback? onPlayModeChanged;
  final bool enableShuffle;
  final double buttonSize;

  const PlaybackControlsWidget({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    this.onNextPressed,
    this.onPreviousPressed,
    this.playMode = PlayMode.normal,
    this.onPlayModeChanged,
    this.enableShuffle = true,
    this.buttonSize = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Repeat/Shuffle button
        _buildPlayModeButton(context),
        const SizedBox(width: 16),
        // Previous button
        _buildControlButton(
          Icons.skip_previous,
          onPreviousPressed,
          context,
          size: buttonSize - 8,
        ),
        const SizedBox(width: 16),
        // Play/Pause button (larger)
        _buildPlayButton(context),
        const SizedBox(width: 16),
        // Next button
        _buildControlButton(
          Icons.skip_next,
          onNextPressed,
          context,
          size: buttonSize - 8,
        ),
        const SizedBox(width: 16),
        // Shuffle button
        if (enableShuffle) _buildShuffleButton(context),
      ],
    );
  }

  /// Build the main play/pause button (larger size)
  Widget _buildPlayButton(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Theme.of(context).colorScheme.onPrimary,
          size: buttonSize * 0.5,
        ),
        onPressed: onPlayPause,
        splashRadius: buttonSize * 0.5,
      ),
    );
  }

  /// Build control button (next/previous)
  Widget _buildControlButton(
    IconData icon,
    VoidCallback? onPressed,
    BuildContext context, {
    double size = 32,
  }) {
    return IconButton(
      icon: Icon(icon, size: size),
      onPressed: onPressed,
      splashRadius: size + 8,
    );
  }

  /// Build play mode button (repeat/repeat one/repeat all)
  Widget _buildPlayModeButton(BuildContext context) {
    IconData icon;
    String tooltip;

    switch (playMode) {
      case PlayMode.normal:
        icon = Icons.repeat;
        tooltip = 'Repeat: Off';
        break;
      case PlayMode.repeatOne:
        icon = Icons.repeat_one;
        tooltip = 'Repeat: One';
        break;
      case PlayMode.repeatAll:
        icon = Icons.repeat;
        tooltip = 'Repeat: All';
        break;
      case PlayMode.shuffle:
        icon = Icons.shuffle;
        tooltip = 'Shuffle';
        break;
    }

    final isActive = playMode != PlayMode.normal;

    return IconButton(
      icon: Icon(
        icon,
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onPressed: onPlayModeChanged,
      tooltip: tooltip,
      splashRadius: 24,
    );
  }

  /// Build shuffle button
  Widget _buildShuffleButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shuffle),
      onPressed: onPlayModeChanged,
      tooltip: 'Shuffle',
      splashRadius: 24,
    );
  }
}

/// Compact playback controls widget (smaller version)
class CompactPlaybackControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback? onNextPressed;
  final VoidCallback? onPreviousPressed;

  const CompactPlaybackControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    this.onNextPressed,
    this.onPreviousPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: onPreviousPressed,
          splashRadius: 20,
        ),
        // Play/Pause button
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: onPlayPause,
            splashRadius: 24,
          ),
        ),
        // Next button
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: onNextPressed,
          splashRadius: 20,
        ),
      ],
    );
  }
}

/// Minimal playback controls (just play/pause)
class MinimalPlaybackControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final double size;

  const MinimalPlaybackControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Theme.of(context).colorScheme.onPrimary,
          size: size * 0.5,
        ),
        onPressed: onPlayPause,
        splashRadius: size * 0.4,
      ),
    );
  }
}
