// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardRequest _$BoardRequestFromJson(Map<String, dynamic> json) {
  return _BoardRequest.fromJson(json);
}

/// @nodoc
mixin _$BoardRequest {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardRequestCopyWith<BoardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardRequestCopyWith<$Res> {
  factory $BoardRequestCopyWith(
          BoardRequest value, $Res Function(BoardRequest) then) =
      _$BoardRequestCopyWithImpl<$Res, BoardRequest>;
  @useResult
  $Res call({String title, String content, String category});
}

/// @nodoc
class _$BoardRequestCopyWithImpl<$Res, $Val extends BoardRequest>
    implements $BoardRequestCopyWith<$Res> {
  _$BoardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardRequestImplCopyWith<$Res>
    implements $BoardRequestCopyWith<$Res> {
  factory _$$BoardRequestImplCopyWith(
          _$BoardRequestImpl value, $Res Function(_$BoardRequestImpl) then) =
      __$$BoardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String category});
}

/// @nodoc
class __$$BoardRequestImplCopyWithImpl<$Res>
    extends _$BoardRequestCopyWithImpl<$Res, _$BoardRequestImpl>
    implements _$$BoardRequestImplCopyWith<$Res> {
  __$$BoardRequestImplCopyWithImpl(
      _$BoardRequestImpl _value, $Res Function(_$BoardRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(_$BoardRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardRequestImpl implements _BoardRequest {
  const _$BoardRequestImpl(
      {required this.title, required this.content, required this.category});

  factory _$BoardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String category;

  @override
  String toString() {
    return 'BoardRequest(title: $title, content: $content, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardRequestImplCopyWith<_$BoardRequestImpl> get copyWith =>
      __$$BoardRequestImplCopyWithImpl<_$BoardRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardRequestImplToJson(
      this,
    );
  }
}

abstract class _BoardRequest implements BoardRequest {
  const factory _BoardRequest(
      {required final String title,
      required final String content,
      required final String category}) = _$BoardRequestImpl;

  factory _BoardRequest.fromJson(Map<String, dynamic> json) =
      _$BoardRequestImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$BoardRequestImplCopyWith<_$BoardRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
