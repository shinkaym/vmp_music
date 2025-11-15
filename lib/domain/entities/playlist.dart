import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.freezed.dart';

/// Domain entity representing a playlist
/// Independent of persistence layer, used for business logic
@freezed
class Playlist with _$Playlist {
  const factory Playlist({
    /// Unique identifier for the playlist
    required String id,

    /// Playlist name
    required String name,

    /// Playlist description
    @Default('')
    String description,

    /// List of music IDs in playlist
    @Default([])
    List<String> musicIds,

    /// Date when playlist was created (Unix timestamp)
    required int createdAt,

    /// Date when playlist was last modified (Unix timestamp)
    required int modifiedAt,

    /// Playlist cover image path
    @Default('')
    String coverPath,

    /// Whether this is a favorite playlist
    @Default(false)
    bool isFavorite,
  }) = _Playlist;

  const Playlist._();

  /// Get number of songs in playlist
  int get songCount => musicIds.length;

  /// Check if playlist is empty
  bool get isEmpty => musicIds.isEmpty;

  /// Check if playlist has songs
  bool get isNotEmpty => musicIds.isNotEmpty;

  /// Get playlist display info
  String get displayInfo =>
      '$songCount song${songCount != 1 ? 's' : ''} • ${description.isEmpty ? 'No description' : description}';
}
