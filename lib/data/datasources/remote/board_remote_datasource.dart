import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/data/models/board/board_create_response.dart';
import 'package:flutter_assignment/data/models/board/board_detail_response.dart';
import 'package:flutter_assignment/data/models/board/board_list_response.dart';

class BoardRemoteDataSource {
  final Dio _dio = DioClient.instance;

  // 글쓰기
  Future<BoardCreateResponse> createBoard({
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    try {
      final requestData = {
        'title': title,
        'content': content,
        'category': category,
      };

      final formData = FormData.fromMap({
        'request': MultipartFile.fromString(
          jsonEncode(requestData),
          contentType: DioMediaType('application', 'json'),
        ),
        if (image != null)
          'file': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      });

      final response = await _dio.post(ApiConstants.boards, data: formData);

      return BoardCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 글 조회 (디테일)
  Future<BoardDetailResponse> getDetailBoard(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.boards}/$id');
      return BoardDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 글목록 조회
  Future<BoardListResponse> getBoardList({
    required int page,
    required int size,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.boards,
        queryParameters: {'page': page, 'size': size},
      );
      return BoardListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 글수정
  Future<void> updateBoard({
    required int id,
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    try {
      final requestData = {
        'title': title,
        'content': content,
        'category': category,
      };

      final formData = FormData.fromMap({
        'request': MultipartFile.fromString(
          jsonEncode(requestData),
          contentType: DioMediaType('application', 'json'),
        ),
        if (image != null)
          'file': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      });
      await _dio.patch('${ApiConstants.boards}/$id', data: formData);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 글 삭제
  Future<void> deleteBoard(int id) async {
    try {
      await _dio.delete('${ApiConstants.boards}/$id');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 커뮤니티 카테고리
  Future<Map<String, String>> getCategories() async {
    try {
      final response = await _dio.get(ApiConstants.boardCategories);
      return Map<String, String>.from(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      final message = error.response?.data['message'];
      return message ?? '오류가 발생했습니다';
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return '연결 시간이 초과되었습니다';
    }

    if (error.type == DioExceptionType.connectionError) {
      return '네트워크 연결을 확인해주세요';
    }

    return '알 수 없는 오류가 발생했습니다';
  }
}
