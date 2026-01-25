// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardListResponse _$BoardListResponseFromJson(Map<String, dynamic> json) {
  return _BoardListResponse.fromJson(json);
}

/// @nodoc
mixin _$BoardListResponse {
  List<BoardListItemResponse> get content => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;
  int get numberOfElements => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  bool get first => throw _privateConstructorUsedError;
  bool get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardListResponseCopyWith<BoardListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListResponseCopyWith<$Res> {
  factory $BoardListResponseCopyWith(
          BoardListResponse value, $Res Function(BoardListResponse) then) =
      _$BoardListResponseCopyWithImpl<$Res, BoardListResponse>;
  @useResult
  $Res call(
      {List<BoardListItemResponse> content,
      Pageable pageable,
      int totalPages,
      int totalElements,
      bool last,
      int numberOfElements,
      int size,
      int number,
      bool first,
      bool empty});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$BoardListResponseCopyWithImpl<$Res, $Val extends BoardListResponse>
    implements $BoardListResponseCopyWith<$Res> {
  _$BoardListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageable = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? last = null,
    Object? numberOfElements = null,
    Object? size = null,
    Object? number = null,
    Object? first = null,
    Object? empty = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<BoardListItemResponse>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfElements: null == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool,
      empty: null == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageableCopyWith<$Res> get pageable {
    return $PageableCopyWith<$Res>(_value.pageable, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardListResponseImplCopyWith<$Res>
    implements $BoardListResponseCopyWith<$Res> {
  factory _$$BoardListResponseImplCopyWith(_$BoardListResponseImpl value,
          $Res Function(_$BoardListResponseImpl) then) =
      __$$BoardListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BoardListItemResponse> content,
      Pageable pageable,
      int totalPages,
      int totalElements,
      bool last,
      int numberOfElements,
      int size,
      int number,
      bool first,
      bool empty});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$BoardListResponseImplCopyWithImpl<$Res>
    extends _$BoardListResponseCopyWithImpl<$Res, _$BoardListResponseImpl>
    implements _$$BoardListResponseImplCopyWith<$Res> {
  __$$BoardListResponseImplCopyWithImpl(_$BoardListResponseImpl _value,
      $Res Function(_$BoardListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageable = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? last = null,
    Object? numberOfElements = null,
    Object? size = null,
    Object? number = null,
    Object? first = null,
    Object? empty = null,
  }) {
    return _then(_$BoardListResponseImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<BoardListItemResponse>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfElements: null == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool,
      empty: null == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardListResponseImpl implements _BoardListResponse {
  const _$BoardListResponseImpl(
      {required final List<BoardListItemResponse> content,
      required this.pageable,
      required this.totalPages,
      required this.totalElements,
      required this.last,
      required this.numberOfElements,
      required this.size,
      required this.number,
      required this.first,
      required this.empty})
      : _content = content;

  factory _$BoardListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardListResponseImplFromJson(json);

  final List<BoardListItemResponse> _content;
  @override
  List<BoardListItemResponse> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Pageable pageable;
  @override
  final int totalPages;
  @override
  final int totalElements;
  @override
  final bool last;
  @override
  final int numberOfElements;
  @override
  final int size;
  @override
  final int number;
  @override
  final bool first;
  @override
  final bool empty;

  @override
  String toString() {
    return 'BoardListResponse(content: $content, pageable: $pageable, totalPages: $totalPages, totalElements: $totalElements, last: $last, numberOfElements: $numberOfElements, size: $size, number: $number, first: $first, empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardListResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.numberOfElements, numberOfElements) ||
                other.numberOfElements == numberOfElements) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      pageable,
      totalPages,
      totalElements,
      last,
      numberOfElements,
      size,
      number,
      first,
      empty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardListResponseImplCopyWith<_$BoardListResponseImpl> get copyWith =>
      __$$BoardListResponseImplCopyWithImpl<_$BoardListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardListResponseImplToJson(
      this,
    );
  }
}

abstract class _BoardListResponse implements BoardListResponse {
  const factory _BoardListResponse(
      {required final List<BoardListItemResponse> content,
      required final Pageable pageable,
      required final int totalPages,
      required final int totalElements,
      required final bool last,
      required final int numberOfElements,
      required final int size,
      required final int number,
      required final bool first,
      required final bool empty}) = _$BoardListResponseImpl;

  factory _BoardListResponse.fromJson(Map<String, dynamic> json) =
      _$BoardListResponseImpl.fromJson;

  @override
  List<BoardListItemResponse> get content;
  @override
  Pageable get pageable;
  @override
  int get totalPages;
  @override
  int get totalElements;
  @override
  bool get last;
  @override
  int get numberOfElements;
  @override
  int get size;
  @override
  int get number;
  @override
  bool get first;
  @override
  bool get empty;
  @override
  @JsonKey(ignore: true)
  _$$BoardListResponseImplCopyWith<_$BoardListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
