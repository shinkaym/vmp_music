// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Music {
  /// Unique identifier for the music track
  String get id => throw _privateConstructorUsedError;

  /// Title of the music track
  String get title => throw _privateConstructorUsedError;

  /// Artist name
  String get artist => throw _privateConstructorUsedError;

  /// Album name
  String get album => throw _privateConstructorUsedError;

  /// File path on device
  String get filePath => throw _privateConstructorUsedError;

  /// Duration in milliseconds
  int get duration => throw _privateConstructorUsedError;

  /// Date when music was added to library (Unix timestamp)
  int get dateAdded => throw _privateConstructorUsedError;

  /// File size in bytes
  int get fileSize => throw _privateConstructorUsedError;

  /// Audio format (mp3, wav, flac, etc)
  String get format => throw _privateConstructorUsedError;

  /// Album art path (if available)
  String get albumArtPath => throw _privateConstructorUsedError;

  /// Whether this track is favorited
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Play count
  int get playCount => throw _privateConstructorUsedError;

  /// Last played time (Unix timestamp)
  int get lastPlayedAt => throw _privateConstructorUsedError;

  /// Create a copy of Music
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MusicCopyWith<Music> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicCopyWith<$Res> {
  factory $MusicCopyWith(Music value, $Res Function(Music) then) =
      _$MusicCopyWithImpl<$Res, Music>;
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String album,
      String filePath,
      int duration,
      int dateAdded,
      int fileSize,
      String format,
      String albumArtPath,
      bool isFavorite,
      int playCount,
      int lastPlayedAt});
}

/// @nodoc
class _$MusicCopyWithImpl<$Res, $Val extends Music>
    implements $MusicCopyWith<$Res> {
  _$MusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Music
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
abstract class _$$MusicImplCopyWith<$Res> implements $MusicCopyWith<$Res> {
  factory _$$MusicImplCopyWith(
          _$MusicImpl value, $Res Function(_$MusicImpl) then) =
      __$$MusicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String album,
      String filePath,
      int duration,
      int dateAdded,
      int fileSize,
      String format,
      String albumArtPath,
      bool isFavorite,
      int playCount,
      int lastPlayedAt});
}

/// @nodoc
class __$$MusicImplCopyWithImpl<$Res>
    extends _$MusicCopyWithImpl<$Res, _$MusicImpl>
    implements _$$MusicImplCopyWith<$Res> {
  __$$MusicImplCopyWithImpl(
      _$MusicImpl _value, $Res Function(_$MusicImpl) _then)
      : super(_value, _then);

  /// Create a copy of Music
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
    return _then(_$MusicImpl(
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

class _$MusicImpl extends _Music {
  const _$MusicImpl(
      {required this.id,
      required this.title,
      this.artist = 'Unknown Artist',
      this.album = 'Unknown Album',
      required this.filePath,
      required this.duration,
      required this.dateAdded,
      this.fileSize = 0,
      this.format = 'mp3',
      this.albumArtPath = '',
      this.isFavorite = false,
      this.playCount = 0,
      this.lastPlayedAt = 0})
      : super._();

  /// Unique identifier for the music track
  @override
  final String id;

  /// Title of the music track
  @override
  final String title;

  /// Artist name
  @override
  @JsonKey()
  final String artist;

  /// Album name
  @override
  @JsonKey()
  final String album;

  /// File path on device
  @override
  final String filePath;

  /// Duration in milliseconds
  @override
  final int duration;

  /// Date when music was added to library (Unix timestamp)
  @override
  final int dateAdded;

  /// File size in bytes
  @override
  @JsonKey()
  final int fileSize;

  /// Audio format (mp3, wav, flac, etc)
  @override
  @JsonKey()
  final String format;

  /// Album art path (if available)
  @override
  @JsonKey()
  final String albumArtPath;

  /// Whether this track is favorited
  @override
  @JsonKey()
  final bool isFavorite;

  /// Play count
  @override
  @JsonKey()
  final int playCount;

  /// Last played time (Unix timestamp)
  @override
  @JsonKey()
  final int lastPlayedAt;

  @override
  String toString() {
    return 'Music(id: $id, title: $title, artist: $artist, album: $album, filePath: $filePath, duration: $duration, dateAdded: $dateAdded, fileSize: $fileSize, format: $format, albumArtPath: $albumArtPath, isFavorite: $isFavorite, playCount: $playCount, lastPlayedAt: $lastPlayedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicImpl &&
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

  /// Create a copy of Music
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicImplCopyWith<_$MusicImpl> get copyWith =>
      __$$MusicImplCopyWithImpl<_$MusicImpl>(this, _$identity);
}

abstract class _Music extends Music {
  const factory _Music(
      {required final String id,
      required final String title,
      final String artist,
      final String album,
      required final String filePath,
      required final int duration,
      required final int dateAdded,
      final int fileSize,
      final String format,
      final String albumArtPath,
      final bool isFavorite,
      final int playCount,
      final int lastPlayedAt}) = _$MusicImpl;
  const _Music._() : super._();

  /// Unique identifier for the music track
  @override
  String get id;

  /// Title of the music track
  @override
  String get title;

  /// Artist name
  @override
  String get artist;

  /// Album name
  @override
  String get album;

  /// File path on device
  @override
  String get filePath;

  /// Duration in milliseconds
  @override
  int get duration;

  /// Date when music was added to library (Unix timestamp)
  @override
  int get dateAdded;

  /// File size in bytes
  @override
  int get fileSize;

  /// Audio format (mp3, wav, flac, etc)
  @override
  String get format;

  /// Album art path (if available)
  @override
  String get albumArtPath;

  /// Whether this track is favorited
  @override
  bool get isFavorite;

  /// Play count
  @override
  int get playCount;

  /// Last played time (Unix timestamp)
  @override
  int get lastPlayedAt;

  /// Create a copy of Music
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MusicImplCopyWith<_$MusicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
