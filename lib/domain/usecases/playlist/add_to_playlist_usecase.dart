import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for adding music to a playlist
class AddToPlaylistUseCase {
  final IPlaylistRepository repository;

  AddToPlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music to add
  /// Returns the updated playlist
  /// Throws [AppException] if playlist or music not found
  Future<Playlist> call(String playlistId, String musicId) async {
    return await repository.addMusicToPlaylist(playlistId, musicId);
  }
}
