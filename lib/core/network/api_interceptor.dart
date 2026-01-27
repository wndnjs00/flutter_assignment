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

            // accessToken도 저장
            await _storage.write(
              key: ApiConstants.accessTokenKey,
              value: newAccessToken,
            );
            await _storage.write(
              key: ApiConstants.refreshTokenKey,
              value: newRefreshToken,
            );

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
        await _storage.deleteAll();
      }
    }
    return handler.next(err);
  }
}