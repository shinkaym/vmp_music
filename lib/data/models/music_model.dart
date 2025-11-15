import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'music_model.freezed.dart';
part 'music_model.g.dart';

/// Hive adapter type ID for Music model
const int musicTypeId = 0;

/// Music model with Hive and JSON serialization support
@freezed
@HiveType(typeId: musicTypeId)
class MusicModel with _$MusicModel {
  const factory MusicModel({
    /// Unique identifier (typically file path hash)
    @HiveField(0)
    required String id,

    /// Music title
    @HiveField(1)
    required String title,

    /// Artist name
    @HiveField(2)
    @Default('Unknown Artist')
    String artist,

    /// Album name
    @HiveField(3)
    @Default('Unknown Album')
    String album,

    /// File path on device
    @HiveField(4)
    required String filePath,

    /// Duration in milliseconds
    @HiveField(5)
    required int duration,

    /// Date when music was added to library (Unix timestamp)
    @HiveField(6)
    required int dateAdded,

    /// File size in bytes
    @HiveField(7)
    @Default(0)
    int fileSize,

    /// Audio format (mp3, wav, flac, etc)
    @HiveField(8)
    @Default('mp3')
    String format,

    /// Album art path (if available)
    @HiveField(9)
    @Default('')
    String albumArtPath,

    /// Whether this track is favorited
    @HiveField(10)
    @Default(false)
    bool isFavorite,

    /// Play count
    @HiveField(11)
    @Default(0)
    int playCount,

    /// Last played time (Unix timestamp)
    @HiveField(12)
    @Default(0)
    int lastPlayedAt,
  }) = _MusicModel;

  const MusicModel._();

  /// Get duration formatted as MM:SS
  String get durationFormatted {
    final minutes = (duration / 1000 / 60).truncate();
    final seconds = ((duration / 1000) % 60).truncate();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get display name (title by artist)
  String get displayName => '$title ${artist.isEmpty ? '' : '• $artist'}';
}
