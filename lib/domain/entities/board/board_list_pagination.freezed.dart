// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_list_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoardListPagination {
  List<BoardListItem> get items => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardListPaginationCopyWith<BoardListPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListPaginationCopyWith<$Res> {
  factory $BoardListPaginationCopyWith(
          BoardListPagination value, $Res Function(BoardListPagination) then) =
      _$BoardListPaginationCopyWithImpl<$Res, BoardListPagination>;
  @useResult
  $Res call({List<BoardListItem> items, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$BoardListPaginationCopyWithImpl<$Res, $Val extends BoardListPagination>
    implements $BoardListPaginationCopyWith<$Res> {
  _$BoardListPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BoardListItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardListPaginationImplCopyWith<$Res>
    implements $BoardListPaginationCopyWith<$Res> {
  factory _$$BoardListPaginationImplCopyWith(_$BoardListPaginationImpl value,
          $Res Function(_$BoardListPaginationImpl) then) =
      __$$BoardListPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BoardListItem> items, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$BoardListPaginationImplCopyWithImpl<$Res>
    extends _$BoardListPaginationCopyWithImpl<$Res, _$BoardListPaginationImpl>
    implements _$$BoardListPaginationImplCopyWith<$Res> {
  __$$BoardListPaginationImplCopyWithImpl(_$BoardListPaginationImpl _value,
      $Res Function(_$BoardListPaginationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
  }) {
    return _then(_$BoardListPaginationImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BoardListItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc

class _$BoardListPaginationImpl implements _BoardListPagination {
  const _$BoardListPaginationImpl(
      {required final List<BoardListItem> items, required this.pagination})
      : _items = items;

  final List<BoardListItem> _items;
  @override
  List<BoardListItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'BoardListPagination(items: $items, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardListPaginationImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardListPaginationImplCopyWith<_$BoardListPaginationImpl> get copyWith =>
      __$$BoardListPaginationImplCopyWithImpl<_$BoardListPaginationImpl>(
          this, _$identity);
}

abstract class _BoardListPagination implements BoardListPagination {
  const factory _BoardListPagination(
      {required final List<BoardListItem> items,
      required final Pagination pagination}) = _$BoardListPaginationImpl;

  @override
  List<BoardListItem> get items;
  @override
  Pagination get pagination;
  @override
  @JsonKey(ignore: true)
  _$$BoardListPaginationImplCopyWith<_$BoardListPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
