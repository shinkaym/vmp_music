import 'package:freezed_annotation/freezed_annotation.dart';

part 'music.freezed.dart';

/// Domain entity representing a music track
/// Independent of persistence layer, used for business logic
@freezed
class Music with _$Music {
  const factory Music({
    /// Unique identifier for the music track
    required String id,

    /// Title of the music track
    required String title,

    /// Artist name
    @Default('Unknown Artist')
    String artist,

    /// Album name
    @Default('Unknown Album')
    String album,

    /// File path on device
    required String filePath,

    /// Duration in milliseconds
    required int duration,

    /// Date when music was added to library (Unix timestamp)
    required int dateAdded,

    /// File size in bytes
    @Default(0)
    int fileSize,

    /// Audio format (mp3, wav, flac, etc)
    @Default('mp3')
    String format,

    /// Album art path (if available)
    @Default('')
    String albumArtPath,

    /// Whether this track is favorited
    @Default(false)
    bool isFavorite,

    /// Play count
    @Default(0)
    int playCount,

    /// Last played time (Unix timestamp)
    @Default(0)
    int lastPlayedAt,
  }) = _Music;

  const Music._();

  /// Get duration formatted as MM:SS
  String get durationFormatted {
    final minutes = (duration / 1000 / 60).truncate();
    final seconds = ((duration / 1000) % 60).truncate();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get display name (title by artist)
  String get displayName => '$title ${artist.isEmpty ? '' : '• $artist'}';
}
