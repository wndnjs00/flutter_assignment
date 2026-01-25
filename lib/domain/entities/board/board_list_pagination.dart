import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/domain/entities/board/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_list_pagination.freezed.dart';

@freezed
class BoardListPagination with _$BoardListPagination {
  const factory BoardListPagination({
    required List<BoardListItem> items,
    required Pagination pagination,
  }) = _BoardListPagination;
}