import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/data/models/auth/auth_response.dart';
import 'package:flutter_assignment/data/models/auth/login_request.dart';
import 'package:flutter_assignment/data/models/auth/refresh_request.dart';
import 'package:flutter_assignment/data/models/auth/signup_request.dart';

class AuthRemoteDataSource {
  final Dio _dio = DioClient.instanceWithoutAuth;

  Future<AuthResponse> signup(SignupRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.signup,
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.signin,
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthResponse> refreshToken(RefreshRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.refresh,
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
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
