import 'package:flutter_assignment/data/models/board/board_list_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_list_response.g.dart';

// 글 목록 조회
@JsonSerializable()
class BoardListResponse {
  final List<BoardListItemResponse> content;
  final Pageable pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int numberOfElements;
  final int size;
  final int number;
  final bool first;
  final bool empty;

  BoardListResponse({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.numberOfElements,
    required this.size,
    required this.number,
    required this.first,
    required this.empty,
  });

  factory BoardListResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardListResponseToJson(this);
}
