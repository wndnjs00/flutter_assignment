// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_detail_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoardDetailState {
  Board? get board => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  bool get deleteSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardDetailStateCopyWith<BoardDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardDetailStateCopyWith<$Res> {
  factory $BoardDetailStateCopyWith(
          BoardDetailState value, $Res Function(BoardDetailState) then) =
      _$BoardDetailStateCopyWithImpl<$Res, BoardDetailState>;
  @useResult
  $Res call(
      {Board? board,
      bool isLoading,
      String? error,
      bool isDeleting,
      bool deleteSuccess});

  $BoardCopyWith<$Res>? get board;
}

/// @nodoc
class _$BoardDetailStateCopyWithImpl<$Res, $Val extends BoardDetailState>
    implements $BoardDetailStateCopyWith<$Res> {
  _$BoardDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? isDeleting = null,
    Object? deleteSuccess = null,
  }) {
    return _then(_value.copyWith(
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res>? get board {
    if (_value.board == null) {
      return null;
    }

    return $BoardCopyWith<$Res>(_value.board!, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardDetailStateImplCopyWith<$Res>
    implements $BoardDetailStateCopyWith<$Res> {
  factory _$$BoardDetailStateImplCopyWith(_$BoardDetailStateImpl value,
          $Res Function(_$BoardDetailStateImpl) then) =
      __$$BoardDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Board? board,
      bool isLoading,
      String? error,
      bool isDeleting,
      bool deleteSuccess});

  @override
  $BoardCopyWith<$Res>? get board;
}

/// @nodoc
class __$$BoardDetailStateImplCopyWithImpl<$Res>
    extends _$BoardDetailStateCopyWithImpl<$Res, _$BoardDetailStateImpl>
    implements _$$BoardDetailStateImplCopyWith<$Res> {
  __$$BoardDetailStateImplCopyWithImpl(_$BoardDetailStateImpl _value,
      $Res Function(_$BoardDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? isDeleting = null,
    Object? deleteSuccess = null,
  }) {
    return _then(_$BoardDetailStateImpl(
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BoardDetailStateImpl implements _BoardDetailState {
  const _$BoardDetailStateImpl(
      {this.board,
      this.isLoading = false,
      this.error,
      this.isDeleting = false,
      this.deleteSuccess = false});

  @override
  final Board? board;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool deleteSuccess;

  @override
  String toString() {
    return 'BoardDetailState(board: $board, isLoading: $isLoading, error: $error, isDeleting: $isDeleting, deleteSuccess: $deleteSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardDetailStateImpl &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, board, isLoading, error, isDeleting, deleteSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardDetailStateImplCopyWith<_$BoardDetailStateImpl> get copyWith =>
      __$$BoardDetailStateImplCopyWithImpl<_$BoardDetailStateImpl>(
          this, _$identity);
}

abstract class _BoardDetailState implements BoardDetailState {
  const factory _BoardDetailState(
      {final Board? board,
      final bool isLoading,
      final String? error,
      final bool isDeleting,
      final bool deleteSuccess}) = _$BoardDetailStateImpl;

  @override
  Board? get board;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  bool get isDeleting;
  @override
  bool get deleteSuccess;
  @override
  @JsonKey(ignore: true)
  _$$BoardDetailStateImplCopyWith<_$BoardDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
