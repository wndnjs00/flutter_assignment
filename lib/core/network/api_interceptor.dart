import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider_bridge.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  ApiInterceptor(this._storage);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final accessToken =
    await _storage.read(key: ApiConstants.accessTokenKey);

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // 이미 refresh 중이면 큐에 넣기
    if (_isRefreshing) {
      _retryQueue.add(() async {
        handler.resolve(await _retry(err.requestOptions));
      });
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken =
      await _storage.read(key: ApiConstants.refreshTokenKey);

      if (refreshToken == null) throw Exception('No refresh token');

      // ⚠️ 반드시 "기존 DioClient" 사용
      final response = await DioClient.instanceWithoutAuth.post(
        ApiConstants.refresh,
        data: {'refreshToken': refreshToken},
      );

      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];

      await _storage.write(
        key: ApiConstants.accessTokenKey,
        value: newAccessToken,
      );
      await _storage.write(
        key: ApiConstants.refreshTokenKey,
        value: newRefreshToken,
      );

      // 대기 중이던 요청 재시도
      for (final retry in _retryQueue) {
        retry();
      }
      _retryQueue.clear();

      handler.resolve(await _retry(err.requestOptions));
    } catch (e) {
      // 여기서 “진짜 로그아웃” 신호를 줘야 함
      await _storage.deleteAll();
      AuthProviderBridge.forceLogout();
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response> _retry(RequestOptions request) {
    return DioClient.instance.request(
      request.path,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        method: request.method,
        headers: request.headers,
      ),
    );
  }
}
