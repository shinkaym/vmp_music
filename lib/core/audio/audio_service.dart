import 'package:just_audio/just_audio.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Wrapper around JustAudio player for audio playback functionality
class AudioServiceImpl {
  static final AudioServiceImpl _instance = AudioServiceImpl._internal();

  late final AudioPlayer _audioPlayer;
  bool _isInitialized = false;

  AudioServiceImpl._internal();

  factory AudioServiceImpl() {
    return _instance;
  }

  /// Initialize the audio player
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _audioPlayer = AudioPlayer();
      _isInitialized = true;
      appLogger.info('AudioService initialized successfully');
    } catch (e) {
      appLogger.error('Failed to initialize AudioService', e);
      rethrow;
    }
  }

  /// Get the audio player instance
  AudioPlayer get audioPlayer {
    if (!_isInitialized) {
      throw StateError('AudioService not initialized. Call initialize() first.');
    }
    return _audioPlayer;
  }

  /// Check if service is initialized
  bool get isInitialized => _isInitialized;

  /// Load audio from a file path
  Future<void> loadAudio(String filePath) async {
    try {
      await _audioPlayer.setFilePath(filePath);
      appLogger.info('Audio loaded: $filePath');
    } catch (e) {
      appLogger.error('Failed to load audio: $filePath', e);
      rethrow;
    }
  }

  /// Play audio
  Future<void> play() async {
    try {
      await _audioPlayer.play();
      appLogger.debug('Audio playback started');
    } catch (e) {
      appLogger.error('Failed to play audio', e);
      rethrow;
    }
  }

  /// Pause audio
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
      appLogger.debug('Audio paused');
    } catch (e) {
      appLogger.error('Failed to pause audio', e);
      rethrow;
    }
  }

  /// Stop audio and reset position
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
      appLogger.debug('Audio stopped');
    } catch (e) {
      appLogger.error('Failed to stop audio', e);
      rethrow;
    }
  }

  /// Seek to a specific position
  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
      appLogger.debug('Seeked to ${position.inSeconds}s');
    } catch (e) {
      appLogger.error('Failed to seek', e);
      rethrow;
    }
  }

  /// Set playback speed
  Future<void> setSpeed(double speed) async {
    try {
      await _audioPlayer.setSpeed(speed);
      appLogger.debug('Speed set to $speed');
    } catch (e) {
      appLogger.error('Failed to set speed', e);
      rethrow;
    }
  }

  /// Set volume
  Future<void> setVolume(double volume) async {
    try {
      final clampedVolume = volume.clamp(0.0, 1.0);
      await _audioPlayer.setVolume(clampedVolume);
      appLogger.debug('Volume set to $clampedVolume');
    } catch (e) {
      appLogger.error('Failed to set volume', e);
      rethrow;
    }
  }

  /// Get current position stream
  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  /// Get playback state stream
  Stream<PlaybackEvent> get playbackEventStream => _audioPlayer.playbackEventStream;

  /// Get duration stream
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  /// Get player state stream
  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  /// Get current duration
  Duration? get duration => _audioPlayer.duration;

  /// Get current position
  Duration get position => _audioPlayer.position;

  /// Get current playing state
  bool get isPlaying => _audioPlayer.playing;

  /// Get buffered position
  Duration get bufferedPosition => _audioPlayer.bufferedPosition;

  /// Get playback speed
  double get speed => _audioPlayer.speed;

  /// Get volume
  double get volume => _audioPlayer.volume;

  /// Dispose resources
  Future<void> dispose() async {
    try {
      await _audioPlayer.dispose();
      _isInitialized = false;
      appLogger.i('AudioService disposed');
    } catch (e) {
      appLogger.e('Error disposing AudioService', e);
    }
  }
}
