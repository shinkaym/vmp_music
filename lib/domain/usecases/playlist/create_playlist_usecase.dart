import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for creating a new playlist
class CreatePlaylistUseCase {
  final IPlaylistRepository repository;

  CreatePlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlist] the playlist to create
  /// Returns the created playlist
  /// Throws [AppException] on failure
  Future<Playlist> call(Playlist playlist) async {
    return await repository.createPlaylist(playlist);
  }
}
