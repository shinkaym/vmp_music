import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/core/audio/media_button_handler.dart';
import 'package:vmp_music/core/audio/lock_screen_controls.dart';
import 'package:vmp_music/core/audio/notification_service.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Unified notification manager for both notifications and lock screen controls
class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();

  final NotificationService _notificationService = NotificationService();
  final LockScreenControls _lockScreenControls = LockScreenControls();
  final MediaButtonHandler _mediaButtonHandler = MediaButtonHandler();

  factory NotificationManager() {
    return _instance;
  }

  NotificationManager._internal();

  /// Initialize notification manager with media button callbacks
  Future<void> initialize({
    required Future<void> Function() onPlay,
    required Future<void> Function() onPause,
    required Future<void> Function() onSkipNext,
    required Future<void> Function() onSkipPrevious,
    Future<void> Function()? onSeek,
  }) async {
    try {
      _mediaButtonHandler.initialize(
        onPlay: onPlay,
        onPause: onPause,
        onSkipNext: onSkipNext,
        onSkipPrevious: onSkipPrevious,
        onSeek: onSeek,
      );

      appLogger.d('NotificationManager initialized');
    } catch (e) {
      appLogger.e('Error initializing NotificationManager', e);
    }
  }

  /// Update both notification and lock screen with music info
  Future<void> updatePlayback({
    required Music music,
    required Duration position,
    required Duration duration,
    required bool isPlaying,
  }) async {
    try {
      // Update lock screen controls
      await _lockScreenControls.updateLockScreen(
        music: music,
        position: position,
        duration: duration,
        isPlaying: isPlaying,
      );

      // Update notification
      await _notificationService.updateNotification(
        title: music.title,
        artist: music.artist,
        duration: duration,
        position: position,
        isPlaying: isPlaying,
      );

      appLogger.d('Playback info updated on both notification and lock screen');
    } catch (e) {
      appLogger.e('Error updating playback info', e);
    }
  }

  /// Update only progress information
  Future<void> updateProgress({
    required Duration position,
    required Duration duration,
    required bool isPlaying,
  }) async {
    try {
      await _lockScreenControls.updateProgress(
        position: position,
        duration: duration,
        isPlaying: isPlaying,
      );

      appLogger.d('Progress updated');
    } catch (e) {
      appLogger.e('Error updating progress', e);
    }
  }

  /// Show notification and lock screen controls
  Future<void> show() async {
    try {
      await _lockScreenControls.show();
      appLogger.d('Notification and lock screen controls shown');
    } catch (e) {
      appLogger.e('Error showing notification', e);
    }
  }

  /// Hide notification and lock screen controls
  Future<void> hide() async {
    try {
      await _lockScreenControls.hide();
      appLogger.d('Notification and lock screen controls hidden');
    } catch (e) {
      appLogger.e('Error hiding notification', e);
    }
  }

  /// Handle media button press
  Future<void> handleMediaButtonPress(String action) async {
    try {
      switch (action) {
        case 'play':
          await _mediaButtonHandler.handlePlay();
        case 'pause':
          await _mediaButtonHandler.handlePause();
        case 'next':
          await _mediaButtonHandler.handleSkipNext();
        case 'previous':
          await _mediaButtonHandler.handleSkipPrevious();
        default:
          appLogger.w('Unknown media button action: $action');
      }
    } catch (e) {
      appLogger.e('Error handling media button press', e);
    }
  }

  /// Check if notification is supported
  Future<bool> isSupported() async {
    try {
      return await _lockScreenControls.isSupported();
    } catch (e) {
      appLogger.e('Error checking notification support', e);
      return false;
    }
  }

  /// Get media button handler
  MediaButtonHandler get mediaButtonHandler => _mediaButtonHandler;

  /// Get lock screen controls
  LockScreenControls get lockScreenControls => _lockScreenControls;

  /// Get notification service
  NotificationService get notificationService => _notificationService;

  /// Cleanup resources
  void dispose() {
    try {
      _mediaButtonHandler.clearCallbacks();
      appLogger.d('NotificationManager disposed');
    } catch (e) {
      appLogger.e('Error disposing NotificationManager', e);
    }
  }
}
