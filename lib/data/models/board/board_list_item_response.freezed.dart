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

BoardDetailResponse _$BoardDetailResponseFromJson(Map<String, dynamic> json) {
  return _BoardDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$BoardDetailResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get boardCategory => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardDetailResponseCopyWith<BoardDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardDetailResponseCopyWith<$Res> {
  factory $BoardDetailResponseCopyWith(
          BoardDetailResponse value, $Res Function(BoardDetailResponse) then) =
      _$BoardDetailResponseCopyWithImpl<$Res, BoardDetailResponse>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String boardCategory,
      String? imageUrl,
      String createdAt});
}

/// @nodoc
class _$BoardDetailResponseCopyWithImpl<$Res, $Val extends BoardDetailResponse>
    implements $BoardDetailResponseCopyWith<$Res> {
  _$BoardDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? boardCategory = null,
    Object? imageUrl = freezed,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      boardCategory: null == boardCategory
          ? _value.boardCategory
          : boardCategory // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardDetailResponseImplCopyWith<$Res>
    implements $BoardDetailResponseCopyWith<$Res> {
  factory _$$BoardDetailResponseImplCopyWith(_$BoardDetailResponseImpl value,
          $Res Function(_$BoardDetailResponseImpl) then) =
      __$$BoardDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String boardCategory,
      String? imageUrl,
      String createdAt});
}

/// @nodoc
class __$$BoardDetailResponseImplCopyWithImpl<$Res>
    extends _$BoardDetailResponseCopyWithImpl<$Res, _$BoardDetailResponseImpl>
    implements _$$BoardDetailResponseImplCopyWith<$Res> {
  __$$BoardDetailResponseImplCopyWithImpl(_$BoardDetailResponseImpl _value,
      $Res Function(_$BoardDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? boardCategory = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$BoardDetailResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      boardCategory: null == boardCategory
          ? _value.boardCategory
          : boardCategory // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardDetailResponseImpl implements _BoardDetailResponse {
  const _$BoardDetailResponseImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.boardCategory,
      this.imageUrl,
      required this.createdAt});

  factory _$BoardDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardDetailResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String boardCategory;
  @override
  final String? imageUrl;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'BoardDetailResponse(id: $id, title: $title, content: $content, boardCategory: $boardCategory, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.boardCategory, boardCategory) ||
                other.boardCategory == boardCategory) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, boardCategory, imageUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardDetailResponseImplCopyWith<_$BoardDetailResponseImpl> get copyWith =>
      __$$BoardDetailResponseImplCopyWithImpl<_$BoardDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _BoardDetailResponse implements BoardDetailResponse {
  const factory _BoardDetailResponse(
      {required final int id,
      required final String title,
      required final String content,
      required final String boardCategory,
      final String? imageUrl,
      required final String createdAt}) = _$BoardDetailResponseImpl;

  factory _BoardDetailResponse.fromJson(Map<String, dynamic> json) =
      _$BoardDetailResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get boardCategory;
  @override
  String? get imageUrl;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BoardDetailResponseImplCopyWith<_$BoardDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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

Pageable _$PageableFromJson(Map<String, dynamic> json) {
  return _Pageable.fromJson(json);
}

/// @nodoc
mixin _$Pageable {
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool get paged => throw _privateConstructorUsedError;
  bool get unpaged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageableCopyWith<Pageable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableCopyWith<$Res> {
  factory $PageableCopyWith(Pageable value, $Res Function(Pageable) then) =
      _$PageableCopyWithImpl<$Res, Pageable>;
  @useResult
  $Res call(
      {int pageNumber, int pageSize, int offset, bool paged, bool unpaged});
}

/// @nodoc
class _$PageableCopyWithImpl<$Res, $Val extends Pageable>
    implements $PageableCopyWith<$Res> {
  _$PageableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? paged = null,
    Object? unpaged = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      paged: null == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool,
      unpaged: null == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageableImplCopyWith<$Res>
    implements $PageableCopyWith<$Res> {
  factory _$$PageableImplCopyWith(
          _$PageableImpl value, $Res Function(_$PageableImpl) then) =
      __$$PageableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageNumber, int pageSize, int offset, bool paged, bool unpaged});
}

/// @nodoc
class __$$PageableImplCopyWithImpl<$Res>
    extends _$PageableCopyWithImpl<$Res, _$PageableImpl>
    implements _$$PageableImplCopyWith<$Res> {
  __$$PageableImplCopyWithImpl(
      _$PageableImpl _value, $Res Function(_$PageableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? paged = null,
    Object? unpaged = null,
  }) {
    return _then(_$PageableImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      paged: null == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool,
      unpaged: null == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageableImpl implements _Pageable {
  const _$PageableImpl(
      {required this.pageNumber,
      required this.pageSize,
      required this.offset,
      required this.paged,
      required this.unpaged});

  factory _$PageableImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageableImplFromJson(json);

  @override
  final int pageNumber;
  @override
  final int pageSize;
  @override
  final int offset;
  @override
  final bool paged;
  @override
  final bool unpaged;

  @override
  String toString() {
    return 'Pageable(pageNumber: $pageNumber, pageSize: $pageSize, offset: $offset, paged: $paged, unpaged: $unpaged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.paged, paged) || other.paged == paged) &&
            (identical(other.unpaged, unpaged) || other.unpaged == unpaged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageNumber, pageSize, offset, paged, unpaged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      __$$PageableImplCopyWithImpl<_$PageableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageableImplToJson(
      this,
    );
  }
}

abstract class _Pageable implements Pageable {
  const factory _Pageable(
      {required final int pageNumber,
      required final int pageSize,
      required final int offset,
      required final bool paged,
      required final bool unpaged}) = _$PageableImpl;

  factory _Pageable.fromJson(Map<String, dynamic> json) =
      _$PageableImpl.fromJson;

  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  int get offset;
  @override
  bool get paged;
  @override
  bool get unpaged;
  @override
  @JsonKey(ignore: true)
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
