// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MusicModel {
  /// Unique identifier (typically file path hash)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;

  /// Music title
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;

  /// Artist name
  @HiveField(2)
  String get artist => throw _privateConstructorUsedError;

  /// Album name
  @HiveField(3)
  String get album => throw _privateConstructorUsedError;

  /// File path on device
  @HiveField(4)
  String get filePath => throw _privateConstructorUsedError;

  /// Duration in milliseconds
  @HiveField(5)
  int get duration => throw _privateConstructorUsedError;

  /// Date when music was added to library (Unix timestamp)
  @HiveField(6)
  int get dateAdded => throw _privateConstructorUsedError;

  /// File size in bytes
  @HiveField(7)
  int get fileSize => throw _privateConstructorUsedError;

  /// Audio format (mp3, wav, flac, etc)
  @HiveField(8)
  String get format => throw _privateConstructorUsedError;

  /// Album art path (if available)
  @HiveField(9)
  String get albumArtPath => throw _privateConstructorUsedError;

  /// Whether this track is favorited
  @HiveField(10)
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Play count
  @HiveField(11)
  int get playCount => throw _privateConstructorUsedError;

  /// Last played time (Unix timestamp)
  @HiveField(12)
  int get lastPlayedAt => throw _privateConstructorUsedError;

  /// Create a copy of MusicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MusicModelCopyWith<MusicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicModelCopyWith<$Res> {
  factory $MusicModelCopyWith(
          MusicModel value, $Res Function(MusicModel) then) =
      _$MusicModelCopyWithImpl<$Res, MusicModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String artist,
      @HiveField(3) String album,
      @HiveField(4) String filePath,
      @HiveField(5) int duration,
      @HiveField(6) int dateAdded,
      @HiveField(7) int fileSize,
      @HiveField(8) String format,
      @HiveField(9) String albumArtPath,
      @HiveField(10) bool isFavorite,
      @HiveField(11) int playCount,
      @HiveField(12) int lastPlayedAt});
}

/// @nodoc
class _$MusicModelCopyWithImpl<$Res, $Val extends MusicModel>
    implements $MusicModelCopyWith<$Res> {
  _$MusicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MusicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? album = null,
    Object? filePath = null,
    Object? duration = null,
    Object? dateAdded = null,
    Object? fileSize = null,
    Object? format = null,
    Object? albumArtPath = null,
    Object? isFavorite = null,
    Object? playCount = null,
    Object? lastPlayedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      albumArtPath: null == albumArtPath
          ? _value.albumArtPath
          : albumArtPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastPlayedAt: null == lastPlayedAt
          ? _value.lastPlayedAt
          : lastPlayedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicModelImplCopyWith<$Res>
    implements $MusicModelCopyWith<$Res> {
  factory _$$MusicModelImplCopyWith(
          _$MusicModelImpl value, $Res Function(_$MusicModelImpl) then) =
      __$$MusicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String artist,
      @HiveField(3) String album,
      @HiveField(4) String filePath,
      @HiveField(5) int duration,
      @HiveField(6) int dateAdded,
      @HiveField(7) int fileSize,
      @HiveField(8) String format,
      @HiveField(9) String albumArtPath,
      @HiveField(10) bool isFavorite,
      @HiveField(11) int playCount,
      @HiveField(12) int lastPlayedAt});
}

