import 'package:json_annotation/json_annotation.dart';

part 'board_list_item_response.g.dart';

// 글 상세 조회
@JsonSerializable()
class BoardDetailResponse {
  final int id;
  final String title;
  final String content;
  final String boardCategory;
  final String? imageUrl;
  final String createdAt;

  BoardDetailResponse({
    required this.id,
    required this.title,
    required this.content,
    required this.boardCategory,
    this.imageUrl,
    required this.createdAt,
  });

  factory BoardDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardDetailResponseToJson(this);
}

// 글 목록 조회
@JsonSerializable()
class BoardListItemResponse {
  final int id;
  final String title;
  final String category;

  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime createdAt;

  BoardListItemResponse({
    required this.id,
    required this.title,
    required this.category,
    required this.createdAt,
  });

  factory BoardListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardListItemResponseToJson(this);

  static DateTime _dateTimeFromJson(String value) => DateTime.parse(value);

  static String _dateTimeToJson(DateTime dateTime) =>
      dateTime.toIso8601String();
}

@JsonSerializable()
class Pageable {
  final int pageNumber;
  final int pageSize;
  final int offset;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}
