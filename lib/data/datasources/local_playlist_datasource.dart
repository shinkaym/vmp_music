import '../models/playlist_model.dart';
import '../../core/error/index.dart';
import 'hive_database.dart';

/// Contract for local playlist data source
abstract class ILocalPlaylistDataSource {
  Future<List<PlaylistModel>> getAllPlaylists();
  Future<PlaylistModel?> getPlaylistById(String id);
  Future<PlaylistModel> createPlaylist(PlaylistModel playlist);
  Future<PlaylistModel> updatePlaylist(PlaylistModel playlist);
  Future<void> deletePlaylist(String id);
  Future<void> deleteMultiplePlaylists(List<String> ids);
  Future<PlaylistModel> addMusicToPlaylist(String playlistId, String musicId);
  Future<PlaylistModel> addMultipleMusicToPlaylist(
    String playlistId,
    List<String> musicIds,
  );
  Future<PlaylistModel> removeMusicFromPlaylist(String playlistId, String musicId);
  Future<PlaylistModel> removeMultipleMusicFromPlaylist(
    String playlistId,
    List<String> musicIds,
  );
  Future<PlaylistModel> reorderPlaylistMusic(
    String playlistId,
    String musicId,
    int newIndex,
  );
  Future<bool> isMusicInPlaylist(String playlistId, String musicId);
  Future<int> getPlaylistCount();
  Future<List<PlaylistModel>> getFavoritePlaylists();
  Future<PlaylistModel> toggleFavorite(String id);
  Future<List<PlaylistModel>> searchPlaylistsByName(String query);
  Future<void> clearAllPlaylists();
}

/// Local playlist data source implementation using Hive
class LocalPlaylistDataSource implements ILocalPlaylistDataSource {
  final HiveDatabase _hiveDatabase;

  LocalPlaylistDataSource(this._hiveDatabase);

