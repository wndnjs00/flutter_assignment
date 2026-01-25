import 'dart:io';

import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/entities/board/board_list_pagination.dart';

abstract class BoardRepository {
  Future<int> createBoard({
    required String title,
    required String content,
    required String category,
    File? image,
  });

  Future<Board> getBoard(int id);

  Future<BoardListPagination> getBoardList({
    required int page,
    required int size,
  });

  Future<void> updateBoard({
    required int id,
    required String title,
    required String content,
    required String category,
    File? image,
  });

  Future<void> deleteBoard(int id);

  Future<Map<String, String>> getCategories();
}
