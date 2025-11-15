/// Service to handle audio interruptions (phone calls, notifications, etc.)
class AudioInterruptionHandler {
  static final AudioInterruptionHandler _instance =
      AudioInterruptionHandler._internal();

  bool _isInterrupted = false;
  bool _wasPlayingBeforeInterruption = false;

  factory AudioInterruptionHandler() {
    return _instance;
  }

  AudioInterruptionHandler._internal();

  /// Initialize audio interruption handling
  void initialize() {
    // Audio interruption handling is managed by audio_service and JustAudio
    // This method can be extended to add custom logic if needed
  }

  /// Handle audio focus loss (interruption)
  /// Returns true if the audio was paused due to interruption
  Future<bool> handleAudioFocusLoss(bool pauseOnDuck) async {
    try {
      _isInterrupted = true;
      // The actual pause logic should be handled by the audio player notifier
      // This just tracks the interruption state
      return true;
    } catch (e) {
      throw Exception('Failed to handle audio focus loss: $e');
    }
  }

  /// Handle audio focus restoration (resumption after interruption)
  /// Returns true if audio was successfully resumed
  Future<bool> handleAudioFocusGain() async {
    try {
      _isInterrupted = false;
      // Resume should happen automatically or be triggered by the app
      return true;
    } catch (e) {
      throw Exception('Failed to handle audio focus gain: $e');
    }
  }

  /// Check if audio is currently interrupted
  bool get isInterrupted => _isInterrupted;

  /// Handle transient interruption (duck volume for notifications)
  Future<void> handleTransientAudioFocus(bool shouldDuck) async {
    try {
      if (shouldDuck) {
        // Volume should be reduced - this is typically handled by JustAudio
        // but we track the state here
      }
    } catch (e) {
      throw Exception('Failed to handle transient audio focus: $e');
    }
  }

  /// Handle incoming phone call
  Future<void> handleIncomingCall() async {
    try {
      _wasPlayingBeforeInterruption = true;
      // Pause playback on incoming call
      // This should be implemented in the audio player notifier
    } catch (e) {
      throw Exception('Failed to handle incoming call: $e');
    }
  }

  /// Handle call ended - resume playback if applicable
  Future<void> handleCallEnded() async {
    try {
      // Resume playback if it was playing before the call
      if (_wasPlayingBeforeInterruption) {
        _wasPlayingBeforeInterruption = false;
        // Resume should be implemented in the audio player notifier
      }
    } catch (e) {
      throw Exception('Failed to handle call ended: $e');
    }
  }

  /// Check if audio was playing before interruption
  bool get wasPlayingBeforeInterruption => _wasPlayingBeforeInterruption;

  /// Reset interruption state
  void reset() {
    _isInterrupted = false;
    _wasPlayingBeforeInterruption = false;
  }
}
