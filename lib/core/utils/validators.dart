class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!%*#?&]').hasMatch(value);

    if (value.length < 8) {
      return '8자 이상이여야 합니다';
    }

    if (!hasNumber) {
      return '숫자를 1개 이상 포함해야 합니다';
    }

    if (!hasLetter) {
      return '영문자를 1개 이상 포함해야 합니다';
    }

    if (!hasSpecialChar) {
      return '특수문자(!%*#?&)를 1개 이상 포함해야 합니다';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return '비밀번호 확인을 입력해주세요';
    }

    if (value != password) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해주세요';
    }

    if (value.length < 2) {
      return '이름은 2자 이상이여야 합니다';
    }
    return null;
  }
}
