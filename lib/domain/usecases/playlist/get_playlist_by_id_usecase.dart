import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for retrieving a specific playlist by ID
class GetPlaylistByIdUseCase {
  final IPlaylistRepository repository;

  GetPlaylistByIdUseCase(this.repository);

  /// Execute the use case
  /// [playlistId] the ID of the playlist to retrieve
  /// Returns the playlist or null if not found
  Future<Playlist?> call(String playlistId) async {
    return await repository.getPlaylistById(playlistId);
  }
}
