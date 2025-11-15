import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'queue_model.freezed.dart';
part 'queue_model.g.dart';

/// Hive adapter type ID for Queue model
const int queueTypeId = 2;

/// Queue model representing the current playback queue
@freezed
@HiveType(typeId: queueTypeId)
class QueueModel with _$QueueModel {
  const factory QueueModel({
    /// List of music IDs in queue order
    @HiveField(0)
    @Default([])
    List<String> musicIds,

    /// Current position in queue
    @HiveField(1)
    @Default(0)
    int currentPosition,

    /// Current playback position in milliseconds
    @HiveField(2)
    @Default(0)
    int playbackPosition,

    /// Shuffle mode enabled
    @HiveField(3)
    @Default(false)
    bool isShuffleEnabled,

    /// Repeat mode (0=off, 1=one, 2=all)
    @HiveField(4)
    @Default(0)
    int repeatMode,

    /// Last updated timestamp (Unix timestamp)
    @HiveField(5)
    required int lastUpdatedAt,
  }) = _QueueModel;

  const QueueModel._();

  /// Get current music ID if queue is not empty
  String? get currentMusicId =>
      musicIds.isNotEmpty && currentPosition < musicIds.length
          ? musicIds[currentPosition]
          : null;

  /// Check if queue is empty
  bool get isEmpty => musicIds.isEmpty;

  /// Check if queue has items
  bool get isNotEmpty => musicIds.isNotEmpty;

  /// Get queue length
  int get length => musicIds.length;

  /// Check if there's a next track
  bool get hasNext => currentPosition < musicIds.length - 1;

  /// Check if there's a previous track
  bool get hasPrevious => currentPosition > 0;

  /// Get next music ID
  String? get nextMusicId => hasNext ? musicIds[currentPosition + 1] : null;

  /// Get previous music ID
  String? get previousMusicId =>
      hasPrevious ? musicIds[currentPosition - 1] : null;
}
