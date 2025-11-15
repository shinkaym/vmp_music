import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for deleting a playlist
class DeletePlaylistUseCase {
  final IPlaylistRepository repository;

  DeletePlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlistId] the ID of the playlist to delete
  /// Throws [AppException] if playlist not found or on failure
  Future<void> call(String playlistId) async {
    return await repository.deletePlaylist(playlistId);
  }
}
