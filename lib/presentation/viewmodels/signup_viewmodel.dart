import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_viewmodel.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? error,
  }) = _SignupState;
}

class SignupViewModel extends StateNotifier<SignupState> {
  final AuthRepository _authRepository;

  SignupViewModel(this._authRepository) : super(const SignupState());

  Future<void> signup({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    state = const SignupState(isLoading: true);

    try {
      await _authRepository.signup(
        email: email,
        name: name,
        password: password,
        confirmPassword: confirmPassword,
      );

      state = const SignupState(isSuccess: true);
    } catch (e) {
      state = SignupState(isLoading: false, error: e.toString());
    }
  }
}

final signupViewModelProvider =
    StateNotifierProvider<SignupViewModel, SignupState>((ref) {
      return SignupViewModel(ref.read(authRepositoryProvider));
    });
