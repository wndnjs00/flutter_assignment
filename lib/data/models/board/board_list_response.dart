import 'package:flutter_assignment/data/models/board/board_list_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_list_response.freezed.dart';
part 'board_list_response.g.dart';

// 글 목록 조회
@freezed
class BoardListResponse with _$BoardListResponse {
  const factory BoardListResponse({
    required List<BoardListItemResponse> content,
    required Pageable pageable,
    required int totalPages,
    required int totalElements,
    required bool last,
    required int numberOfElements,
    required int size,
    required int number,
    required bool first,
    required bool empty,
  }) = _BoardListResponse;

  factory BoardListResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardListResponseFromJson(json);
}
