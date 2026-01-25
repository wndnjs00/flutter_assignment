import 'package:flutter_assignment/core/constants/api_constants.dart';
import 'package:flutter_assignment/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_assignment/data/models/auth/login_request.dart';
import 'package:flutter_assignment/data/models/auth/signup_request.dart';
import 'package:flutter_assignment/domain/entities/user/user.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final FlutterSecureStorage _storage;

  AuthRepositoryImpl(this._remoteDataSource, this._storage);

  @override
  Future<User> signup({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    final request = SignupRequest(
      username: email,
      name: name,
      password: password,
      confirmPassword: confirmPassword,
    );

    await _remoteDataSource.signup(request);

    return User(email: email, name: name);
  }

  @override
  Future<User> login({required String email, required String password}) async {
    final request = LoginRequest(username: email, password: password);

    final response = await _remoteDataSource.login(request);

    final decodedToken = JwtDecoder.decode(response.accessToken);
    final name = decodedToken['name'] as String;
    final username = decodedToken['username'] as String;

    await _saveTokens(response.accessToken, response.refreshToken);
    await _saveUserInfo(username, name);

    return User(
      email: username,
      name: name,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }

  @override
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  @override
  Future<User?> getCurrentUser() async {
    final email = await _storage.read(key: ApiConstants.userEmailKey);
    final name = await _storage.read(key: ApiConstants.userNameKey);
    final accessToken = await _storage.read(key: ApiConstants.accessTokenKey);
    final refreshToken = await _storage.read(key: ApiConstants.refreshTokenKey);

    if (email == null || name == null) {
      return null;
    }

    return User(
      email: email,
      name: name,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final accessToken = await _storage.read(key: ApiConstants.accessTokenKey);
    return accessToken != null;
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: ApiConstants.accessTokenKey, value: accessToken);
    await _storage.write(
      key: ApiConstants.refreshTokenKey,
      value: refreshToken,
    );
  }

  Future<void> _saveUserInfo(String email, String name) async {
    await _storage.write(key: ApiConstants.userEmailKey, value: email);
    await _storage.write(key: ApiConstants.userNameKey, value: name);
  }
}
