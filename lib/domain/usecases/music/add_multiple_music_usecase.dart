import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for adding multiple music tracks to the library
class AddMultipleMusicUseCase {
  final IMusicRepository repository;

  AddMultipleMusicUseCase(this.repository);

  /// Execute the use case
  /// [musicList] list of music tracks to add
  /// Returns the list of added music tracks
  /// Throws [AppException] on failure
  Future<List<Music>> call(List<Music> musicList) async {
    return await repository.addMultipleMusic(musicList);
  }
}
