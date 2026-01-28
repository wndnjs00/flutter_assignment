import 'package:flutter_assignment/core/utils/auth_provider_bridge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assignment/domain/entities/user/user.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
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

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthViewModel(this._repository) : super(const AuthState()) {
    _checkAuth();
  }

  // 현재 인증 상태 확인
  Future<void> _checkAuth() async {
    try {
      final user = await _repository.getCurrentUser();
      state = AuthState(user: user);
    } catch (_) {
      state = const AuthState();
    }
  }

  // 사용자 정보 설정
  void setUser(User user) {
    state = AuthState(user: user);
  }

  // 로그아웃
  Future<void> logout() async {
    await _repository.logout();
    state = const AuthState();
  }

  // 강제 로그아웃
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
