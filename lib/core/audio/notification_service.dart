import 'package:audio_service/audio_service.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Service for managing audio notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  /// Update notification with current playback info
  Future<void> updateNotification({
    required String title,
    required String artist,
    required Duration duration,
    required Duration position,
    required bool isPlaying,
  }) async {
    try {
      final audioHandler = AudioService.handler;
      if (audioHandler == null) {
        appLogger.w('AudioService handler not initialized');
        return;
      }

      // Update media item
      final mediaItem = MediaItem(
        id: 'current',
        title: title,
        artist: artist,
        duration: duration,
      );

      await audioHandler.mediaItem.add(mediaItem);

      // Update playback state
      await audioHandler.playbackState.add(
        PlaybackState(
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
        ),
      );

      appLogger.d('Notification updated: $title - $artist');
    } catch (e) {
      appLogger.e('Error updating notification', e);
    }
  }

  /// Show simple notification
  Future<void> showNotification({
    required String title,
    required String message,
  }) async {
    try {
      final audioHandler = AudioService.handler;
      if (audioHandler == null) {
        appLogger.w('AudioService handler not initialized');
        return;
      }

      final mediaItem = MediaItem(
        id: 'notification',
        title: title,
        artist: message,
      );

      await audioHandler.mediaItem.add(mediaItem);
      appLogger.d('Notification shown: $title - $message');
    } catch (e) {
      appLogger.e('Error showing notification', e);
    }
  }

  /// Hide notification
  Future<void> hideNotification() async {
    try {
      await AudioService.stop();
      appLogger.d('Notification hidden');
    } catch (e) {
      appLogger.e('Error hiding notification', e);
    }
  }

  /// Get current notification state
  Stream<PlaybackState> get playbackStateStream {
    final handler = AudioService.handler;
    if (handler == null) {
      throw StateError('AudioService handler not initialized');
    }
    return handler.playbackState;
  }

  /// Get current media item
  Stream<MediaItem?> get mediaItemStream {
    final handler = AudioService.handler;
    if (handler == null) {
      throw StateError('AudioService handler not initialized');
    }
    return handler.mediaItem;
  }

  /// Check if service is active
  static Future<bool> isServiceRunning() async {
    return AudioService.running;
  }
}
