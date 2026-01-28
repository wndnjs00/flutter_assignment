import 'package:flutter_assignment/domain/entities/user/user.dart';

abstract class AuthRepository {
  Future<User> signup({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  });

  Future<User> login({required String email, required String password});

  Future<void> logout();

  Future<User?> getCurrentUser();

  // TODO: 삭제하기
  Future<bool> isLoggedIn();
}
