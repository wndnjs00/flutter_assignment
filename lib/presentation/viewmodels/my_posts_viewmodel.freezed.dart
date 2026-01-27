// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_posts_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyPostsState {
  Set<int> get myPostIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPostsStateCopyWith<MyPostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostsStateCopyWith<$Res> {
  factory $MyPostsStateCopyWith(
          MyPostsState value, $Res Function(MyPostsState) then) =
      _$MyPostsStateCopyWithImpl<$Res, MyPostsState>;
  @useResult
  $Res call({Set<int> myPostIds});
}

/// @nodoc
class _$MyPostsStateCopyWithImpl<$Res, $Val extends MyPostsState>
    implements $MyPostsStateCopyWith<$Res> {
  _$MyPostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myPostIds = null,
  }) {
    return _then(_value.copyWith(
      myPostIds: null == myPostIds
          ? _value.myPostIds
          : myPostIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPostsStateImplCopyWith<$Res>
    implements $MyPostsStateCopyWith<$Res> {
  factory _$$MyPostsStateImplCopyWith(
          _$MyPostsStateImpl value, $Res Function(_$MyPostsStateImpl) then) =
      __$$MyPostsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<int> myPostIds});
}

/// @nodoc
class __$$MyPostsStateImplCopyWithImpl<$Res>
    extends _$MyPostsStateCopyWithImpl<$Res, _$MyPostsStateImpl>
    implements _$$MyPostsStateImplCopyWith<$Res> {
  __$$MyPostsStateImplCopyWithImpl(
      _$MyPostsStateImpl _value, $Res Function(_$MyPostsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myPostIds = null,
  }) {
    return _then(_$MyPostsStateImpl(
      myPostIds: null == myPostIds
          ? _value._myPostIds
          : myPostIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$MyPostsStateImpl implements _MyPostsState {
  const _$MyPostsStateImpl({final Set<int> myPostIds = const {}})
      : _myPostIds = myPostIds;

  final Set<int> _myPostIds;
  @override
  @JsonKey()
  Set<int> get myPostIds {
    if (_myPostIds is EqualUnmodifiableSetView) return _myPostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_myPostIds);
  }

  @override
  String toString() {
    return 'MyPostsState(myPostIds: $myPostIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPostsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._myPostIds, _myPostIds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_myPostIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPostsStateImplCopyWith<_$MyPostsStateImpl> get copyWith =>
      __$$MyPostsStateImplCopyWithImpl<_$MyPostsStateImpl>(this, _$identity);
}

abstract class _MyPostsState implements MyPostsState {
  const factory _MyPostsState({final Set<int> myPostIds}) = _$MyPostsStateImpl;

  @override
  Set<int> get myPostIds;
  @override
  @JsonKey(ignore: true)
  _$$MyPostsStateImplCopyWith<_$MyPostsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
