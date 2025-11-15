import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Background audio handler for AudioService
class BackgroundAudioHandler extends BaseAudioHandler {
  final AudioPlayer _audioPlayer;
  bool _disposed = false;

  BackgroundAudioHandler({required AudioPlayer audioPlayer})
      : _audioPlayer = audioPlayer;

  /// Initialize the background audio handler
  Future<void> initialize() async {
    try {
      // Setup audio player state listeners
      _audioPlayer.playerStateStream.listen((playerState) {
        if (!_disposed) {
          playbackState.add(
            playbackState.value.copyWith(
              playing: playerState.playing,
              processingState: _mapProcessingState(playerState.processingState),
            ),
          );
        }
      });

      // Setup position stream
      _audioPlayer.positionStream.listen((position) {
        if (!_disposed) {
          playbackState.add(
            playbackState.value.copyWith(position: position),
          );
        }
      });

      // Setup duration stream
      _audioPlayer.durationStream.listen((duration) {
        if (!_disposed && duration != null) {
          queue.add([
            MediaItem(
              id: '${DateTime.now().millisecondsSinceEpoch}',
              title: playbackState.value.controls.isEmpty
                  ? 'Unknown'
                  : 'Playing',
              duration: duration,
            ),
          ]);

          playbackState.add(
            playbackState.value.copyWith(duration: duration),
          );
        }
      });

      appLogger.i('BackgroundAudioHandler initialized');
    } catch (e) {
      appLogger.e('Error initializing BackgroundAudioHandler', e);
    }
  }

  /// Play audio
  @override
  Future<void> play() => _audioPlayer.play();

  /// Pause audio
  @override
  Future<void> pause() => _audioPlayer.pause();

  /// Stop audio
  @override
  Future<void> stop() => _audioPlayer.stop();

  /// Seek to position
  @override
  Future<void> seek(Duration position) => _audioPlayer.seek(position);

  /// Set speed
  @override
  Future<void> setSpeed(double speed) => _audioPlayer.setSpeed(speed);

  /// Skip to next (placeholder)
  @override
  Future<void> skipToNext() async {
    appLogger.i('Skip to next requested');
  }

  /// Skip to previous (placeholder)
  @override
  Future<void> skipToPrevious() async {
    appLogger.i('Skip to previous requested');
  }

  /// Handle custom action
  @override
  Future<void> customAction(String name, [Map<String, dynamic>? extras]) async {
    appLogger.i('Custom action: $name');
  }

  /// Dispose resources
  Future<void> disposeHandler() async {
    _disposed = true;
    await super.onTaskRemoved();
  }

  /// Map JustAudio processing state to AudioService processing state
  AudioProcessingState _mapProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.idle:
        return AudioProcessingState.idle;
      case ProcessingState.loading:
        return AudioProcessingState.loading;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
    }
  }
}

/// Service to manage background audio playback
class BackgroundAudioService {
  static BackgroundAudioHandler? _handler;
  static bool _initialized = false;

  /// Initialize the background audio service
  static Future<void> initialize(AudioPlayer audioPlayer) async {
    if (_initialized) return;

    try {
      _handler = await AudioService.init(
        builder: () => BackgroundAudioHandler(audioPlayer: audioPlayer),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.ryanheise.audio_service.channel',
          androidNotificationChannelName: 'VMP Music',
          androidNotificationOngoing: true,
          androidShowNotificationBadge: true,
          androidStopForegroundOnPause: false,
          notificationColor: 0xFF2196F3,
        ),
      );
      _initialized = true;
      appLogger.i('BackgroundAudioService initialized');
    } catch (e) {
      appLogger.e('Failed to initialize BackgroundAudioService', e);
      rethrow;
    }
  }

  /// Get the audio handler
  static BackgroundAudioHandler? getHandler() => _handler;

  /// Check if service is initialized
  static bool get isInitialized => _initialized;

  /// Dispose the service
  static Future<void> dispose() async {
    if (_handler != null) {
      await _handler!.disposeHandler();
      _handler = null;
      _initialized = false;
      appLogger.i('BackgroundAudioService disposed');
    }
  }
}
