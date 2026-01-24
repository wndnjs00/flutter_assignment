import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;

  ApiInterceptor(this._storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _storage.read(key: ApiConstants.accessTokenKey);
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await _storage.read(
          key: ApiConstants.refreshTokenKey,
        );

        if (refreshToken != null) {
          final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
          final response = await dio.post(
            ApiConstants.refresh,
            data: {'refreshToken': refreshToken},
          );

          if (response.statusCode == 200) {
            final newAccessToken = response.data['accessToken'];
            final newRefreshToken = response.data['refreshToken'];

            await _storage.write(
              key: ApiConstants.refreshTokenKey,
              value: newRefreshToken,
            );

            // 원래 요청 재시도
            err.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            final cloneReq = await dio.request(
              err.requestOptions.path,
              options: Options(
                method: err.requestOptions.method,
                headers: err.requestOptions.headers,
              ),
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            );

            return handler.resolve(cloneReq);
          }
        }
      } catch (e) {
        // refresh 실패시 로그아웃 처리
        await _storage.deleteAll();
      }
    }
    return handler.next(err);
  }
}
