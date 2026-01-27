import 'package:flutter_assignment/presentation/providers/auth_provider_bridge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assignment/domain/entities/user/user.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/api_constants.dart';

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

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthViewModel(this._repository) : super(const AuthState()) {
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    try {
      final user = await _repository.getCurrentUser();
      state = AuthState(user: user);
    } catch (_) {
      state = const AuthState();
    }
  }

  void setUser(User user) {
    state = AuthState(user: user);
  }

  // 사용자가 직접 로그아웃
  Future<void> logout() async {
    await _repository.logout();
    state = const AuthState();
  }

  // 토큰 만료 / refresh 실패 시 강제 로그아웃
  void forceLogout() {
    state = const AuthState();
  }

}

final authViewModelProvider =
StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final vm = AuthViewModel(ref.read(authRepositoryProvider));

  AuthProviderBridge.bind(vm);

  return vm;
});
