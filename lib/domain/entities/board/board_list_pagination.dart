import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/domain/entities/board/pagination.dart';

class BoardListPagination {
  final List<BoardListItem> items;
  final Pagination pagination;

  BoardListPagination({required this.items, required this.pagination});
}
