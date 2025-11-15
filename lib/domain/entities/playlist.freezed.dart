// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Playlist {
  /// Unique identifier for the playlist
  String get id => throw _privateConstructorUsedError;

  /// Playlist name
  String get name => throw _privateConstructorUsedError;

  /// Playlist description
  String get description => throw _privateConstructorUsedError;

  /// List of music IDs in playlist
  List<String> get musicIds => throw _privateConstructorUsedError;

  /// Date when playlist was created (Unix timestamp)
  int get createdAt => throw _privateConstructorUsedError;

  /// Date when playlist was last modified (Unix timestamp)
  int get modifiedAt => throw _privateConstructorUsedError;

  /// Playlist cover image path
  String get coverPath => throw _privateConstructorUsedError;

  /// Whether this is a favorite playlist
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistCopyWith<Playlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) then) =
      _$PlaylistCopyWithImpl<$Res, Playlist>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<String> musicIds,
      int createdAt,
      int modifiedAt,
      String coverPath,
      bool isFavorite});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res, $Val extends Playlist>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? musicIds = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? coverPath = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      musicIds: null == musicIds
          ? _value.musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      coverPath: null == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistImplCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$$PlaylistImplCopyWith(
          _$PlaylistImpl value, $Res Function(_$PlaylistImpl) then) =
      __$$PlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<String> musicIds,
      int createdAt,
      int modifiedAt,
      String coverPath,
      bool isFavorite});
}

/// @nodoc
class __$$PlaylistImplCopyWithImpl<$Res>
    extends _$PlaylistCopyWithImpl<$Res, _$PlaylistImpl>
    implements _$$PlaylistImplCopyWith<$Res> {
  __$$PlaylistImplCopyWithImpl(
      _$PlaylistImpl _value, $Res Function(_$PlaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? musicIds = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? coverPath = null,
    Object? isFavorite = null,
  }) {
    return _then(_$PlaylistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      musicIds: null == musicIds
          ? _value._musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      coverPath: null == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaylistImpl extends _Playlist {
  const _$PlaylistImpl(
      {required this.id,
      required this.name,
      this.description = '',
      final List<String> musicIds = const [],
      required this.createdAt,
      required this.modifiedAt,
      this.coverPath = '',
      this.isFavorite = false})
      : _musicIds = musicIds,
        super._();

  /// Unique identifier for the playlist
  @override
  final String id;

  /// Playlist name
  @override
  final String name;

  /// Playlist description
  @override
  @JsonKey()
  final String description;

  /// List of music IDs in playlist
  final List<String> _musicIds;

  /// List of music IDs in playlist
  @override
  @JsonKey()
  List<String> get musicIds {
    if (_musicIds is EqualUnmodifiableListView) return _musicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musicIds);
  }

  /// Date when playlist was created (Unix timestamp)
  @override
  final int createdAt;

  /// Date when playlist was last modified (Unix timestamp)
  @override
  final int modifiedAt;

  /// Playlist cover image path
  @override
  @JsonKey()
  final String coverPath;

  /// Whether this is a favorite playlist
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'Playlist(id: $id, name: $name, description: $description, musicIds: $musicIds, createdAt: $createdAt, modifiedAt: $modifiedAt, coverPath: $coverPath, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._musicIds, _musicIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_musicIds),
      createdAt,
      modifiedAt,
      coverPath,
      isFavorite);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      __$$PlaylistImplCopyWithImpl<_$PlaylistImpl>(this, _$identity);
}

abstract class _Playlist extends Playlist {
  const factory _Playlist(
      {required final String id,
      required final String name,
      final String description,
      final List<String> musicIds,
      required final int createdAt,
      required final int modifiedAt,
      final String coverPath,
      final bool isFavorite}) = _$PlaylistImpl;
  const _Playlist._() : super._();

  /// Unique identifier for the playlist
  @override
  String get id;

  /// Playlist name
  @override
  String get name;

  /// Playlist description
  @override
  String get description;

  /// List of music IDs in playlist
  @override
  List<String> get musicIds;

  /// Date when playlist was created (Unix timestamp)
  @override
  int get createdAt;

  /// Date when playlist was last modified (Unix timestamp)
  @override
  int get modifiedAt;

  /// Playlist cover image path
  @override
  String get coverPath;

  /// Whether this is a favorite playlist
  @override
  bool get isFavorite;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
