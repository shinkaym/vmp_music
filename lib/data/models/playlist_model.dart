import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'playlist_model.freezed.dart';
part 'playlist_model.g.dart';

/// Hive adapter type ID for Playlist model
const int playlistTypeId = 1;

/// Playlist model with Hive and JSON serialization support
@freezed
@HiveType(typeId: playlistTypeId)
class PlaylistModel with _$PlaylistModel {
  const factory PlaylistModel({
    /// Unique identifier
    @HiveField(0)
    required String id,

    /// Playlist name
    @HiveField(1)
    required String name,

    /// Playlist description
    @HiveField(2)
    @Default('')
    String description,

    /// List of music IDs in playlist
    @HiveField(3)
    @Default([])
    List<String> musicIds,

    /// Date when playlist was created (Unix timestamp)
    @HiveField(4)
    required int createdAt,

    /// Date when playlist was last modified (Unix timestamp)
    @HiveField(5)
    required int modifiedAt,

    /// Playlist cover image path
    @HiveField(6)
    @Default('')
    String coverPath,

    /// Whether this is a favorite playlist
    @HiveField(7)
    @Default(false)
    bool isFavorite,
  }) = _PlaylistModel;

  const PlaylistModel._();

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
