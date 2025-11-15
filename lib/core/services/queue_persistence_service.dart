import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmp_music/domain/entities/music.dart';

/// Service for persisting queue state to local storage
class QueuePersistenceService {
  static const String _queueKey = 'vmp_queue_items';
  static const String _currentIndexKey = 'vmp_queue_current_index';
  static const String _playbackPositionKey = 'vmp_playback_position';
  static const String _lastPlayedMusicIdKey = 'vmp_last_played_music_id';

  final SharedPreferences _prefs;

  QueuePersistenceService(this._prefs);

  /// Save queue to storage
  Future<bool> saveQueue(List<Music> queue, int currentIndex) async {
    try {
      // Convert Music entities to JSON strings
      final queueJson = queue
          .map((music) => jsonEncode({
                'id': music.id,
                'title': music.title,
                'artist': music.artist,
                'album': music.album,
                'filePath': music.filePath,
                'duration': music.duration,
                'dateAdded': music.dateAdded,
                'format': music.format,
                'isFavorite': music.isFavorite,
                'albumArtPath': music.albumArtPath,
              }))
          .toList();

      await _prefs.setStringList(_queueKey, queueJson);
      await _prefs.setInt(_currentIndexKey, currentIndex);

      return true;
    } catch (e) {
      throw Exception('Failed to save queue: $e');
    }
  }

  /// Load queue from storage
  Future<({List<Music> queue, int currentIndex})> loadQueue() async {
    try {
      final queueJson = _prefs.getStringList(_queueKey) ?? [];
      final currentIndex = _prefs.getInt(_currentIndexKey) ?? 0;

      if (queueJson.isEmpty) {
        final emptyQueue = <Music>[];
        return (queue: emptyQueue, currentIndex: 0);
      }

      // Reconstruct Music objects from JSON
      final List<Music> queue = [];
      for (final jsonStr in queueJson) {
        final json = jsonDecode(jsonStr) as Map<String, dynamic>;
        queue.add(Music(
          id: json['id'] as String,
          title: json['title'] as String,
          artist: json['artist'] as String? ?? 'Unknown Artist',
          album: json['album'] as String? ?? 'Unknown Album',
          filePath: json['filePath'] as String,
          duration: json['duration'] as int,
          dateAdded: json['dateAdded'] as int,
          format: json['format'] as String? ?? 'mp3',
          isFavorite: json['isFavorite'] as bool? ?? false,
          albumArtPath: json['albumArtPath'] as String? ?? '',
        ));
      }

      return (queue: queue, currentIndex: currentIndex);
    } catch (e) {
      throw Exception('Failed to load queue: $e');
    }
  }

  /// Save playback position for current track
  Future<bool> savePlaybackPosition(Duration position) async {
    try {
      await _prefs.setInt(
        _playbackPositionKey,
        position.inMilliseconds,
      );
      return true;
    } catch (e) {
      throw Exception('Failed to save playback position: $e');
    }
  }

  /// Load playback position
  Future<Duration> loadPlaybackPosition() async {
    try {
      final milliseconds = _prefs.getInt(_playbackPositionKey) ?? 0;
      return Duration(milliseconds: milliseconds);
    } catch (e) {
      throw Exception('Failed to load playback position: $e');
    }
  }

  /// Save last played music ID
  Future<bool> saveLastPlayedMusicId(String musicId) async {
    try {
      await _prefs.setString(_lastPlayedMusicIdKey, musicId);
      return true;
    } catch (e) {
      throw Exception('Failed to save last played music ID: $e');
    }
  }

  /// Load last played music ID
  Future<String?> loadLastPlayedMusicId() async {
    try {
      return _prefs.getString(_lastPlayedMusicIdKey);
    } catch (e) {
      throw Exception('Failed to load last played music ID: $e');
    }
  }

  /// Clear all queue persistence data
  Future<bool> clearAll() async {
    try {
      await Future.wait([
        _prefs.remove(_queueKey),
        _prefs.remove(_currentIndexKey),
        _prefs.remove(_playbackPositionKey),
        _prefs.remove(_lastPlayedMusicIdKey),
      ]);
      return true;
    } catch (e) {
      throw Exception('Failed to clear queue data: $e');
    }
  }
}
