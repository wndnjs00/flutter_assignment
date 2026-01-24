import 'package:flutter_assignment/domain/entities/user.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_viewmodel.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    String? error,
  }) = _AuthState;

  const AuthState._();

  bool get isAuthenticated => user != null;
}

class AuthViewModel extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository) : super(const AsyncValue.loading()) {
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncValue.loading();

    try {
      final user = await _authRepository.signup(
        email: email,
        name: name,
        password: password,
        confirmPassword: confirmPassword,
      );
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();

    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    state = const AsyncValue.data(null);
  }
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AsyncValue<User?>>((ref) {
      return AuthViewModel(ref.read(authRepositoryProvider));
    });
