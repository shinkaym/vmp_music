import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmp_music/core/services/queue_persistence_service.dart';
import 'package:vmp_music/domain/entities/music.dart';

/// Queue manager service that handles both in-memory and persistent queue operations
class QueueManager {
  final QueuePersistenceService _persistenceService;

  QueueManager(this._persistenceService);

  /// Create QueueManager from SharedPreferences
  static Future<QueueManager> create() async {
    final prefs = await SharedPreferences.getInstance();
    return QueueManager(QueuePersistenceService(prefs));
  }

  /// Save queue state to persistent storage
  Future<void> saveQueue(List<Music> queue, int currentIndex) async {
    await _persistenceService.saveQueue(queue, currentIndex);
  }

  /// Load queue state from persistent storage
  Future<({List<Music> queue, int currentIndex})> loadQueue() async {
    return await _persistenceService.loadQueue();
  }

  /// Save current playback position
  Future<void> savePlaybackPosition(Duration position) async {
    await _persistenceService.savePlaybackPosition(position);
  }

  /// Load saved playback position
  Future<Duration> loadPlaybackPosition() async {
    return await _persistenceService.loadPlaybackPosition();
  }

  /// Save the ID of the last played music
  Future<void> saveLastPlayedMusicId(String musicId) async {
    await _persistenceService.saveLastPlayedMusicId(musicId);
  }

  /// Load the ID of the last played music
  Future<String?> loadLastPlayedMusicId() async {
    return await _persistenceService.loadLastPlayedMusicId();
  }

  /// Clear all persistent queue data
  Future<void> clearAllData() async {
    await _persistenceService.clearAll();
  }

  /// Check if queue has saved state
  Future<bool> hasSavedQueue() async {
    final queue = await _persistenceService.loadQueue();
    return queue.queue.isNotEmpty;
  }
}
