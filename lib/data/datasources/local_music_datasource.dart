import '../models/music_model.dart';
import '../../core/error/index.dart';
import 'hive_database.dart';

/// Contract for local music data source
abstract class ILocalMusicDataSource {
  Future<List<MusicModel>> getAllMusic();
  Future<MusicModel?> getMusicById(String id);
  Future<MusicModel> addMusic(MusicModel music);
  Future<List<MusicModel>> addMultipleMusic(List<MusicModel> musicList);
  Future<MusicModel> updateMusic(MusicModel music);
  Future<void> deleteMusic(String id);
  Future<void> deleteMultipleMusic(List<String> ids);
  Future<List<MusicModel>> searchMusicByTitle(String query);
  Future<int> getMusicCount();
  Future<List<MusicModel>> getFavoriteMusic();
  Future<MusicModel> toggleFavorite(String id);
  Future<List<MusicModel>> getRecentlyAddedMusic({int limit = 10});
  Future<List<MusicModel>> getRecentlyPlayedMusic({int limit = 10});
  Future<MusicModel> updatePlayStats(String musicId);
  Future<void> clearAllMusic();
}

/// Local music data source implementation using Hive
class LocalMusicDataSource implements ILocalMusicDataSource {
  final HiveDatabase _hiveDatabase;

  LocalMusicDataSource(this._hiveDatabase);

  @override
  Future<List<MusicModel>> getAllMusic() async {
    try {
      appLogger.debug('Fetching all music from local storage');
      final musicList = _hiveDatabase.musicBox.values.toList();
      appLogger.debug('Retrieved ${musicList.length} music tracks');
      return musicList;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching all music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch all music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<MusicModel?> getMusicById(String id) async {
    try {
      appLogger.debug('Fetching music with ID: $id');
      final music = _hiveDatabase.musicBox.get(id);
      if (music != null) {
        appLogger.debug('Found music: ${music.title}');
      } else {
        appLogger.debug('Music with ID $id not found');
      }
      return music;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching music by ID', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<MusicModel> addMusic(MusicModel music) async {
    try {
      appLogger.debug('Adding music: ${music.title}');
      await _hiveDatabase.musicBox.put(music.id, music);
      appLogger.info('✓ Added music: ${music.title}');
      return music;
    } catch (e, stackTrace) {
      appLogger.error('Error adding music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to add music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MusicModel>> addMultipleMusic(List<MusicModel> musicList) async {
    try {
      appLogger.debug('Adding ${musicList.length} music tracks');
      for (final music in musicList) {
        await _hiveDatabase.musicBox.put(music.id, music);
      }
      appLogger.info('✓ Added ${musicList.length} music tracks');
      return musicList;
    } catch (e, stackTrace) {
      appLogger.error('Error adding multiple music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to add music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<MusicModel> updateMusic(MusicModel music) async {
    try {
      appLogger.debug('Updating music: ${music.title}');
      final exists = _hiveDatabase.musicBox.containsKey(music.id);
      if (!exists) {
        throw DatabaseException(
          message: 'Music with ID ${music.id} not found',
        );
      }
      await _hiveDatabase.musicBox.put(music.id, music);
      appLogger.info('✓ Updated music: ${music.title}');
      return music;
    } catch (e, stackTrace) {
      appLogger.error('Error updating music', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to update music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteMusic(String id) async {
    try {
      appLogger.debug('Deleting music with ID: $id');
      final exists = _hiveDatabase.musicBox.containsKey(id);
      if (!exists) {
        throw DatabaseException(
          message: 'Music with ID $id not found',
        );
      }
      await _hiveDatabase.musicBox.delete(id);
      appLogger.info('✓ Deleted music with ID: $id');
    } catch (e, stackTrace) {
      appLogger.error('Error deleting music', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to delete music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteMultipleMusic(List<String> ids) async {
    try {
      appLogger.debug('Deleting ${ids.length} music tracks');
      for (final id in ids) {
        if (_hiveDatabase.musicBox.containsKey(id)) {
          await _hiveDatabase.musicBox.delete(id);
        }
      }
      appLogger.info('✓ Deleted ${ids.length} music tracks');
    } catch (e, stackTrace) {
      appLogger.error('Error deleting multiple music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to delete music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MusicModel>> searchMusicByTitle(String query) async {
    try {
      appLogger.debug('Searching music by title: $query');
      final lowerQuery = query.toLowerCase();
      final results = _hiveDatabase.musicBox.values
          .where((music) => music.title.toLowerCase().contains(lowerQuery))
          .toList();
      appLogger.debug('Found ${results.length} matching music tracks');
      return results;
    } catch (e, stackTrace) {
      appLogger.error('Error searching music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to search music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<int> getMusicCount() async {
    try {
      final count = _hiveDatabase.musicBox.length;
      appLogger.debug('Music count: $count');
      return count;
    } catch (e, stackTrace) {
      appLogger.error('Error getting music count', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to get music count: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MusicModel>> getFavoriteMusic() async {
    try {
      appLogger.debug('Fetching favorite music');
      final favorites = _hiveDatabase.musicBox.values
          .where((music) => music.isFavorite)
          .toList();
      appLogger.debug('Found ${favorites.length} favorite music tracks');
      return favorites;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching favorite music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch favorite music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<MusicModel> toggleFavorite(String id) async {
    try {
      appLogger.debug('Toggling favorite for music ID: $id');
      final music = _hiveDatabase.musicBox.get(id);
      if (music == null) {
        throw DatabaseException(
          message: 'Music with ID $id not found',
        );
      }
      final updated = music.copyWith(isFavorite: !music.isFavorite);
      await _hiveDatabase.musicBox.put(id, updated);
      appLogger.info('✓ Toggled favorite for music: ${updated.title}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error toggling favorite', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to toggle favorite: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MusicModel>> getRecentlyAddedMusic({int limit = 10}) async {
    try {
      appLogger.debug('Fetching recently added music (limit: $limit)');
      final sorted = _hiveDatabase.musicBox.values.toList()
        ..sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      final results = sorted.take(limit).toList();
      appLogger.debug('Retrieved ${results.length} recently added music tracks');
      return results;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching recently added music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch recently added music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MusicModel>> getRecentlyPlayedMusic({int limit = 10}) async {
    try {
      appLogger.debug('Fetching recently played music (limit: $limit)');
      final sorted = _hiveDatabase.musicBox.values.toList()
        ..sort((a, b) => b.lastPlayedAt.compareTo(a.lastPlayedAt));
      final results = sorted
          .where((music) => music.lastPlayedAt > 0)
          .take(limit)
          .toList();
      appLogger.debug('Retrieved ${results.length} recently played music tracks');
      return results;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching recently played music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch recently played music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<MusicModel> updatePlayStats(String musicId) async {
    try {
      appLogger.debug('Updating play stats for music ID: $musicId');
      final music = _hiveDatabase.musicBox.get(musicId);
      if (music == null) {
        throw DatabaseException(
          message: 'Music with ID $musicId not found',
        );
      }
      final now = DateTime.now().millisecondsSinceEpoch;
      final updated = music.copyWith(
        playCount: music.playCount + 1,
        lastPlayedAt: now,
      );
      await _hiveDatabase.musicBox.put(musicId, updated);
      appLogger.info('✓ Updated play stats for music: ${updated.title}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error updating play stats', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to update play stats: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> clearAllMusic() async {
    try {
      appLogger.warning('Clearing all music from local storage');
      await _hiveDatabase.musicBox.clear();
      appLogger.info('✓ Cleared all music');
    } catch (e, stackTrace) {
      appLogger.error('Error clearing all music', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to clear music: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }
}
