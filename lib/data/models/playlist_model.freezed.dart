// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaylistModel {
  /// Unique identifier
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;

  /// Playlist name
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  /// Playlist description
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;

  /// List of music IDs in playlist
  @HiveField(3)
  List<String> get musicIds => throw _privateConstructorUsedError;

  /// Date when playlist was created (Unix timestamp)
  @HiveField(4)
  int get createdAt => throw _privateConstructorUsedError;

  /// Date when playlist was last modified (Unix timestamp)
  @HiveField(5)
  int get modifiedAt => throw _privateConstructorUsedError;

  /// Playlist cover image path
  @HiveField(6)
  String get coverPath => throw _privateConstructorUsedError;

  /// Whether this is a favorite playlist
  @HiveField(7)
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Create a copy of PlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistModelCopyWith<PlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistModelCopyWith<$Res> {
  factory $PlaylistModelCopyWith(
          PlaylistModel value, $Res Function(PlaylistModel) then) =
      _$PlaylistModelCopyWithImpl<$Res, PlaylistModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) List<String> musicIds,
      @HiveField(4) int createdAt,
      @HiveField(5) int modifiedAt,
      @HiveField(6) String coverPath,
      @HiveField(7) bool isFavorite});
}

/// @nodoc
class _$PlaylistModelCopyWithImpl<$Res, $Val extends PlaylistModel>
    implements $PlaylistModelCopyWith<$Res> {
  _$PlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistModel
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
abstract class _$$PlaylistModelImplCopyWith<$Res>
    implements $PlaylistModelCopyWith<$Res> {
  factory _$$PlaylistModelImplCopyWith(
          _$PlaylistModelImpl value, $Res Function(_$PlaylistModelImpl) then) =
      __$$PlaylistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) List<String> musicIds,
      @HiveField(4) int createdAt,
      @HiveField(5) int modifiedAt,
      @HiveField(6) String coverPath,
      @HiveField(7) bool isFavorite});
}

/// @nodoc
class __$$PlaylistModelImplCopyWithImpl<$Res>
    extends _$PlaylistModelCopyWithImpl<$Res, _$PlaylistModelImpl>
    implements _$$PlaylistModelImplCopyWith<$Res> {
  __$$PlaylistModelImplCopyWithImpl(
      _$PlaylistModelImpl _value, $Res Function(_$PlaylistModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistModel
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
    return _then(_$PlaylistModelImpl(
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

class _$PlaylistModelImpl extends _PlaylistModel {
  const _$PlaylistModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.description = '',
      @HiveField(3) final List<String> musicIds = const [],
      @HiveField(4) required this.createdAt,
      @HiveField(5) required this.modifiedAt,
      @HiveField(6) this.coverPath = '',
      @HiveField(7) this.isFavorite = false})
      : _musicIds = musicIds,
        super._();

  /// Unique identifier
  @override
  @HiveField(0)
  final String id;

  /// Playlist name
  @override
  @HiveField(1)
  final String name;

  /// Playlist description
  @override
  @JsonKey()
  @HiveField(2)
  final String description;

  /// List of music IDs in playlist
  final List<String> _musicIds;

  /// List of music IDs in playlist
  @override
  @JsonKey()
  @HiveField(3)
  List<String> get musicIds {
    if (_musicIds is EqualUnmodifiableListView) return _musicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musicIds);
  }

  /// Date when playlist was created (Unix timestamp)
  @override
  @HiveField(4)
  final int createdAt;

  /// Date when playlist was last modified (Unix timestamp)
  @override
  @HiveField(5)
  final int modifiedAt;

  /// Playlist cover image path
  @override
  @JsonKey()
  @HiveField(6)
  final String coverPath;

  /// Whether this is a favorite playlist
  @override
  @JsonKey()
  @HiveField(7)
  final bool isFavorite;

  @override
  String toString() {
    return 'PlaylistModel(id: $id, name: $name, description: $description, musicIds: $musicIds, createdAt: $createdAt, modifiedAt: $modifiedAt, coverPath: $coverPath, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistModelImpl &&
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

  /// Create a copy of PlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      __$$PlaylistModelImplCopyWithImpl<_$PlaylistModelImpl>(this, _$identity);
}

abstract class _PlaylistModel extends PlaylistModel {
  const factory _PlaylistModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) final String description,
      @HiveField(3) final List<String> musicIds,
      @HiveField(4) required final int createdAt,
      @HiveField(5) required final int modifiedAt,
      @HiveField(6) final String coverPath,
      @HiveField(7) final bool isFavorite}) = _$PlaylistModelImpl;
  const _PlaylistModel._() : super._();

  /// Unique identifier
  @override
  @HiveField(0)
  String get id;

  /// Playlist name
  @override
  @HiveField(1)
  String get name;

  /// Playlist description
  @override
  @HiveField(2)
  String get description;

  /// List of music IDs in playlist
  @override
  @HiveField(3)
  List<String> get musicIds;

  /// Date when playlist was created (Unix timestamp)
  @override
  @HiveField(4)
  int get createdAt;

  /// Date when playlist was last modified (Unix timestamp)
  @override
  @HiveField(5)
  int get modifiedAt;

  /// Playlist cover image path
  @override
  @HiveField(6)
  String get coverPath;

  /// Whether this is a favorite playlist
  @override
  @HiveField(7)
  bool get isFavorite;

  /// Create a copy of PlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
