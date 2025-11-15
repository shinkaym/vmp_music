import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for retrieving recently played music tracks
class GetRecentlyPlayedUseCase {
  final IMusicRepository repository;

  GetRecentlyPlayedUseCase(this.repository);

  /// Execute the use case
  /// [limit] maximum number of results to return (default: 10)
  /// Returns list of recently played music tracks sorted by last played time
  Future<List<Music>> call({int limit = 10}) async {
    return await repository.getRecentlyPlayedMusic(limit: limit);
  }
}
