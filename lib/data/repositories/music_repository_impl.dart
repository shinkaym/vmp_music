import '../datasources/local_music_datasource.dart';
import '../extensions/model_entity_extension.dart';
import '../../domain/entities/music.dart';
import '../../domain/repositories/music_repository.dart';

/// Music repository implementation using local data source
class MusicRepositoryImpl implements IMusicRepository {
  final ILocalMusicDataSource _localDataSource;

  MusicRepositoryImpl(this._localDataSource);

  @override
  Future<List<Music>> getAllMusic() async {
    final models = await _localDataSource.getAllMusic();
    return models.toEntities();
  }

  @override
  Future<Music?> getMusicById(String id) async {
    final model = await _localDataSource.getMusicById(id);
    return model?.toEntity();
  }

  @override
  Future<Music> addMusic(Music music) async {
    final model = music.toModel();
    final result = await _localDataSource.addMusic(model);
    return result.toEntity();
  }

  @override
  Future<List<Music>> addMultipleMusic(List<Music> musicList) async {
    final models = musicList.toModels();
    final results = await _localDataSource.addMultipleMusic(models);
    return results.toEntities();
  }

  @override
  Future<Music> updateMusic(Music music) async {
    final model = music.toModel();
    final result = await _localDataSource.updateMusic(model);
    return result.toEntity();
  }

  @override
  Future<void> deleteMusic(String id) async {
    await _localDataSource.deleteMusic(id);
  }

  @override
  Future<void> deleteMultipleMusic(List<String> ids) async {
    await _localDataSource.deleteMultipleMusic(ids);
  }

  @override
  Future<List<Music>> searchMusicByTitle(String query) async {
    final models = await _localDataSource.searchMusicByTitle(query);
    return models.toEntities();
  }

  @override
  Future<int> getMusicCount() async {
    return await _localDataSource.getMusicCount();
  }

  @override
  Future<List<Music>> getFavoriteMusic() async {
    final models = await _localDataSource.getFavoriteMusic();
    return models.toEntities();
  }

  @override
  Future<Music> toggleFavorite(String id) async {
    final result = await _localDataSource.toggleFavorite(id);
    return result.toEntity();
  }

  @override
  Future<List<Music>> getRecentlyAddedMusic({int limit = 10}) async {
    final models = await _localDataSource.getRecentlyAddedMusic(limit: limit);
    return models.toEntities();
  }

  @override
  Future<List<Music>> getRecentlyPlayedMusic({int limit = 10}) async {
    final models = await _localDataSource.getRecentlyPlayedMusic(limit: limit);
    return models.toEntities();
  }

  @override
  Future<Music> updatePlayStats(String musicId) async {
    final result = await _localDataSource.updatePlayStats(musicId);
    return result.toEntity();
  }

  @override
  Future<void> clearAllMusic() async {
    await _localDataSource.clearAllMusic();
  }
}
