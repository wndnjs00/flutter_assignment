import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/data/datasources/remote/auth_remote_datasource.dart';
import 'package:flutter_assignment/data/models/auth/refresh_request.dart';
import 'package:flutter_assignment/core/utils/auth_provider_bridge.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();
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

  // 401 에러 시 토큰 갱신 및 재시도
  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

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

      if (refreshToken == null) {
        await _storage.deleteAll();
        AuthProviderBridge.forceLogout();
        return handler.next(err);
      }

      final authResponse = await _authRemoteDataSource.refreshToken(
        RefreshRequest(refreshToken: refreshToken),
      );
      final newAccessToken = authResponse.accessToken;
      final newRefreshToken = authResponse.refreshToken;

      await _storage.write(
        key: ApiConstants.accessTokenKey,
        value: newAccessToken,
      );
      await _storage.write(
        key: ApiConstants.refreshTokenKey,
        value: newRefreshToken,
      );

      for (final retry in _retryQueue) {
        retry();
      }
      _retryQueue.clear();

      // 원래 요청 재시도 (새 AccessToken으로)
      handler.resolve(await _retry(err.requestOptions));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // RefreshToken도 만료된 경우
        await _storage.deleteAll();
        AuthProviderBridge.forceLogout();
        return handler.next(err);
      }
      // 다른 에러도 로그아웃 처리
      await _storage.deleteAll();
      AuthProviderBridge.forceLogout();
      return handler.next(err);
    } catch (e) {
      await _storage.deleteAll();
      AuthProviderBridge.forceLogout();
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  // 토큰 갱신 후 원래 요청 재시도
  Future<Response> _retry(RequestOptions request) async {
    dynamic requestData = request.data;
    
    if (requestData is FormData) {
      final newFormData = FormData();
      
      for (final field in requestData.fields) {
        newFormData.fields.add(MapEntry(field.key, field.value));
      }
      
      for (final file in requestData.files) {
        newFormData.files.add(MapEntry(file.key, file.value));
      }
      
      requestData = newFormData;
    }
    
    final headers = Map<String, dynamic>.from(request.headers);
    headers.remove('Authorization');
    
    return DioClient.instance.request(
      request.path,
      data: requestData,
      queryParameters: request.queryParameters,
      options: Options(
        method: request.method,
        headers: headers,
      ),
    );
  }
}
