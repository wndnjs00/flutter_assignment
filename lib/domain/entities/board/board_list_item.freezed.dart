// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoardListItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardListItemCopyWith<BoardListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListItemCopyWith<$Res> {
  factory $BoardListItemCopyWith(
          BoardListItem value, $Res Function(BoardListItem) then) =
      _$BoardListItemCopyWithImpl<$Res, BoardListItem>;
  @useResult
  $Res call({int id, String title, String category, DateTime createdAt});
}

/// @nodoc
class _$BoardListItemCopyWithImpl<$Res, $Val extends BoardListItem>
    implements $BoardListItemCopyWith<$Res> {
  _$BoardListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardListItemImplCopyWith<$Res>
    implements $BoardListItemCopyWith<$Res> {
  factory _$$BoardListItemImplCopyWith(
          _$BoardListItemImpl value, $Res Function(_$BoardListItemImpl) then) =
      __$$BoardListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String category, DateTime createdAt});
}

/// @nodoc
class __$$BoardListItemImplCopyWithImpl<$Res>
    extends _$BoardListItemCopyWithImpl<$Res, _$BoardListItemImpl>
    implements _$$BoardListItemImplCopyWith<$Res> {
  __$$BoardListItemImplCopyWithImpl(
      _$BoardListItemImpl _value, $Res Function(_$BoardListItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? createdAt = null,
  }) {
    return _then(_$BoardListItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BoardListItemImpl implements _BoardListItem {
  const _$BoardListItemImpl(
      {required this.id,
      required this.title,
      required this.category,
      required this.createdAt});

  @override
  final int id;
  @override
  final String title;
  @override
  final String category;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BoardListItem(id: $id, title: $title, category: $category, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, category, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardListItemImplCopyWith<_$BoardListItemImpl> get copyWith =>
      __$$BoardListItemImplCopyWithImpl<_$BoardListItemImpl>(this, _$identity);
}

abstract class _BoardListItem implements BoardListItem {
  const factory _BoardListItem(
      {required final int id,
      required final String title,
      required final String category,
      required final DateTime createdAt}) = _$BoardListItemImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get category;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BoardListItemImplCopyWith<_$BoardListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
