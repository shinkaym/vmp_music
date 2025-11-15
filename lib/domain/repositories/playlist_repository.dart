import 'package:vmp_music/domain/entities/playlist.dart';

/// Repository interface for playlist-related operations
/// Defines contract for playlist data access, independent of implementation
abstract class IPlaylistRepository {
  /// Get all playlists
  /// Returns list of all playlists
  /// Throws [AppException] on failure
  Future<List<Playlist>> getAllPlaylists();

  /// Get a specific playlist by ID
  /// Returns null if playlist not found
  Future<Playlist?> getPlaylistById(String id);

  /// Create a new playlist
  /// Returns the created playlist
  /// Throws [AppException] on failure
  Future<Playlist> createPlaylist(Playlist playlist);

  /// Update an existing playlist
  /// Returns the updated playlist
  /// Throws [AppException] if playlist not found or on failure
  Future<Playlist> updatePlaylist(Playlist playlist);

  /// Delete a playlist
  /// Throws [AppException] if playlist not found or on failure
  Future<void> deletePlaylist(String id);

  /// Delete multiple playlists
  /// Throws [AppException] on failure
  Future<void> deleteMultiplePlaylists(List<String> ids);

  /// Add a music track to a playlist
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music to add
  /// Returns the updated playlist
  /// Throws [AppException] if playlist or music not found
  Future<Playlist> addMusicToPlaylist(String playlistId, String musicId);

  /// Add multiple music tracks to a playlist
  /// [playlistId] the ID of the playlist
  /// [musicIds] list of music IDs to add
  /// Returns the updated playlist
  /// Throws [AppException] if playlist not found
  Future<Playlist> addMultipleMusicToPlaylist(String playlistId, List<String> musicIds);

  /// Remove a music track from a playlist
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music to remove
  /// Returns the updated playlist
  /// Throws [AppException] if playlist not found
  Future<Playlist> removeMusicFromPlaylist(String playlistId, String musicId);

  /// Remove multiple music tracks from a playlist
  /// [playlistId] the ID of the playlist
  /// [musicIds] list of music IDs to remove
  /// Returns the updated playlist
  Future<Playlist> removeMultipleMusicFromPlaylist(String playlistId, List<String> musicIds);

  /// Reorder music in playlist
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music to move
  /// [newIndex] the new position index
  /// Returns the updated playlist
  Future<Playlist> reorderPlaylistMusic(String playlistId, String musicId, int newIndex);

  /// Check if music exists in playlist
  /// [playlistId] the ID of the playlist
  /// [musicId] the ID of the music
  /// Returns true if music is in playlist
  Future<bool> isMusicInPlaylist(String playlistId, String musicId);

  /// Get total count of playlists
  Future<int> getPlaylistCount();

  /// Get favorite playlists
  /// Returns list of favorited playlists
  Future<List<Playlist>> getFavoritePlaylists();

  /// Toggle favorite status for a playlist
  /// Returns the updated playlist
  Future<Playlist> toggleFavorite(String id);

  /// Search playlists by name
  /// Returns list of matching playlists
  Future<List<Playlist>> searchPlaylistsByName(String query);

  /// Clear all playlists
  /// Throws [AppException] on failure
  Future<void> clearAllPlaylists();
}
