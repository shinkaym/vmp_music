import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for retrieving favorite playlists
class GetFavoritePlaylistsUseCase {
  final IPlaylistRepository repository;

  GetFavoritePlaylistsUseCase(this.repository);

  /// Execute the use case
  /// Returns list of favorite playlists
  Future<List<Playlist>> call() async {
    return await repository.getFavoritePlaylists();
  }
}
