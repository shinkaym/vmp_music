import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for retrieving all playlists
class GetAllPlaylistsUseCase {
  final IPlaylistRepository repository;

  GetAllPlaylistsUseCase(this.repository);

  /// Execute the use case
  /// Returns list of all playlists
  /// Throws [AppException] on failure
  Future<List<Playlist>> call() async {
    return await repository.getAllPlaylists();
  }
}
