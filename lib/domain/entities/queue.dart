import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue.freezed.dart';

/// Domain entity representing the playback queue
/// Independent of persistence layer, used for business logic
@freezed
class Queue with _$Queue {
  const factory Queue({
    /// Unique identifier for the queue
    required String id,

    /// List of music IDs in queue order
    @Default([])
    List<String> musicIds,

    /// Current position index in the queue
    @Default(0)
    int currentIndex,

    /// Date when queue was created (Unix timestamp)
    required int createdAt,

    /// Date when queue was last modified (Unix timestamp)
    required int modifiedAt,
  }) = _Queue;

  const Queue._();

  /// Get current music ID if queue is not empty
  String? get currentMusicId =>
      currentIndex >= 0 && currentIndex < musicIds.length ? musicIds[currentIndex] : null;

  /// Get next music ID if available
  String? get nextMusicId =>
      (currentIndex + 1) < musicIds.length ? musicIds[currentIndex + 1] : null;

  /// Get previous music ID if available
  String? get previousMusicId => currentIndex > 0 ? musicIds[currentIndex - 1] : null;

  /// Check if queue is empty
  bool get isEmpty => musicIds.isEmpty;

  /// Check if queue has songs
  bool get isNotEmpty => musicIds.isNotEmpty;

  /// Check if can play next (more songs available after current)
  bool get hasNext => currentIndex < (musicIds.length - 1);

  /// Check if can play previous (songs before current)
  bool get hasPrevious => currentIndex > 0;

  /// Get total number of songs in queue
  int get totalSongs => musicIds.length;

  /// Get remaining songs count from current position
  int get remainingSongs => (musicIds.length - 1) - currentIndex;
}
