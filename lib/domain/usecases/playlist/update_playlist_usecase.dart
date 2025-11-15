import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for updating a playlist
class UpdatePlaylistUseCase {
  final IPlaylistRepository repository;

  UpdatePlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlist] the playlist to update
  /// Returns the updated playlist
  /// Throws [AppException] if playlist not found or on failure
  Future<Playlist> call(Playlist playlist) async {
    return await repository.updatePlaylist(playlist);
  }
}
