import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for deleting a music track from the library
class DeleteMusicUseCase {
  final IMusicRepository repository;

  DeleteMusicUseCase(this.repository);

  /// Execute the use case
  /// [musicId] the ID of the music track to delete
  /// Throws [AppException] if music not found or on failure
  Future<void> call(String musicId) async {
    return await repository.deleteMusic(musicId);
  }
}
