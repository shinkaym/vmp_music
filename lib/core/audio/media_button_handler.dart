import 'package:audio_service/audio_service.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Callback function type for media button events
typedef MediaButtonCallback = Future<void> Function();

/// Handler for media button events from notifications and lock screen
class MediaButtonHandler {
  static final MediaButtonHandler _instance = MediaButtonHandler._internal();

  // Callbacks for different media actions
  MediaButtonCallback? _onPlay;
  MediaButtonCallback? _onPause;
  MediaButtonCallback? _onSkipNext;
  MediaButtonCallback? _onSkipPrevious;
  MediaButtonCallback? _onSeek;

  factory MediaButtonHandler() {
    return _instance;
  }

  MediaButtonHandler._internal();

  /// Initialize media button handler with callbacks
  void initialize({
    required MediaButtonCallback onPlay,
    required MediaButtonCallback onPause,
    required MediaButtonCallback onSkipNext,
    required MediaButtonCallback onSkipPrevious,
    MediaButtonCallback? onSeek,
  }) {
    _onPlay = onPlay;
    _onPause = onPause;
    _onSkipNext = onSkipNext;
    _onSkipPrevious = onSkipPrevious;
    _onSeek = onSeek;

    appLogger.d('MediaButtonHandler initialized');
  }

  /// Handle play action
  Future<void> handlePlay() async {
    try {
      if (_onPlay != null) {
        await _onPlay!();
        appLogger.d('Play action handled');
      }
    } catch (e) {
      appLogger.e('Error handling play action', e);
    }
  }

  /// Handle pause action
  Future<void> handlePause() async {
    try {
      if (_onPause != null) {
        await _onPause!();
        appLogger.d('Pause action handled');
      }
    } catch (e) {
      appLogger.e('Error handling pause action', e);
    }
  }

  /// Handle skip next action
  Future<void> handleSkipNext() async {
    try {
      if (_onSkipNext != null) {
        await _onSkipNext!();
        appLogger.d('Skip next action handled');
      }
    } catch (e) {
      appLogger.e('Error handling skip next action', e);
    }
  }

  /// Handle skip previous action
  Future<void> handleSkipPrevious() async {
    try {
      if (_onSkipPrevious != null) {
        await _onSkipPrevious!();
        appLogger.d('Skip previous action handled');
      }
    } catch (e) {
      appLogger.e('Error handling skip previous action', e);
    }
  }

  /// Handle seek action
  Future<void> handleSeek(Duration position) async {
    try {
      if (_onSeek != null) {
        await _onSeek!();
        appLogger.d('Seek action handled to ${position.inSeconds}s');
      }
    } catch (e) {
      appLogger.e('Error handling seek action', e);
    }
  }

  /// Check if handler is initialized
  bool get isInitialized =>
      _onPlay != null &&
      _onPause != null &&
      _onSkipNext != null &&
      _onSkipPrevious != null;

  /// Clear all callbacks
  void clearCallbacks() {
    _onPlay = null;
    _onPause = null;
    _onSkipNext = null;
    _onSkipPrevious = null;
    _onSeek = null;
    appLogger.d('MediaButtonHandler callbacks cleared');
  }
}
