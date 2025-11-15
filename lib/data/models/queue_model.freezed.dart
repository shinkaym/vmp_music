// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QueueModel {
  /// List of music IDs in queue order
  @HiveField(0)
  List<String> get musicIds => throw _privateConstructorUsedError;

  /// Current position in queue
  @HiveField(1)
  int get currentPosition => throw _privateConstructorUsedError;

  /// Current playback position in milliseconds
  @HiveField(2)
  int get playbackPosition => throw _privateConstructorUsedError;

  /// Shuffle mode enabled
  @HiveField(3)
  bool get isShuffleEnabled => throw _privateConstructorUsedError;

  /// Repeat mode (0=off, 1=one, 2=all)
  @HiveField(4)
  int get repeatMode => throw _privateConstructorUsedError;

  /// Last updated timestamp (Unix timestamp)
  @HiveField(5)
  int get lastUpdatedAt => throw _privateConstructorUsedError;

  /// Create a copy of QueueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueModelCopyWith<QueueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueModelCopyWith<$Res> {
  factory $QueueModelCopyWith(
          QueueModel value, $Res Function(QueueModel) then) =
      _$QueueModelCopyWithImpl<$Res, QueueModel>;
  @useResult
  $Res call(
      {@HiveField(0) List<String> musicIds,
      @HiveField(1) int currentPosition,
      @HiveField(2) int playbackPosition,
      @HiveField(3) bool isShuffleEnabled,
      @HiveField(4) int repeatMode,
      @HiveField(5) int lastUpdatedAt});
}

/// @nodoc
class _$QueueModelCopyWithImpl<$Res, $Val extends QueueModel>
    implements $QueueModelCopyWith<$Res> {
  _$QueueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicIds = null,
    Object? currentPosition = null,
    Object? playbackPosition = null,
    Object? isShuffleEnabled = null,
    Object? repeatMode = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_value.copyWith(
      musicIds: null == musicIds
          ? _value.musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      playbackPosition: null == playbackPosition
          ? _value.playbackPosition
          : playbackPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isShuffleEnabled: null == isShuffleEnabled
          ? _value.isShuffleEnabled
          : isShuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueueModelImplCopyWith<$Res>
    implements $QueueModelCopyWith<$Res> {
  factory _$$QueueModelImplCopyWith(
          _$QueueModelImpl value, $Res Function(_$QueueModelImpl) then) =
      __$$QueueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String> musicIds,
      @HiveField(1) int currentPosition,
      @HiveField(2) int playbackPosition,
      @HiveField(3) bool isShuffleEnabled,
      @HiveField(4) int repeatMode,
      @HiveField(5) int lastUpdatedAt});
}

/// @nodoc
class __$$QueueModelImplCopyWithImpl<$Res>
    extends _$QueueModelCopyWithImpl<$Res, _$QueueModelImpl>
    implements _$$QueueModelImplCopyWith<$Res> {
  __$$QueueModelImplCopyWithImpl(
      _$QueueModelImpl _value, $Res Function(_$QueueModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QueueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicIds = null,
    Object? currentPosition = null,
    Object? playbackPosition = null,
    Object? isShuffleEnabled = null,
    Object? repeatMode = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_$QueueModelImpl(
      musicIds: null == musicIds
          ? _value._musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      playbackPosition: null == playbackPosition
          ? _value.playbackPosition
          : playbackPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isShuffleEnabled: null == isShuffleEnabled
          ? _value.isShuffleEnabled
          : isShuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QueueModelImpl extends _QueueModel {
  const _$QueueModelImpl(
      {@HiveField(0) final List<String> musicIds = const [],
      @HiveField(1) this.currentPosition = 0,
      @HiveField(2) this.playbackPosition = 0,
      @HiveField(3) this.isShuffleEnabled = false,
      @HiveField(4) this.repeatMode = 0,
      @HiveField(5) required this.lastUpdatedAt})
      : _musicIds = musicIds,
        super._();

  /// List of music IDs in queue order
  final List<String> _musicIds;

  /// List of music IDs in queue order
  @override
  @JsonKey()
  @HiveField(0)
  List<String> get musicIds {
    if (_musicIds is EqualUnmodifiableListView) return _musicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musicIds);
  }

  /// Current position in queue
  @override
  @JsonKey()
  @HiveField(1)
  final int currentPosition;

  /// Current playback position in milliseconds
  @override
  @JsonKey()
  @HiveField(2)
  final int playbackPosition;

  /// Shuffle mode enabled
  @override
  @JsonKey()
  @HiveField(3)
  final bool isShuffleEnabled;

  /// Repeat mode (0=off, 1=one, 2=all)
  @override
  @JsonKey()
  @HiveField(4)
  final int repeatMode;

  /// Last updated timestamp (Unix timestamp)
  @override
  @HiveField(5)
  final int lastUpdatedAt;

  @override
  String toString() {
    return 'QueueModel(musicIds: $musicIds, currentPosition: $currentPosition, playbackPosition: $playbackPosition, isShuffleEnabled: $isShuffleEnabled, repeatMode: $repeatMode, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueModelImpl &&
            const DeepCollectionEquality().equals(other._musicIds, _musicIds) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.playbackPosition, playbackPosition) ||
                other.playbackPosition == playbackPosition) &&
            (identical(other.isShuffleEnabled, isShuffleEnabled) ||
                other.isShuffleEnabled == isShuffleEnabled) &&
            (identical(other.repeatMode, repeatMode) ||
                other.repeatMode == repeatMode) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_musicIds),
      currentPosition,
      playbackPosition,
      isShuffleEnabled,
      repeatMode,
      lastUpdatedAt);

  /// Create a copy of QueueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueModelImplCopyWith<_$QueueModelImpl> get copyWith =>
      __$$QueueModelImplCopyWithImpl<_$QueueModelImpl>(this, _$identity);
}

abstract class _QueueModel extends QueueModel {
  const factory _QueueModel(
      {@HiveField(0) final List<String> musicIds,
      @HiveField(1) final int currentPosition,
      @HiveField(2) final int playbackPosition,
      @HiveField(3) final bool isShuffleEnabled,
      @HiveField(4) final int repeatMode,
      @HiveField(5) required final int lastUpdatedAt}) = _$QueueModelImpl;
  const _QueueModel._() : super._();

  /// List of music IDs in queue order
  @override
  @HiveField(0)
  List<String> get musicIds;

  /// Current position in queue
  @override
  @HiveField(1)
  int get currentPosition;

  /// Current playback position in milliseconds
  @override
  @HiveField(2)
  int get playbackPosition;

  /// Shuffle mode enabled
  @override
  @HiveField(3)
  bool get isShuffleEnabled;

  /// Repeat mode (0=off, 1=one, 2=all)
  @override
  @HiveField(4)
  int get repeatMode;

  /// Last updated timestamp (Unix timestamp)
  @override
  @HiveField(5)
  int get lastUpdatedAt;

  /// Create a copy of QueueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueModelImplCopyWith<_$QueueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
