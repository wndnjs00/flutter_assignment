import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/like_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_viewmodel.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? error,
  }) = _LoginState;
}

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final Ref _ref;

  LoginViewModel(this._authRepository, this._ref) : super(const LoginState());

  Future<void> login({required String email, required String password}) async {
    state = const LoginState(isLoading: true);

    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );

      _ref.read(authViewModelProvider.notifier).setUser(user);

      _ref.read(likeViewModelProvider.notifier).refresh();
      _ref.read(myPostsViewModelProvider.notifier).refresh();

      state = const LoginState(isSuccess: true);
    } catch (e) {
      state = LoginState(isLoading: false, error: e.toString());
    }
  }
}

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel(ref.read(authRepositoryProvider), ref);
    });
