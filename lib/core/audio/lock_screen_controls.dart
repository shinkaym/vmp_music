import 'package:audio_service/audio_service.dart';
import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Service for managing lock screen media controls
class LockScreenControls {
  static final LockScreenControls _instance = LockScreenControls._internal();

  factory LockScreenControls() {
    return _instance;
  }

  LockScreenControls._internal();

  /// Update lock screen with current music information
  Future<void> updateLockScreen({
    required Music music,
    required Duration position,
    required Duration duration,
    required bool isPlaying,
  }) async {
    try {
      final handler = AudioService.handler;
      if (handler == null) {
        appLogger.w('AudioService handler not initialized');
        return;
      }

      // Create media item for lock screen display
      final mediaItem = MediaItem(
        id: music.id,
        title: music.title,
        artist: music.artist,
        album: music.album,
        duration: Duration(milliseconds: music.duration),
        artUri: music.albumArtPath.isNotEmpty
            ? Uri.parse('file://${music.albumArtPath}')
            : null,
      );

      // Update media item
      await handler.mediaItem.add(mediaItem);

      // Update playback state with controls
      final playbackState = PlaybackState(
        controls: [
          MediaControl.skipToPrevious,
          isPlaying ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: AudioProcessingState.ready,
        playing: isPlaying,
        position: position,
        bufferedPosition: duration,
        speed: 1.0,
      );

      await handler.playbackState.add(playbackState);

      appLogger.d(
        'Lock screen updated: ${music.title} - ${music.artist} '
        '(${position.inSeconds}/${duration.inSeconds}s)',
      );
    } catch (e) {
      appLogger.e('Error updating lock screen', e);
    }
  }

  /// Show lock screen controls
  Future<void> show() async {
    try {
      appLogger.d('Lock screen controls shown');
    } catch (e) {
      appLogger.e('Error showing lock screen controls', e);
    }
  }

  /// Hide lock screen controls
  Future<void> hide() async {
    try {
      await AudioService.stop();
      appLogger.d('Lock screen controls hidden');
    } catch (e) {
      appLogger.e('Error hiding lock screen controls', e);
    }
  }

  /// Update progress on lock screen
  Future<void> updateProgress({
    required Duration position,
    required Duration duration,
    required bool isPlaying,
  }) async {
    try {
      final handler = AudioService.handler;
      if (handler == null) {
        return;
      }

      final playbackState = PlaybackState(
        controls: [
          MediaControl.skipToPrevious,
          isPlaying ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: AudioProcessingState.ready,
        playing: isPlaying,
        position: position,
        bufferedPosition: duration,
        speed: 1.0,
      );

      await handler.playbackState.add(playbackState);
    } catch (e) {
      appLogger.e('Error updating lock screen progress', e);
    }
  }

  /// Check if lock screen controls are supported
  Future<bool> isSupported() async {
    try {
      return AudioService.connected;
    } catch (e) {
      appLogger.e('Error checking lock screen support', e);
      return false;
    }
  }
}