  @override
  Future<List<PlaylistModel>> getAllPlaylists() async {
    try {
      appLogger.debug('Fetching all playlists from local storage');
      final playlists = _hiveDatabase.playlistBox.values.toList();
      appLogger.debug('Retrieved ${playlists.length} playlists');
      return playlists;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching all playlists', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch all playlists: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel?> getPlaylistById(String id) async {
    try {
      appLogger.debug('Fetching playlist with ID: $id');
      final playlist = _hiveDatabase.playlistBox.get(id);
      if (playlist != null) {
        appLogger.debug('Found playlist: ${playlist.name}');
      } else {
        appLogger.debug('Playlist with ID $id not found');
      }
      return playlist;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching playlist by ID', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> createPlaylist(PlaylistModel playlist) async {
    try {
      appLogger.debug('Creating playlist: ${playlist.name}');
      await _hiveDatabase.playlistBox.put(playlist.id, playlist);
      appLogger.info('✓ Created playlist: ${playlist.name}');
      return playlist;
    } catch (e, stackTrace) {
      appLogger.error('Error creating playlist', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to create playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> updatePlaylist(PlaylistModel playlist) async {
    try {
      appLogger.debug('Updating playlist: ${playlist.name}');
      final exists = _hiveDatabase.playlistBox.containsKey(playlist.id);
      if (!exists) {
        throw DatabaseException(
          message: 'Playlist with ID ${playlist.id} not found',
        );
      }
      await _hiveDatabase.playlistBox.put(playlist.id, playlist);
      appLogger.info('✓ Updated playlist: ${playlist.name}');
      return playlist;
    } catch (e, stackTrace) {
      appLogger.error('Error updating playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to update playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deletePlaylist(String id) async {
    try {
      appLogger.debug('Deleting playlist with ID: $id');
      final exists = _hiveDatabase.playlistBox.containsKey(id);
      if (!exists) {
        throw DatabaseException(
          message: 'Playlist with ID $id not found',
        );
      }
      await _hiveDatabase.playlistBox.delete(id);
      appLogger.info('✓ Deleted playlist with ID: $id');
    } catch (e, stackTrace) {
      appLogger.error('Error deleting playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to delete playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteMultiplePlaylists(List<String> ids) async {
    try {
      appLogger.debug('Deleting ${ids.length} playlists');
      for (final id in ids) {
        if (_hiveDatabase.playlistBox.containsKey(id)) {
          await _hiveDatabase.playlistBox.delete(id);
        }
      }
      appLogger.info('✓ Deleted ${ids.length} playlists');
    } catch (e, stackTrace) {
      appLogger.error('Error deleting multiple playlists', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to delete playlists: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> addMusicToPlaylist(
    String playlistId,
    String musicId,
  ) async {
    try {
      appLogger.debug('Adding music $musicId to playlist $playlistId');
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      if (playlist.musicIds.contains(musicId)) {
        appLogger.warning('Music $musicId already in playlist $playlistId');
        return playlist;
      }
      final updated = playlist.copyWith(
        musicIds: [...playlist.musicIds, musicId],
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _hiveDatabase.playlistBox.put(playlistId, updated);
      appLogger.info('✓ Added music to playlist: ${playlist.name}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error adding music to playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to add music to playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> addMultipleMusicToPlaylist(
    String playlistId,
    List<String> musicIds,
  ) async {
    try {
      appLogger.debug('Adding ${musicIds.length} music tracks to playlist $playlistId');
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      final newMusicIds = <String>{...playlist.musicIds, ...musicIds}.toList();
      final updated = playlist.copyWith(
        musicIds: newMusicIds,
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _hiveDatabase.playlistBox.put(playlistId, updated);
      appLogger.info('✓ Added ${musicIds.length} music tracks to playlist: ${playlist.name}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error adding multiple music to playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to add music to playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> removeMusicFromPlaylist(
    String playlistId,
    String musicId,
  ) async {
    try {
      appLogger.debug('Removing music $musicId from playlist $playlistId');
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      final updated = playlist.copyWith(
        musicIds: playlist.musicIds.where((id) => id != musicId).toList(),
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _hiveDatabase.playlistBox.put(playlistId, updated);
      appLogger.info('✓ Removed music from playlist: ${playlist.name}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error removing music from playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to remove music from playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> removeMultipleMusicFromPlaylist(
    String playlistId,
    List<String> musicIds,
  ) async {
    try {
      appLogger.debug('Removing ${musicIds.length} music tracks from playlist $playlistId');
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      final musicIdSet = musicIds.toSet();
      final updated = playlist.copyWith(
        musicIds: playlist.musicIds
            .where((id) => !musicIdSet.contains(id))
            .toList(),
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _hiveDatabase.playlistBox.put(playlistId, updated);
      appLogger.info('✓ Removed ${musicIds.length} music tracks from playlist: ${playlist.name}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error removing multiple music from playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to remove music from playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> reorderPlaylistMusic(
    String playlistId,
    String musicId,
    int newIndex,
  ) async {
    try {
      appLogger.debug('Reordering music $musicId in playlist $playlistId to index $newIndex');
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      final musicIds = List<String>.from(playlist.musicIds);
      final currentIndex = musicIds.indexOf(musicId);
      if (currentIndex == -1) {
        throw DatabaseException(
          message: 'Music with ID $musicId not found in playlist',
        );
      }
      if (newIndex < 0 || newIndex >= musicIds.length) {
        throw DatabaseException(
          message: 'Invalid index $newIndex',
        );
      }
      musicIds.removeAt(currentIndex);
      musicIds.insert(newIndex, musicId);
      final updated = playlist.copyWith(
        musicIds: musicIds,
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _hiveDatabase.playlistBox.put(playlistId, updated);
      appLogger.info('✓ Reordered music in playlist: ${playlist.name}');
      return updated;
    } catch (e, stackTrace) {
      appLogger.error('Error reordering music in playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to reorder music in playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> isMusicInPlaylist(String playlistId, String musicId) async {
    try {
      final playlist = _hiveDatabase.playlistBox.get(playlistId);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $playlistId not found',
        );
      }
      return playlist.musicIds.contains(musicId);
    } catch (e, stackTrace) {
      appLogger.error('Error checking music in playlist', e, stackTrace);
      if (e is DatabaseException) rethrow;
      throw DatabaseException(
        message: 'Failed to check music in playlist: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<int> getPlaylistCount() async {
    try {
      final count = _hiveDatabase.playlistBox.length;
      appLogger.debug('Playlist count: $count');
      return count;
    } catch (e, stackTrace) {
      appLogger.error('Error getting playlist count', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to get playlist count: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<PlaylistModel>> getFavoritePlaylists() async {
    try {
      appLogger.debug('Fetching favorite playlists');
      final favorites = _hiveDatabase.playlistBox.values
          .where((playlist) => playlist.isFavorite)
          .toList();
      appLogger.debug('Found ${favorites.length} favorite playlists');
      return favorites;
    } catch (e, stackTrace) {
      appLogger.error('Error fetching favorite playlists', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to fetch favorite playlists: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<PlaylistModel> toggleFavorite(String id) async {
    try {
      appLogger.debug('Toggling favorite for playlist ID: $id');
      final playlist = _hiveDatabase.playlistBox.get(id);
      if (playlist == null) {
        throw DatabaseException(
          message: 'Playlist with ID $id not found',
        );
      }
      final updated = playlist.copyWith(isFavorite: !playlist.isFavorite);
      await _hiveDatabase.playlistBox.put(id, updated);
      appLogger.info('✓ Toggled favorite for playlist: ${updated.name}');
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
  Future<List<PlaylistModel>> searchPlaylistsByName(String query) async {
    try {
      appLogger.debug('Searching playlists by name: $query');
      final lowerQuery = query.toLowerCase();
      final results = _hiveDatabase.playlistBox.values
          .where((playlist) => playlist.name.toLowerCase().contains(lowerQuery))
          .toList();
      appLogger.debug('Found ${results.length} matching playlists');
      return results;
    } catch (e, stackTrace) {
      appLogger.error('Error searching playlists', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to search playlists: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> clearAllPlaylists() async {
    try {
      appLogger.warning('Clearing all playlists from local storage');
      await _hiveDatabase.playlistBox.clear();
      appLogger.info('✓ Cleared all playlists');
    } catch (e, stackTrace) {
      appLogger.error('Error clearing all playlists', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to clear playlists: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }
}
