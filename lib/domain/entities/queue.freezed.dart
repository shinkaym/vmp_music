// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Queue {
  /// Unique identifier for the queue
  String get id => throw _privateConstructorUsedError;

  /// List of music IDs in queue order
  List<String> get musicIds => throw _privateConstructorUsedError;

  /// Current position index in the queue
  int get currentIndex => throw _privateConstructorUsedError;

  /// Date when queue was created (Unix timestamp)
  int get createdAt => throw _privateConstructorUsedError;

  /// Date when queue was last modified (Unix timestamp)
  int get modifiedAt => throw _privateConstructorUsedError;

  /// Create a copy of Queue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueCopyWith<Queue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueCopyWith<$Res> {
  factory $QueueCopyWith(Queue value, $Res Function(Queue) then) =
      _$QueueCopyWithImpl<$Res, Queue>;
  @useResult
  $Res call(
      {String id,
      List<String> musicIds,
      int currentIndex,
      int createdAt,
      int modifiedAt});
}

/// @nodoc
class _$QueueCopyWithImpl<$Res, $Val extends Queue>
    implements $QueueCopyWith<$Res> {
  _$QueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Queue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? musicIds = null,
    Object? currentIndex = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      musicIds: null == musicIds
          ? _value.musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueueImplCopyWith<$Res> implements $QueueCopyWith<$Res> {
  factory _$$QueueImplCopyWith(
          _$QueueImpl value, $Res Function(_$QueueImpl) then) =
      __$$QueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> musicIds,
      int currentIndex,
      int createdAt,
      int modifiedAt});
}

/// @nodoc
class __$$QueueImplCopyWithImpl<$Res>
    extends _$QueueCopyWithImpl<$Res, _$QueueImpl>
    implements _$$QueueImplCopyWith<$Res> {
  __$$QueueImplCopyWithImpl(
      _$QueueImpl _value, $Res Function(_$QueueImpl) _then)
      : super(_value, _then);

  /// Create a copy of Queue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? musicIds = null,
    Object? currentIndex = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$QueueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      musicIds: null == musicIds
          ? _value._musicIds
          : musicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QueueImpl extends _Queue {
  const _$QueueImpl(
      {required this.id,
      final List<String> musicIds = const [],
      this.currentIndex = 0,
      required this.createdAt,
      required this.modifiedAt})
      : _musicIds = musicIds,
        super._();

  /// Unique identifier for the queue
  @override
  final String id;

  /// List of music IDs in queue order
  final List<String> _musicIds;

  /// List of music IDs in queue order
  @override
  @JsonKey()
  List<String> get musicIds {
    if (_musicIds is EqualUnmodifiableListView) return _musicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musicIds);
  }

  /// Current position index in the queue
  @override
  @JsonKey()
  final int currentIndex;

  /// Date when queue was created (Unix timestamp)
  @override
  final int createdAt;

  /// Date when queue was last modified (Unix timestamp)
  @override
  final int modifiedAt;

  @override
  String toString() {
    return 'Queue(id: $id, musicIds: $musicIds, currentIndex: $currentIndex, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._musicIds, _musicIds) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_musicIds),
      currentIndex,
      createdAt,
      modifiedAt);

  /// Create a copy of Queue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueImplCopyWith<_$QueueImpl> get copyWith =>
      __$$QueueImplCopyWithImpl<_$QueueImpl>(this, _$identity);
}

abstract class _Queue extends Queue {
  const factory _Queue(
      {required final String id,
      final List<String> musicIds,
      final int currentIndex,
      required final int createdAt,
      required final int modifiedAt}) = _$QueueImpl;
  const _Queue._() : super._();

  /// Unique identifier for the queue
  @override
  String get id;

  /// List of music IDs in queue order
  @override
  List<String> get musicIds;

  /// Current position index in the queue
  @override
  int get currentIndex;

  /// Date when queue was created (Unix timestamp)
  @override
  int get createdAt;

  /// Date when queue was last modified (Unix timestamp)
  @override
  int get modifiedAt;

  /// Create a copy of Queue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueImplCopyWith<_$QueueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
