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

  @override
  Future<Board> getBoard(int id) async {
    final response = await _remoteDataSource.getBoard(id);

    return Board(
      id: response.id,
      title: response.title,
      content: response.content,
      category: response.boardCategory,
      imageUrl: response.imageUrl,
      createdAt: DateTime.parse(response.createdAt),
    );
  }

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

  @override
  Future<void> deleteBoard(int id) async {
    await _remoteDataSource.deleteBoard(id);
  }

  @override
  Future<Map<String, String>> getCategories() async {
    return await _remoteDataSource.getCategories();
  }
}
