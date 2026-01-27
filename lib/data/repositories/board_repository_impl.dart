import 'dart:io';

import 'package:flutter_assignment/data/datasources/board_remote_datasource.dart';
import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/domain/entities/board/board_list_pagination.dart';
import 'package:flutter_assignment/domain/entities/board/pagination.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';

class BoardRepositoryImpl implements BoardRepository {
  final BoardRemoteDataSource _remoteDataSource;

  BoardRepositoryImpl(this._remoteDataSource);

  // 글쓰기
  @override
  Future<int> createBoard({
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    final response = await _remoteDataSource.createBoard(
      title: title,
      content: content,
      category: category,
      image: image,
    );
    return response.id;
  }

  // 글조회 (디테일 페이지조회)
  @override
  Future<Board> getDetailBoard(int id) async {
    final response = await _remoteDataSource.getDetailBoard(id);

    return Board(
      id: response.id,
      title: response.title,
      content: response.content,
      category: response.boardCategory,
      imageUrl: response.imageUrl,
      createdAt: DateTime.parse(response.createdAt),
    );
  }


  // 글목록 조회
  @override
  Future<BoardListPagination> getBoardList({
    required int page,
    required int size,
  }) async {
    final response = await _remoteDataSource.getBoardList(
      page: page,
      size: size,
    );

    final items = response.content.map((dto) {
      return BoardListItem(
        id: dto.id,
        title: dto.title,
        category: dto.category,
        createdAt: dto.createdAt,
      );
    }).toList();

    final pagination = Pagination(
      currentPage: response.number,
      totalPages: response.totalPages,
      totalElements: response.totalElements,
      pageSize: response.size,
      isFirst: response.first,
      isLast: response.last,
    );

    return BoardListPagination(items: items, pagination: pagination);
  }

  // 글수정
  @override
  Future<void> updateBoard({
    required int id,
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    await _remoteDataSource.updateBoard(
      id: id,
      title: title,
      content: content,
      category: category,
    );
  }

  // 글삭제
  @override
  Future<void> deleteBoard(int id) async {
    await _remoteDataSource.deleteBoard(id);
  }

  // 게시판 카테고리
  @override
  Future<Map<String, String>> getCategories() async {
    return await _remoteDataSource.getCategories();
  }
}
