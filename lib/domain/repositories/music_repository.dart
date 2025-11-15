import 'package:vmp_music/domain/entities/music.dart';

/// Repository interface for music-related operations
/// Defines contract for music data access, independent of implementation
abstract class IMusicRepository {
  /// Get all music tracks from the library
  /// Throws [AppException] on failure
  Future<List<Music>> getAllMusic();

  /// Get a specific music track by ID
  /// Returns null if music not found
  Future<Music?> getMusicById(String id);

  /// Add a new music track to the library
  /// Returns the added music track
  /// Throws [AppException] on failure
  Future<Music> addMusic(Music music);

  /// Add multiple music tracks to the library
  /// Returns list of added music tracks
  /// Throws [AppException] on failure
  Future<List<Music>> addMultipleMusic(List<Music> musicList);

  /// Update an existing music track
  /// Returns the updated music track
  /// Throws [AppException] if music not found or on failure
  Future<Music> updateMusic(Music music);

  /// Delete a music track from the library
  /// Throws [AppException] if music not found or on failure
  Future<void> deleteMusic(String id);

  /// Delete multiple music tracks from the library
  /// Throws [AppException] on failure
  Future<void> deleteMultipleMusic(List<String> ids);

  /// Search music tracks by title
  /// Returns list of matching music tracks
  Future<List<Music>> searchMusicByTitle(String query);

  /// Get total count of music tracks in library
  Future<int> getMusicCount();

  /// Get favorite music tracks
  /// Returns list of favorited music tracks
  Future<List<Music>> getFavoriteMusic();

  /// Toggle favorite status for a music track
  /// Returns the updated music track
  Future<Music> toggleFavorite(String id);

  /// Get most recently added music
  /// Returns list of music sorted by date added (newest first)
  /// [limit] limits the number of results (default: 10)
  Future<List<Music>> getRecentlyAddedMusic({int limit = 10});

  /// Get most recently played music
  /// Returns list of music sorted by last played time (newest first)
  /// [limit] limits the number of results (default: 10)
  Future<List<Music>> getRecentlyPlayedMusic({int limit = 10});

  /// Update play count and last played time for a music track
  /// [musicId] the ID of the music track to update
  /// Returns the updated music track
  Future<Music> updatePlayStats(String musicId);

  /// Clear all music from the library
  /// Throws [AppException] on failure
  Future<void> clearAllMusic();
}
