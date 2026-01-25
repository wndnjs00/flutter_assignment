// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_create_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardCreateResponse _$BoardCreateResponseFromJson(Map<String, dynamic> json) {
  return _BoardCreateResponse.fromJson(json);
}

/// @nodoc
mixin _$BoardCreateResponse {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCreateResponseCopyWith<BoardCreateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCreateResponseCopyWith<$Res> {
  factory $BoardCreateResponseCopyWith(
          BoardCreateResponse value, $Res Function(BoardCreateResponse) then) =
      _$BoardCreateResponseCopyWithImpl<$Res, BoardCreateResponse>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$BoardCreateResponseCopyWithImpl<$Res, $Val extends BoardCreateResponse>
    implements $BoardCreateResponseCopyWith<$Res> {
  _$BoardCreateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardCreateResponseImplCopyWith<$Res>
    implements $BoardCreateResponseCopyWith<$Res> {
  factory _$$BoardCreateResponseImplCopyWith(_$BoardCreateResponseImpl value,
          $Res Function(_$BoardCreateResponseImpl) then) =
      __$$BoardCreateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$BoardCreateResponseImplCopyWithImpl<$Res>
    extends _$BoardCreateResponseCopyWithImpl<$Res, _$BoardCreateResponseImpl>
    implements _$$BoardCreateResponseImplCopyWith<$Res> {
  __$$BoardCreateResponseImplCopyWithImpl(_$BoardCreateResponseImpl _value,
      $Res Function(_$BoardCreateResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$BoardCreateResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardCreateResponseImpl implements _BoardCreateResponse {
  const _$BoardCreateResponseImpl({required this.id});

  factory _$BoardCreateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardCreateResponseImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'BoardCreateResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardCreateResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardCreateResponseImplCopyWith<_$BoardCreateResponseImpl> get copyWith =>
      __$$BoardCreateResponseImplCopyWithImpl<_$BoardCreateResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardCreateResponseImplToJson(
      this,
    );
  }
}

abstract class _BoardCreateResponse implements BoardCreateResponse {
  const factory _BoardCreateResponse({required final int id}) =
      _$BoardCreateResponseImpl;

  factory _BoardCreateResponse.fromJson(Map<String, dynamic> json) =
      _$BoardCreateResponseImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$BoardCreateResponseImplCopyWith<_$BoardCreateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
