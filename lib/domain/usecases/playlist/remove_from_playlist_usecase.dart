import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Use case for removing music from a playlist
class RemoveFromPlaylistUseCase {
  final IPlaylistRepository repository;

  RemoveFromPlaylistUseCase(this.repository);

  /// Execute the use case
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music to remove
  /// Returns the updated playlist
  /// Throws [AppException] if playlist not found
  Future<Playlist> call(String playlistId, String musicId) async {
    return await repository.removeMusicFromPlaylist(playlistId, musicId);
  }
}
