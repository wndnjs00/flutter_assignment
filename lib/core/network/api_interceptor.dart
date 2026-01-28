import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/data/datasources/remote/auth_remote_datasource.dart';
import 'package:flutter_assignment/data/models/auth/refresh_request.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider_bridge.dart';
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

      if (refreshToken == null) {
        // RefreshToken이 없으면 로그아웃
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

      // 대기 중이던 요청 재시도
      for (final retry in _retryQueue) {
        retry();
      }
      _retryQueue.clear();

      // 원래 요청 재시도 (새 AccessToken으로)
      handler.resolve(await _retry(err.requestOptions));
    } on DioException catch (e) {
      // RefreshToken 갱신 API 호출 실패 (401 또는 네트워크 에러 등)
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
      // 예상치 못한 에러
      await _storage.deleteAll();
      AuthProviderBridge.forceLogout();
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response> _retry(RequestOptions request) async {
    // FormData는 한 번 사용되면 finalized되어 재사용 불가
    dynamic requestData = request.data;
    
    if (requestData is FormData) {
      // FormData를 새로 생성
      final newFormData = FormData();
      
      for (final field in requestData.fields) {
        newFormData.fields.add(MapEntry(field.key, field.value));
      }
      
      for (final file in requestData.files) {
        newFormData.files.add(MapEntry(file.key, file.value));
      }
      
      requestData = newFormData;
    }
    
    // 헤더 복사 (Authorization 헤더는 제거 - onRequest에서 새 토큰으로 자동 추가됨)
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
