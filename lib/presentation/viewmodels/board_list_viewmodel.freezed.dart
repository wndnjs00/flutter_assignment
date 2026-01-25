// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_list_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoardListState {
  List<BoardListItem> get boards => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Map<String, String> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardListStateCopyWith<BoardListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListStateCopyWith<$Res> {
  factory $BoardListStateCopyWith(
          BoardListState value, $Res Function(BoardListState) then) =
      _$BoardListStateCopyWithImpl<$Res, BoardListState>;
  @useResult
  $Res call(
      {List<BoardListItem> boards,
      Pagination? pagination,
      bool isLoading,
      bool isLoadingMore,
      String? error,
      Map<String, String> categories});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$BoardListStateCopyWithImpl<$Res, $Val extends BoardListState>
    implements $BoardListStateCopyWith<$Res> {
  _$BoardListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boards = null,
    Object? pagination = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      boards: null == boards
          ? _value.boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardListItem>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardListStateImplCopyWith<$Res>
    implements $BoardListStateCopyWith<$Res> {
  factory _$$BoardListStateImplCopyWith(_$BoardListStateImpl value,
          $Res Function(_$BoardListStateImpl) then) =
      __$$BoardListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BoardListItem> boards,
      Pagination? pagination,
      bool isLoading,
      bool isLoadingMore,
      String? error,
      Map<String, String> categories});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$BoardListStateImplCopyWithImpl<$Res>
    extends _$BoardListStateCopyWithImpl<$Res, _$BoardListStateImpl>
    implements _$$BoardListStateImplCopyWith<$Res> {
  __$$BoardListStateImplCopyWithImpl(
      _$BoardListStateImpl _value, $Res Function(_$BoardListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boards = null,
    Object? pagination = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
    Object? categories = null,
  }) {
    return _then(_$BoardListStateImpl(
      boards: null == boards
          ? _value._boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardListItem>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$BoardListStateImpl implements _BoardListState {
  const _$BoardListStateImpl(
      {final List<BoardListItem> boards = const [],
      this.pagination,
      this.isLoading = false,
      this.isLoadingMore = false,
      this.error,
      final Map<String, String> categories = const {}})
      : _boards = boards,
        _categories = categories;

  final List<BoardListItem> _boards;
  @override
  @JsonKey()
  List<BoardListItem> get boards {
    if (_boards is EqualUnmodifiableListView) return _boards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boards);
  }

  @override
  final Pagination? pagination;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? error;
  final Map<String, String> _categories;
  @override
  @JsonKey()
  Map<String, String> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  @override
  String toString() {
    return 'BoardListState(boards: $boards, pagination: $pagination, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardListStateImpl &&
            const DeepCollectionEquality().equals(other._boards, _boards) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boards),
      pagination,
      isLoading,
      isLoadingMore,
      error,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardListStateImplCopyWith<_$BoardListStateImpl> get copyWith =>
      __$$BoardListStateImplCopyWithImpl<_$BoardListStateImpl>(
          this, _$identity);
}

abstract class _BoardListState implements BoardListState {
  const factory _BoardListState(
      {final List<BoardListItem> boards,
      final Pagination? pagination,
      final bool isLoading,
      final bool isLoadingMore,
      final String? error,
      final Map<String, String> categories}) = _$BoardListStateImpl;

  @override
  List<BoardListItem> get boards;
  @override
  Pagination? get pagination;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  String? get error;
  @override
  Map<String, String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$BoardListStateImplCopyWith<_$BoardListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
