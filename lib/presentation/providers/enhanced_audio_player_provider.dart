import 'package:riverpod/legacy.dart';
import 'package:vmp_music/core/audio/metadata_extractor.dart';
import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/usecases/audio_player_usecase.dart';
import 'package:vmp_music/presentation/providers/audio_player_provider.dart';
import 'package:vmp_music/presentation/providers/audio_service_provider.dart';

/// Enhanced audio player notifier with use case integration
class EnhancedAudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  final AudioPlayerUseCase _useCase;

  EnhancedAudioPlayerNotifier({
    required AudioPlayerUseCase useCase,
  })  : _useCase = useCase,
        super(const AudioPlayerState());

  /// Play a music track
  Future<void> playMusic(Music music) async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
      );

      // Extract metadata
      final metadata = await _useCase.getMetadata(music.path);
      final duration =
          metadata.duration ?? const Duration(seconds: 0);

      // Load and play
      await _useCase.playMusic(music);

      state = state.copyWith(
        currentMusic: music,
        status: PlaybackStatus.playing,
        duration: duration,
        currentPosition: Duration.zero,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Resume playback
  Future<void> resume() async {
    try {
      await _useCase.resumeMusic();
      state = state.copyWith(
        status: PlaybackStatus.playing,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Pause playback
  Future<void> pause() async {
    try {
      await _useCase.pauseMusic();
      state = state.copyWith(
        status: PlaybackStatus.paused,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Stop playback
  Future<void> stop() async {
    try {
      await _useCase.stopMusic();
      state = state.copyWith(
        status: PlaybackStatus.stopped,
        currentPosition: Duration.zero,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Seek to position
  Future<void> seekTo(Duration position) async {
    try {
      await _useCase.seekToPosition(position);
      state = state.copyWith(
        currentPosition: position,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Set playback speed
  Future<void> setSpeed(double speed) async {
    try {
      await _useCase.setPlaybackSpeed(speed);
      state = state.copyWith(
        playbackSpeed: speed,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Set volume
  Future<void> setVolumeLevel(double volume) async {
    try {
      await _useCase.setVolume(volume);
      state = state.copyWith(
        volume: volume,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Increase volume
  Future<void> increaseVol() async {
    try {
      await _useCase.increaseVolume();
      final newVol = _useCase.getVolume();
      state = state.copyWith(
        volume: newVol,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Decrease volume
  Future<void> decreaseVol() async {
    try {
      await _useCase.decreaseVolume();
      final newVol = _useCase.getVolume();
      state = state.copyWith(
        volume: newVol,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Update position from stream
  void updatePosition(Duration position) {
    state = state.copyWith(currentPosition: position);
  }

  /// Update duration from stream
  void updateDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }

  /// Set play mode
  Future<void> setPlayMode(PlayMode mode) async {
    state = state.copyWith(playMode: mode);
  }

  /// Cycle play modes
  void cyclePlayMode() {
    final modes = PlayMode.values;
    final currentIndex = modes.indexOf(state.playMode);
    final nextMode = modes[(currentIndex + 1) % modes.length];
    state = state.copyWith(playMode: nextMode);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for enhanced audio player with use case integration
final enhancedAudioPlayerProvider =
    StateNotifierProvider<EnhancedAudioPlayerNotifier, AudioPlayerState>((ref) {
  final useCase = ref.watch(audioPlayerUseCaseProvider);
  return EnhancedAudioPlayerNotifier(useCase: useCase);
});
