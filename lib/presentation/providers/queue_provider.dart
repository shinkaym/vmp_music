import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:vmp_music/domain/entities/music.dart';

/// State for playback queue
class QueueState {
  final List<Music> queue;
  final int currentIndex;
  final bool isLoading;
  final String? error;

  const QueueState({
    this.queue = const [],
    this.currentIndex = 0,
    this.isLoading = false,
    this.error,
  });

  QueueState copyWith({
    List<Music>? queue,
    int? currentIndex,
    bool? isLoading,
    String? error,
  }) {
    return QueueState(
      queue: queue ?? this.queue,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// Get current music in queue
  Music? get currentMusic {
    if (currentIndex >= 0 && currentIndex < queue.length) {
      return queue[currentIndex];
    }
    return null;
  }

  /// Get next music in queue
  Music? get nextMusic {
    final nextIndex = currentIndex + 1;
    if (nextIndex >= 0 && nextIndex < queue.length) {
      return queue[nextIndex];
    }
    return null;
  }

  /// Get previous music in queue
  Music? get previousMusic {
    final prevIndex = currentIndex - 1;
    if (prevIndex >= 0 && prevIndex < queue.length) {
      return queue[prevIndex];
    }
    return null;
  }

  /// Check if there is a next song
  bool get hasNext => currentIndex < queue.length - 1;

  /// Check if there is a previous song
  bool get hasPrevious => currentIndex > 0;
}

/// Notifier for managing playback queue
/// Note: Queue management is done locally without database persistence for now.
/// Database persistence will be added when queue repository is implemented.
class QueueNotifier extends StateNotifier<QueueState> {
  QueueNotifier() : super(const QueueState());

  /// Replace entire queue with new music list
  void replaceQueue(List<Music> musicList, {int startIndex = 0}) {
    try {
      state = state.copyWith(
        queue: musicList,
        currentIndex: startIndex.clamp(0, musicList.isEmpty ? 0 : musicList.length - 1),
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to replace queue: ${e.toString()}',
      );
    }
  }

  /// Add a music to the queue
  void addToQueue(Music music, {bool insertAtNext = false}) {
    try {
      if (insertAtNext && state.currentIndex >= 0) {
        // Insert right after current music
        final newQueue = [...state.queue];
        newQueue.insert(state.currentIndex + 1, music);
        state = state.copyWith(queue: newQueue);
      } else {
        // Add to end of queue
        state = state.copyWith(queue: [...state.queue, music]);
      }
    } catch (e) {
      state = state.copyWith(error: 'Failed to add to queue: ${e.toString()}');
    }
  }

  /// Add multiple musics to the queue
  void addMultipleToQueue(List<Music> musicList) {
    try {
      state = state.copyWith(queue: [...state.queue, ...musicList]);
    } catch (e) {
      state = state.copyWith(error: 'Failed to add multiple to queue: ${e.toString()}');
    }
  }

  /// Remove a music from queue by index
  void removeFromQueue(int index) {
    if (index < 0 || index >= state.queue.length) {
      return;
    }

    try {
      final newQueue = [...state.queue];
      newQueue.removeAt(index);

      // Adjust current index if needed
      int newIndex = state.currentIndex;
      if (index < state.currentIndex) {
        newIndex--;
      } else if (index == state.currentIndex && newIndex >= newQueue.length) {
        newIndex = newQueue.length - 1;
      }

      state = state.copyWith(
        queue: newQueue,
        currentIndex: newIndex.clamp(0, newQueue.isEmpty ? 0 : newQueue.length - 1),
      );
    } catch (e) {
      state = state.copyWith(error: 'Failed to remove from queue: ${e.toString()}');
    }
  }

  /// Clear the entire queue
  void clearQueue() {
    try {
      state = state.copyWith(
        queue: [],
        currentIndex: 0,
      );
    } catch (e) {
      state = state.copyWith(error: 'Failed to clear queue: ${e.toString()}');
    }
  }

  /// Move to next music in queue
  void moveToNext() {
    if (state.hasNext) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  /// Move to previous music in queue
  void moveToPrevious() {
    if (state.hasPrevious) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  /// Jump to specific index in queue
  void jumpToIndex(int index) {
    if (index >= 0 && index < state.queue.length) {
      state = state.copyWith(currentIndex: index);
    }
  }

  /// Reorder queue items
  void reorderQueue(int oldIndex, int newIndex) {
    try {
      final newQueue = [...state.queue];
      final music = newQueue.removeAt(oldIndex);
      newQueue.insert(newIndex, music);

      // Update current index if it was affected
      int newCurrentIndex = state.currentIndex;
      if (oldIndex == state.currentIndex) {
        newCurrentIndex = newIndex;
      } else if (oldIndex < state.currentIndex && newIndex >= state.currentIndex) {
        newCurrentIndex--;
      } else if (oldIndex > state.currentIndex && newIndex <= state.currentIndex) {
        newCurrentIndex++;
      }

      state = state.copyWith(
        queue: newQueue,
        currentIndex: newCurrentIndex,
      );
    } catch (e) {
      state = state.copyWith(error: 'Failed to reorder queue: ${e.toString()}');
    }
  }

  /// Shuffle the queue
  void shuffleQueue() {
    try {
      final newQueue = [...state.queue];
      newQueue.shuffle();

      // Keep current music at current position if it was playing
      if (state.currentMusic != null) {
        final currentMusic = state.currentMusic!;
        newQueue.remove(currentMusic);
        newQueue.insert(state.currentIndex, currentMusic);
      }

      state = state.copyWith(queue: newQueue);
    } catch (e) {
      state = state.copyWith(error: 'Failed to shuffle queue: ${e.toString()}');
    }
  }

  /// Clear all errors
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for queue state and notifier
final queueProvider =
    StateNotifierProvider<QueueNotifier, QueueState>((ref) {
  return QueueNotifier();
});
