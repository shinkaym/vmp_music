import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for retrieving all music tracks from the library
class GetAllMusicUseCase {
  final IMusicRepository repository;

  GetAllMusicUseCase(this.repository);

  /// Execute the use case
  /// Returns a list of all music tracks
  /// Throws [AppException] on failure
  Future<List<Music>> call() async {
    return await repository.getAllMusic();
  }
}
