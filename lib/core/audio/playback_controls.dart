import 'package:vmp_music/core/error/logger.dart';

/// Enum for repeat modes
enum RepeatMode {
  none,
  one,
  all,
}

/// Enum for shuffle state
enum ShuffleMode {
  off,
  on,
}

/// Playback controls manager
class PlaybackControls {
  RepeatMode _repeatMode = RepeatMode.none;
  ShuffleMode _shuffleMode = ShuffleMode.off;

  PlaybackControls();

  /// Get current repeat mode
  RepeatMode get repeatMode => _repeatMode;

  /// Get current shuffle mode
  ShuffleMode get shuffleMode => _shuffleMode;

  /// Set repeat mode
  void setRepeatMode(RepeatMode mode) {
    _repeatMode = mode;
    appLogger.d('RepeatMode set to: ${mode.name}');
  }

  /// Cycle through repeat modes
  RepeatMode cycleRepeatMode() {
    final modes = RepeatMode.values;
    final currentIndex = modes.indexOf(_repeatMode);
    _repeatMode = modes[(currentIndex + 1) % modes.length];
    appLogger.d('RepeatMode cycled to: ${_repeatMode.name}');
    return _repeatMode;
  }

  /// Toggle shuffle mode
  ShuffleMode toggleShuffle() {
    _shuffleMode = _shuffleMode == ShuffleMode.off
        ? ShuffleMode.on
        : ShuffleMode.off;
    appLogger.d('ShuffleMode toggled to: ${_shuffleMode.name}');
    return _shuffleMode;
  }

  /// Set shuffle mode
  void setShuffleMode(ShuffleMode mode) {
    _shuffleMode = mode;
    appLogger.d('ShuffleMode set to: ${mode.name}');
  }

  /// Check if shuffle is enabled
  bool get isShuffleEnabled => _shuffleMode == ShuffleMode.on;

  /// Check if repeat one is enabled
  bool get isRepeatOneEnabled => _repeatMode == RepeatMode.one;

  /// Check if repeat all is enabled
  bool get isRepeatAllEnabled => _repeatMode == RepeatMode.all;

  /// Reset controls
  void reset() {
    _repeatMode = RepeatMode.none;
    _shuffleMode = ShuffleMode.off;
    appLogger.d('PlaybackControls reset');
  }
}

/// Queue navigator for handling next/previous track logic
class QueueNavigator {
  final List<String> _queue;
  int _currentIndex = 0;
  final PlaybackControls controls;

  QueueNavigator({
    required List<String> queue,
    required this.controls,
  }) : _queue = List.from(queue);

  /// Get current track ID
  String? get currentTrack =>
      _currentIndex >= 0 && _currentIndex < _queue.length
          ? _queue[_currentIndex]
          : null;

  /// Get current index
  int get currentIndex => _currentIndex;

  /// Get queue size
  int get queueSize => _queue.length;

  /// Update queue
  void setQueue(List<String> newQueue) {
    _queue.clear();
    _queue.addAll(newQueue);
    _currentIndex = 0;
    appLogger.d('Queue updated with ${newQueue.length} items');
  }

  /// Get next track
  String? getNextTrack() {
    if (_queue.isEmpty) return null;

    // If repeat one, return current track
    if (controls.isRepeatOneEnabled) {
      return _queue[_currentIndex];
    }

    // Calculate next index
    int nextIndex = _currentIndex + 1;

    // If repeat all is enabled and we're at the end, loop back
    if (nextIndex >= _queue.length) {
      if (controls.isRepeatAllEnabled) {
        nextIndex = 0;
      } else {
        return null; // No next track
      }
    }

    return _queue[nextIndex];
  }

  /// Move to next track
  String? moveToNext() {
    if (_queue.isEmpty) return null;

    // If repeat one, stay on current track
    if (controls.isRepeatOneEnabled) {
      return _queue[_currentIndex];
    }

    // Move to next
    _currentIndex++;

    // Handle end of queue
    if (_currentIndex >= _queue.length) {
      if (controls.isRepeatAllEnabled) {
        _currentIndex = 0;
      } else {
        _currentIndex = _queue.length - 1;
        return null; // No next available
      }
    }

    appLogger.d('Moved to next: $_currentIndex');
    return _queue[_currentIndex];
  }

  /// Move to previous track
  String? moveToPrevious() {
    if (_queue.isEmpty) return null;

    _currentIndex--;

    if (_currentIndex < 0) {
      _currentIndex = 0;
      return null;
    }

    appLogger.d('Moved to previous: $_currentIndex');
    return _queue[_currentIndex];
  }

  /// Jump to specific index
  String? jumpToIndex(int index) {
    if (index < 0 || index >= _queue.length) {
      return null;
    }

    _currentIndex = index;
    appLogger.d('Jumped to index: $_currentIndex');
    return _queue[_currentIndex];
  }

  /// Get shuffled queue
  List<String> getShuffledQueue() {
    final shuffled = List.from(_queue);
    shuffled.shuffle();
    appLogger.d('Queue shuffled');
    return shuffled;
  }

  /// Check if at end of queue
  bool get isAtQueueEnd => _currentIndex >= _queue.length - 1;

  /// Check if at start of queue
  bool get isAtQueueStart => _currentIndex <= 0;

  /// Reset navigator
  void reset() {
    _currentIndex = 0;
    _queue.clear();
    appLogger.d('QueueNavigator reset');
  }
}
