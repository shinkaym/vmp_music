import 'package:riverpod/legacy.dart';
import 'package:vmp_music/domain/entities/music.dart';

/// Enum for playback status
enum PlaybackStatus {
  stopped,
  playing,
  paused,
}

/// Enum for play mode
enum PlayMode {
  normal,
  repeatOne,
  repeatAll,
  shuffle,
}

/// State for audio player
class AudioPlayerState {
  final Music? currentMusic;
  final PlaybackStatus status;
  final Duration currentPosition;
  final Duration duration;
  final double playbackSpeed;
  final double volume;
  final PlayMode playMode;
  final bool isLoading;
  final String? error;

  const AudioPlayerState({
    this.currentMusic,
    this.status = PlaybackStatus.stopped,
    this.currentPosition = Duration.zero,
    this.duration = Duration.zero,
    this.playbackSpeed = 1.0,
    this.volume = 1.0,
    this.playMode = PlayMode.normal,
    this.isLoading = false,
    this.error,
  });

  AudioPlayerState copyWith({
    Music? currentMusic,
    PlaybackStatus? status,
    Duration? currentPosition,
    Duration? duration,
    double? playbackSpeed,
    double? volume,
    PlayMode? playMode,
    bool? isLoading,
    String? error,
  }) {
    return AudioPlayerState(
      currentMusic: currentMusic ?? this.currentMusic,
      status: status ?? this.status,
      currentPosition: currentPosition ?? this.currentPosition,
      duration: duration ?? this.duration,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      volume: volume ?? this.volume,
      playMode: playMode ?? this.playMode,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// Check if audio is currently playing
  bool get isPlaying => status == PlaybackStatus.playing;

  /// Get progress as a fraction (0.0 to 1.0)
  double get progress {
    if (duration.inMilliseconds == 0) return 0.0;
    return (currentPosition.inMilliseconds / duration.inMilliseconds)
        .clamp(0.0, 1.0);
  }

  /// Get remaining duration
  Duration get remainingDuration => duration - currentPosition;
}

/// Notifier for managing audio player state
class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier() : super(const AudioPlayerState());

  /// Load a music track
  void loadMusic(Music music, Duration duration) {
    state = state.copyWith(
      currentMusic: music,
      duration: duration,
      currentPosition: Duration.zero,
      status: PlaybackStatus.stopped,
      error: null,
    );
  }

  /// Start playing the current music
  void play() {
    if (state.currentMusic != null) {
      state = state.copyWith(
        status: PlaybackStatus.playing,
        error: null,
      );
    }
  }

  /// Pause playback
  void pause() {
    state = state.copyWith(
      status: PlaybackStatus.paused,
    );
  }

  /// Stop playback and reset position
  void stop() {
    state = state.copyWith(
      status: PlaybackStatus.stopped,
      currentPosition: Duration.zero,
    );
  }

  /// Update current position during playback
  void updatePosition(Duration position) {
    state = state.copyWith(
      currentPosition: position,
    );
  }

  /// Seek to a specific position
  void seek(Duration position) {
    // Clamp position to be within bounds [0, duration]
    final clampedPosition = position < Duration.zero
        ? Duration.zero
        : position > state.duration
            ? state.duration
            : position;
    state = state.copyWith(
      currentPosition: clampedPosition,
    );
  }

  /// Set playback speed
  void setPlaybackSpeed(double speed) {
    state = state.copyWith(playbackSpeed: speed);
  }

  /// Set volume level
  void setVolume(double volume) {
    state = state.copyWith(
      volume: volume.clamp(0.0, 1.0),
    );
  }

  /// Increase volume
  void increaseVolume() {
    final newVolume = (state.volume + 0.1).clamp(0.0, 1.0);
    state = state.copyWith(volume: newVolume);
  }

  /// Decrease volume
  void decreaseVolume() {
    final newVolume = (state.volume - 0.1).clamp(0.0, 1.0);
    state = state.copyWith(volume: newVolume);
  }

  /// Set play mode
  void setPlayMode(PlayMode mode) {
    state = state.copyWith(playMode: mode);
  }

  /// Cycle through play modes
  void cyclePlayMode() {
    final modes = PlayMode.values;
    final currentIndex = modes.indexOf(state.playMode);
    final nextMode = modes[(currentIndex + 1) % modes.length];
    state = state.copyWith(playMode: nextMode);
  }

  /// Set loading state
  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// Set error message
  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Update duration
  void updateDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }
}

/// Provider for audio player state and notifier
final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>((ref) {
  return AudioPlayerNotifier();
});
