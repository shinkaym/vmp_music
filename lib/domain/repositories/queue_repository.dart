import 'package:vmp_music/domain/entities/queue.dart';

/// Repository interface for queue-related operations
/// Defines contract for queue data access, independent of implementation
abstract class IQueueRepository {
  /// Get the current playback queue
  /// Returns the current queue or null if not initialized
  Future<Queue?> getQueue();

  /// Create a new queue
  /// Returns the created queue
  /// Throws [AppException] on failure
  Future<Queue> createQueue(Queue queue);

  /// Update the queue
  /// Returns the updated queue
  /// Throws [AppException] on failure
  Future<Queue> updateQueue(Queue queue);

  /// Add a music track to the queue
  /// [musicId] the ID of the music to add
  /// [position] optional position to insert at (default: end of queue)
  /// Returns the updated queue
  /// Throws [AppException] on failure
  Future<Queue> addMusicToQueue(String musicId, {int? position});

  /// Add multiple music tracks to the queue
  /// [musicIds] list of music IDs to add
  /// [position] optional position to insert at (default: end of queue)
  /// Returns the updated queue
  Future<Queue> addMultipleMusicToQueue(List<String> musicIds, {int? position});

  /// Remove a music track from the queue
  /// [musicId] the ID of the music to remove
  /// Returns the updated queue
  /// Throws [AppException] if music not in queue
  Future<Queue> removeMusicFromQueue(String musicId);

  /// Remove music at specific index from queue
  /// [index] the index of the music to remove
  /// Returns the updated queue
  /// Throws [AppException] if index is invalid
  Future<Queue> removeMusicAtIndex(int index);

  /// Clear the entire queue
  /// Returns the empty queue
  Future<Queue> clearQueue();

  /// Set the current position in the queue
  /// [index] the new position index
  /// Returns the updated queue
  /// Throws [AppException] if index is invalid
  Future<Queue> setCurrentPosition(int index);

  /// Move to next track in queue
  /// Returns the updated queue
  /// Throws [AppException] if no next track available
  Future<Queue> moveToNext();

  /// Move to previous track in queue
  /// Returns the updated queue
  /// Throws [AppException] if no previous track available
  Future<Queue> moveToPrevious();

  /// Reorder queue by moving music from one position to another
  /// [fromIndex] current position of the music
  /// [toIndex] new position for the music
  /// Returns the updated queue
  /// Throws [AppException] if indices are invalid
  Future<Queue> reorderQueue(int fromIndex, int toIndex);

  /// Shuffle the queue (randomize order while keeping current track)
  /// Returns the updated queue
  Future<Queue> shuffleQueue();

  /// Replace entire queue with new music list
  /// [musicIds] list of music IDs for the new queue
  /// [startFromIndex] optional starting index (default: 0)
  /// Returns the updated queue
  Future<Queue> replaceQueue(List<String> musicIds, {int startFromIndex = 0});

  /// Get total songs in queue
  Future<int> getQueueLength();

  /// Check if queue has any songs
  Future<bool> isQueueEmpty();

  /// Delete the queue
  /// Throws [AppException] on failure
  Future<void> deleteQueue();
}
