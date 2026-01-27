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
        // 기기에 저장된 토큰을 _storage에서 꺼낸다(읽는다)
        // 아직 재로그인하지않고, 토큰이 갱신가능한 상태인지, 저장된 토큰 여부에 따라 판단
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

            // _storage에 refreshTokenKey를 저장한다
            // TODO: accessToken도 같이 저장해야 함 (보완대상)
            await _storage.write(
              key: ApiConstants.refreshTokenKey,
              value: newRefreshToken,
            );

            // 원래 요청 재시도 (토큰만 새걸로 갱신해서, 아까 실패했던 요청을 그대로 다시보냄)
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
        // refresh 실패시 강제 로그아웃 처리
        // TODO: 보통 여기서 로그인화면으로 이동시킴
        await _storage.deleteAll();
      }
    }
    return handler.next(err);
  }
}