/// @nodoc
class __$$MusicModelImplCopyWithImpl<$Res>
    extends _$MusicModelCopyWithImpl<$Res, _$MusicModelImpl>
    implements _$$MusicModelImplCopyWith<$Res> {
  __$$MusicModelImplCopyWithImpl(
      _$MusicModelImpl _value, $Res Function(_$MusicModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MusicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? album = null,
    Object? filePath = null,
    Object? duration = null,
    Object? dateAdded = null,
    Object? fileSize = null,
    Object? format = null,
    Object? albumArtPath = null,
    Object? isFavorite = null,
    Object? playCount = null,
    Object? lastPlayedAt = null,
  }) {
    return _then(_$MusicModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      albumArtPath: null == albumArtPath
          ? _value.albumArtPath
          : albumArtPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastPlayedAt: null == lastPlayedAt
          ? _value.lastPlayedAt
          : lastPlayedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MusicModelImpl extends _MusicModel {
  const _$MusicModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) this.artist = 'Unknown Artist',
      @HiveField(3) this.album = 'Unknown Album',
      @HiveField(4) required this.filePath,
      @HiveField(5) required this.duration,
      @HiveField(6) required this.dateAdded,
      @HiveField(7) this.fileSize = 0,
      @HiveField(8) this.format = 'mp3',
      @HiveField(9) this.albumArtPath = '',
      @HiveField(10) this.isFavorite = false,
      @HiveField(11) this.playCount = 0,
      @HiveField(12) this.lastPlayedAt = 0})
      : super._();

  /// Unique identifier (typically file path hash)
  @override
  @HiveField(0)
  final String id;

  /// Music title
  @override
  @HiveField(1)
  final String title;

  /// Artist name
  @override
  @JsonKey()
  @HiveField(2)
  final String artist;

  /// Album name
  @override
  @JsonKey()
  @HiveField(3)
  final String album;

  /// File path on device
  @override
  @HiveField(4)
  final String filePath;

  /// Duration in milliseconds
  @override
  @HiveField(5)
  final int duration;

  /// Date when music was added to library (Unix timestamp)
  @override
  @HiveField(6)
  final int dateAdded;

  /// File size in bytes
  @override
  @JsonKey()
  @HiveField(7)
  final int fileSize;

  /// Audio format (mp3, wav, flac, etc)
  @override
  @JsonKey()
  @HiveField(8)
  final String format;

  /// Album art path (if available)
  @override
  @JsonKey()
  @HiveField(9)
  final String albumArtPath;

  /// Whether this track is favorited
  @override
  @JsonKey()
  @HiveField(10)
  final bool isFavorite;

  /// Play count
  @override
  @JsonKey()
  @HiveField(11)
  final int playCount;

  /// Last played time (Unix timestamp)
  @override
  @JsonKey()
  @HiveField(12)
  final int lastPlayedAt;

  @override
  String toString() {
    return 'MusicModel(id: $id, title: $title, artist: $artist, album: $album, filePath: $filePath, duration: $duration, dateAdded: $dateAdded, fileSize: $fileSize, format: $format, albumArtPath: $albumArtPath, isFavorite: $isFavorite, playCount: $playCount, lastPlayedAt: $lastPlayedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.albumArtPath, albumArtPath) ||
                other.albumArtPath == albumArtPath) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.lastPlayedAt, lastPlayedAt) ||
                other.lastPlayedAt == lastPlayedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      artist,
      album,
      filePath,
      duration,
      dateAdded,
      fileSize,
      format,
      albumArtPath,
      isFavorite,
      playCount,
      lastPlayedAt);

  /// Create a copy of MusicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicModelImplCopyWith<_$MusicModelImpl> get copyWith =>
      __$$MusicModelImplCopyWithImpl<_$MusicModelImpl>(this, _$identity);
}

abstract class _MusicModel extends MusicModel {
  const factory _MusicModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) final String artist,
      @HiveField(3) final String album,
      @HiveField(4) required final String filePath,
      @HiveField(5) required final int duration,
      @HiveField(6) required final int dateAdded,
      @HiveField(7) final int fileSize,
      @HiveField(8) final String format,
      @HiveField(9) final String albumArtPath,
      @HiveField(10) final bool isFavorite,
      @HiveField(11) final int playCount,
      @HiveField(12) final int lastPlayedAt}) = _$MusicModelImpl;
  const _MusicModel._() : super._();

  /// Unique identifier (typically file path hash)
  @override
  @HiveField(0)
  String get id;

  /// Music title
  @override
  @HiveField(1)
  String get title;

  /// Artist name
  @override
  @HiveField(2)
  String get artist;

  /// Album name
  @override
  @HiveField(3)
  String get album;

  /// File path on device
  @override
  @HiveField(4)
  String get filePath;

  /// Duration in milliseconds
  @override
  @HiveField(5)
  int get duration;

  /// Date when music was added to library (Unix timestamp)
  @override
  @HiveField(6)
  int get dateAdded;

  /// File size in bytes
  @override
  @HiveField(7)
  int get fileSize;

  /// Audio format (mp3, wav, flac, etc)
  @override
  @HiveField(8)
  String get format;

  /// Album art path (if available)
  @override
  @HiveField(9)
  String get albumArtPath;

  /// Whether this track is favorited
  @override
  @HiveField(10)
  bool get isFavorite;

  /// Play count
  @override
  @HiveField(11)
  int get playCount;

  /// Last played time (Unix timestamp)
  @override
  @HiveField(12)
  int get lastPlayedAt;

  /// Create a copy of MusicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MusicModelImplCopyWith<_$MusicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
