// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_list_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardListItemResponse _$BoardListItemResponseFromJson(
    Map<String, dynamic> json) {
  return _BoardListItemResponse.fromJson(json);
}

/// @nodoc
mixin _$BoardListItemResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardListItemResponseCopyWith<BoardListItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListItemResponseCopyWith<$Res> {
  factory $BoardListItemResponseCopyWith(BoardListItemResponse value,
          $Res Function(BoardListItemResponse) then) =
      _$BoardListItemResponseCopyWithImpl<$Res, BoardListItemResponse>;
  @useResult
  $Res call(
      {int id,
      String title,
      String category,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      DateTime createdAt});
}

/// @nodoc
class _$BoardListItemResponseCopyWithImpl<$Res,
        $Val extends BoardListItemResponse>
    implements $BoardListItemResponseCopyWith<$Res> {
  _$BoardListItemResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$BoardListItemResponseImplCopyWith<$Res>
    implements $BoardListItemResponseCopyWith<$Res> {
  factory _$$BoardListItemResponseImplCopyWith(
          _$BoardListItemResponseImpl value,
          $Res Function(_$BoardListItemResponseImpl) then) =
      __$$BoardListItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String category,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      DateTime createdAt});
}

/// @nodoc
class __$$BoardListItemResponseImplCopyWithImpl<$Res>
    extends _$BoardListItemResponseCopyWithImpl<$Res,
        _$BoardListItemResponseImpl>
    implements _$$BoardListItemResponseImplCopyWith<$Res> {
  __$$BoardListItemResponseImplCopyWithImpl(_$BoardListItemResponseImpl _value,
      $Res Function(_$BoardListItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? createdAt = null,
  }) {
    return _then(_$BoardListItemResponseImpl(
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
@JsonSerializable()
class _$BoardListItemResponseImpl implements _BoardListItemResponse {
  const _$BoardListItemResponseImpl(
      {required this.id,
      required this.title,
      required this.category,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      required this.createdAt});

  factory _$BoardListItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardListItemResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String category;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'BoardListItemResponse(id: $id, title: $title, category: $category, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardListItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, category, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardListItemResponseImplCopyWith<_$BoardListItemResponseImpl>
      get copyWith => __$$BoardListItemResponseImplCopyWithImpl<
          _$BoardListItemResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardListItemResponseImplToJson(
      this,
    );
  }
}

abstract class _BoardListItemResponse implements BoardListItemResponse {
  const factory _BoardListItemResponse(
      {required final int id,
      required final String title,
      required final String category,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      required final DateTime createdAt}) = _$BoardListItemResponseImpl;

  factory _BoardListItemResponse.fromJson(Map<String, dynamic> json) =
      _$BoardListItemResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get category;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BoardListItemResponseImplCopyWith<_$BoardListItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
