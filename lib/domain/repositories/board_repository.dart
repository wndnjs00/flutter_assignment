import 'dart:io';

import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/entities/board/board_list_pagination.dart';

abstract class BoardRepository {

  // 글쓰기
  Future<int> createBoard({
    required String title,
    required String content,
    required String category,
    File? image,
  });

  // 글조회 (디테일 페이지조회)
  Future<Board> getDetailBoard(int id);

  // 글목록 조회
  Future<BoardListPagination> getBoardList({
    required int page,
    required int size,
  });

  // 글수정
  Future<void> updateBoard({
    required int id,
    required String title,
    required String content,
    required String category,
    File? image,
  });

  // 글삭제
  Future<void> deleteBoard(int id);

  // 게시판 카테고리
  Future<Map<String, String>> getCategories();
}
