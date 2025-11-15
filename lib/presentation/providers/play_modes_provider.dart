import 'package:riverpod/legacy.dart';
import 'package:vmp_music/core/audio/playback_controls.dart';

/// State for play modes
class PlayModesState {
  final RepeatMode repeatMode;
  final ShuffleMode shuffleMode;

  const PlayModesState({
    this.repeatMode = RepeatMode.none,
    this.shuffleMode = ShuffleMode.off,
  });

  PlayModesState copyWith({
    RepeatMode? repeatMode,
    ShuffleMode? shuffleMode,
  }) {
    return PlayModesState(
      repeatMode: repeatMode ?? this.repeatMode,
      shuffleMode: shuffleMode ?? this.shuffleMode,
    );
  }

  /// Check if shuffle is enabled
  bool get isShuffleEnabled => shuffleMode == ShuffleMode.on;

  /// Check if repeat one is enabled
  bool get isRepeatOneEnabled => repeatMode == RepeatMode.one;

  /// Check if repeat all is enabled
  bool get isRepeatAllEnabled => repeatMode == RepeatMode.all;

  /// Get repeat mode as string
  String get repeatModeLabel {
    switch (repeatMode) {
      case RepeatMode.none:
        return 'No Repeat';
      case RepeatMode.one:
        return 'Repeat One';
      case RepeatMode.all:
        return 'Repeat All';
    }
  }

  /// Get shuffle mode as string
  String get shuffleModeLabel => isShuffleEnabled ? 'Shuffle On' : 'Shuffle Off';
}

/// Notifier for managing play modes
class PlayModesNotifier extends StateNotifier<PlayModesState> {
  final PlaybackControls _controls = PlaybackControls();

  PlayModesNotifier() : super(const PlayModesState());

  /// Set repeat mode
  void setRepeatMode(RepeatMode mode) {
    _controls.setRepeatMode(mode);
    state = state.copyWith(repeatMode: mode);
  }

  /// Cycle through repeat modes
  void cycleRepeatMode() {
    final nextMode = _controls.cycleRepeatMode();
    state = state.copyWith(repeatMode: nextMode);
  }

  /// Toggle shuffle
  void toggleShuffle() {
    final nextMode = _controls.toggleShuffle();
    state = state.copyWith(shuffleMode: nextMode);
  }

  /// Set shuffle mode
  void setShuffleMode(ShuffleMode mode) {
    _controls.setShuffleMode(mode);
    state = state.copyWith(shuffleMode: mode);
  }

  /// Reset to default modes
  void reset() {
    _controls.reset();
    state = const PlayModesState();
  }
}

/// Provider for play modes state and notifier
final playModesProvider =
    StateNotifierProvider<PlayModesNotifier, PlayModesState>((ref) {
  return PlayModesNotifier();
});
