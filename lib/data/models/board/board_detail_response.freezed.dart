// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_detail_response.dart';

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
