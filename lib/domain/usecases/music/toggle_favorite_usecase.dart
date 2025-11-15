import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for toggling favorite status of a music track
class ToggleFavoriteMusicUseCase {
  final IMusicRepository repository;

  ToggleFavoriteMusicUseCase(this.repository);

  /// Execute the use case
  /// [musicId] the ID of the music track to toggle favorite status
  /// Returns the updated music track
  Future<Music> call(String musicId) async {
    return await repository.toggleFavorite(musicId);
  }
}
