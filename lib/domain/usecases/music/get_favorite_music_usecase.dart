import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for retrieving favorite music tracks
class GetFavoriteMusicUseCase {
  final IMusicRepository repository;

  GetFavoriteMusicUseCase(this.repository);

  /// Execute the use case
  /// Returns list of favorite music tracks
  Future<List<Music>> call() async {
    return await repository.getFavoriteMusic();
  }
}
