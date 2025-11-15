import 'package:just_audio/just_audio.dart';
import 'package:vmp_music/core/audio/audio_service.dart';
import 'package:vmp_music/core/audio/metadata_extractor.dart';
import 'package:vmp_music/core/error/logger.dart';
import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/presentation/providers/audio_player_provider.dart';

/// Use case for managing audio playback
class AudioPlayerUseCase {
  final AudioServiceImpl audioService;
  final MetadataExtractorService metadataService;

  AudioPlayerUseCase({
    required this.audioService,
    required this.metadataExtractorService,
  });

  /// Initialize audio player
  Future<void> initialize() async {
    await audioService.initialize();
    _setupAudioStreams();
  }

  /// Setup listeners for audio player streams
  void _setupAudioStreams() {
    // Listen to position updates
    audioService.positionStream.listen((position) {
      appLogger.d('Position updated: ${position.inSeconds}s');
    });

    // Listen to playback state changes
    audioService.playerStateStream.listen((playerState) {
      appLogger.d('Player state: ${playerState.processingState}');
    });

    // Listen to duration updates
    audioService.durationStream.listen((duration) {
      if (duration != null) {
        appLogger.d('Duration: ${duration.inSeconds}s');
      }
    });
  }

  /// Load and play a music track
  Future<void> playMusic(Music music) async {
    try {
      appLogger.i('Loading music: ${music.title}');
      await audioService.loadAudio(music.path);

      final duration = audioService.duration;
      if (duration != null) {
        appLogger.i('Duration: ${duration.inSeconds}s');
      }

      await audioService.play();
      appLogger.i('Now playing: ${music.title}');
    } catch (e) {
      appLogger.e('Error playing music: ${music.title}', e);
      rethrow;
    }
  }

  /// Pause current playback
  Future<void> pauseMusic() async {
    try {
      await audioService.pause();
      appLogger.i('Music paused');
    } catch (e) {
      appLogger.e('Error pausing music', e);
      rethrow;
    }
  }

  /// Resume current playback
  Future<void> resumeMusic() async {
    try {
      await audioService.play();
      appLogger.i('Music resumed');
    } catch (e) {
      appLogger.e('Error resuming music', e);
      rethrow;
    }
  }

  /// Stop playback
  Future<void> stopMusic() async {
    try {
      await audioService.stop();
      appLogger.i('Music stopped');
    } catch (e) {
      appLogger.e('Error stopping music', e);
      rethrow;
    }
  }

  /// Seek to a specific position
  Future<void> seekToPosition(Duration position) async {
    try {
      await audioService.seek(position);
      appLogger.i('Seeked to: ${position.inSeconds}s');
    } catch (e) {
      appLogger.e('Error seeking', e);
      rethrow;
    }
  }

  /// Set playback speed
  Future<void> setPlaybackSpeed(double speed) async {
    try {
      await audioService.setSpeed(speed);
      appLogger.i('Speed set to: $speed');
    } catch (e) {
      appLogger.e('Error setting speed', e);
      rethrow;
    }
  }

  /// Set volume level
  Future<void> setVolume(double volume) async {
    try {
      await audioService.setVolume(volume);
      appLogger.i('Volume set to: $volume');
    } catch (e) {
      appLogger.e('Error setting volume', e);
      rethrow;
    }
  }

  /// Increase volume by 10%
  Future<void> increaseVolume() async {
    try {
      final newVolume = (audioService.volume + 0.1).clamp(0.0, 1.0);
      await setVolume(newVolume);
    } catch (e) {
      appLogger.e('Error increasing volume', e);
      rethrow;
    }
  }

  /// Decrease volume by 10%
  Future<void> decreaseVolume() async {
    try {
      final newVolume = (audioService.volume - 0.1).clamp(0.0, 1.0);
      await setVolume(newVolume);
    } catch (e) {
      appLogger.e('Error decreasing volume', e);
      rethrow;
    }
  }

  /// Get current duration
  Duration? getDuration() => audioService.duration;

  /// Get current position
  Duration getPosition() => audioService.position;

  /// Get playback progress (0.0 to 1.0)
  double getProgress() {
    final duration = audioService.duration;
    if (duration == null || duration.inMilliseconds == 0) return 0.0;
    return (audioService.position.inMilliseconds /
            duration.inMilliseconds)
        .clamp(0.0, 1.0);
  }

  /// Check if currently playing
  bool isPlaying() => audioService.isPlaying;

  /// Get current volume
  double getVolume() => audioService.volume;

  /// Get current playback speed
  double getSpeed() => audioService.speed;

  /// Get position stream
  Stream<Duration> get positionStream => audioService.positionStream;

  /// Get player state stream
  Stream<PlayerState> get playerStateStream => audioService.playerStateStream;

  /// Get duration stream
  Stream<Duration?> get durationStream => audioService.durationStream;

  /// Extract metadata for a music file
  Future<AudioMetadata> getMetadata(String filePath) async {
    try {
      return await metadataService.extractMetadata(filePath);
    } catch (e) {
      appLogger.e('Error extracting metadata', e);
      rethrow;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await audioService.dispose();
  }
}
