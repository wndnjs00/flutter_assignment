import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';

class AuthProviderBridge {
  static AuthViewModel? _authViewModel;

  static void bind(AuthViewModel viewModel) {
    _authViewModel = viewModel;
  }

  static void forceLogout() {
    _authViewModel?.forceLogout();
  }
}
