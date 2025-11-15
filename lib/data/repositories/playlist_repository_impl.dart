import '../datasources/local_playlist_datasource.dart';
import '../extensions/model_entity_extension.dart';
import '../../domain/entities/playlist.dart';
import '../../domain/repositories/playlist_repository.dart';

/// Playlist repository implementation using local data source
class PlaylistRepositoryImpl implements IPlaylistRepository {
  final ILocalPlaylistDataSource _localDataSource;

  PlaylistRepositoryImpl(this._localDataSource);

  @override
  Future<List<Playlist>> getAllPlaylists() async {
    final models = await _localDataSource.getAllPlaylists();
    return models.toEntities();
  }

  @override
  Future<Playlist?> getPlaylistById(String id) async {
    final model = await _localDataSource.getPlaylistById(id);
    return model?.toEntity();
  }

  @override
  Future<Playlist> createPlaylist(Playlist playlist) async {
    final model = playlist.toModel();
    final result = await _localDataSource.createPlaylist(model);
    return result.toEntity();
  }

  @override
  Future<Playlist> updatePlaylist(Playlist playlist) async {
    final model = playlist.toModel();
    final result = await _localDataSource.updatePlaylist(model);
    return result.toEntity();
  }

  @override
  Future<void> deletePlaylist(String id) async {
    await _localDataSource.deletePlaylist(id);
  }

  @override
  Future<void> deleteMultiplePlaylists(List<String> ids) async {
    await _localDataSource.deleteMultiplePlaylists(ids);
  }

  @override
  Future<Playlist> addMusicToPlaylist(String playlistId, String musicId) async {
    final result = await _localDataSource.addMusicToPlaylist(playlistId, musicId);
    return result.toEntity();
  }

  @override
  Future<Playlist> addMultipleMusicToPlaylist(
    String playlistId,
    List<String> musicIds,
  ) async {
    final result = await _localDataSource.addMultipleMusicToPlaylist(
      playlistId,
      musicIds,
    );
    return result.toEntity();
  }

  @override
  Future<Playlist> removeMusicFromPlaylist(String playlistId, String musicId) async {
    final result = await _localDataSource.removeMusicFromPlaylist(
      playlistId,
      musicId,
    );
    return result.toEntity();
  }

  @override
  Future<Playlist> removeMultipleMusicFromPlaylist(
    String playlistId,
    List<String> musicIds,
  ) async {
    final result = await _localDataSource.removeMultipleMusicFromPlaylist(
      playlistId,
      musicIds,
    );
    return result.toEntity();
  }

  @override
  Future<Playlist> reorderPlaylistMusic(
    String playlistId,
    String musicId,
    int newIndex,
  ) async {
    final result = await _localDataSource.reorderPlaylistMusic(
      playlistId,
      musicId,
      newIndex,
    );
    return result.toEntity();
  }

  @override
  Future<bool> isMusicInPlaylist(String playlistId, String musicId) async {
    return await _localDataSource.isMusicInPlaylist(playlistId, musicId);
  }

  @override
  Future<int> getPlaylistCount() async {
    return await _localDataSource.getPlaylistCount();
  }

  @override
  Future<List<Playlist>> getFavoritePlaylists() async {
    final models = await _localDataSource.getFavoritePlaylists();
    return models.toEntities();
  }

  @override
  Future<Playlist> toggleFavorite(String id) async {
    final result = await _localDataSource.toggleFavorite(id);
    return result.toEntity();
  }

  @override
  Future<List<Playlist>> searchPlaylistsByName(String query) async {
    final models = await _localDataSource.searchPlaylistsByName(query);
    return models.toEntities();
  }

  @override
  Future<void> clearAllPlaylists() async {
    await _localDataSource.clearAllPlaylists();
  }
}
