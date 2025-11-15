import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for toggling favorite status of a playlist
class ToggleFavoritePlaylistUseCase {
  final IPlaylistRepository repository;

  ToggleFavoritePlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlistId] the ID of the playlist to toggle favorite status
  /// Returns the updated playlist
  Future<Playlist> call(String playlistId) async {
    return await repository.toggleFavorite(playlistId);
  }
}
