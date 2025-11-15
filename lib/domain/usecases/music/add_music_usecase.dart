import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for adding a new music track to the library
class AddMusicUseCase {
  final IMusicRepository repository;

  AddMusicUseCase(this.repository);

  /// Execute the use case
  /// [music] the music track to add
  /// Returns the added music track
  /// Throws [AppException] on failure
  Future<Music> call(Music music) async {
    return await repository.addMusic(music);
  }
}
