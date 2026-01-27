// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikeState {
  Set<int> get likedPostIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeStateCopyWith<LikeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeStateCopyWith<$Res> {
  factory $LikeStateCopyWith(LikeState value, $Res Function(LikeState) then) =
      _$LikeStateCopyWithImpl<$Res, LikeState>;
  @useResult
  $Res call({Set<int> likedPostIds});
}

/// @nodoc
class _$LikeStateCopyWithImpl<$Res, $Val extends LikeState>
    implements $LikeStateCopyWith<$Res> {
  _$LikeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedPostIds = null,
  }) {
    return _then(_value.copyWith(
      likedPostIds: null == likedPostIds
          ? _value.likedPostIds
          : likedPostIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeStateImplCopyWith<$Res>
    implements $LikeStateCopyWith<$Res> {
  factory _$$LikeStateImplCopyWith(
          _$LikeStateImpl value, $Res Function(_$LikeStateImpl) then) =
      __$$LikeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<int> likedPostIds});
}

/// @nodoc
class __$$LikeStateImplCopyWithImpl<$Res>
    extends _$LikeStateCopyWithImpl<$Res, _$LikeStateImpl>
    implements _$$LikeStateImplCopyWith<$Res> {
  __$$LikeStateImplCopyWithImpl(
      _$LikeStateImpl _value, $Res Function(_$LikeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedPostIds = null,
  }) {
    return _then(_$LikeStateImpl(
      likedPostIds: null == likedPostIds
          ? _value._likedPostIds
          : likedPostIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$LikeStateImpl implements _LikeState {
  const _$LikeStateImpl({final Set<int> likedPostIds = const {}})
      : _likedPostIds = likedPostIds;

  final Set<int> _likedPostIds;
  @override
  @JsonKey()
  Set<int> get likedPostIds {
    if (_likedPostIds is EqualUnmodifiableSetView) return _likedPostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_likedPostIds);
  }

  @override
  String toString() {
    return 'LikeState(likedPostIds: $likedPostIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._likedPostIds, _likedPostIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_likedPostIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeStateImplCopyWith<_$LikeStateImpl> get copyWith =>
      __$$LikeStateImplCopyWithImpl<_$LikeStateImpl>(this, _$identity);
}

abstract class _LikeState implements LikeState {
  const factory _LikeState({final Set<int> likedPostIds}) = _$LikeStateImpl;

  @override
  Set<int> get likedPostIds;
  @override
  @JsonKey(ignore: true)
  _$$LikeStateImplCopyWith<_$LikeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
