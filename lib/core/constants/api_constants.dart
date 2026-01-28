class ApiConstants {
  static const String baseUrl = 'https://front-mission.bigs.or.kr';

  static const String signup = '/auth/signup';
  static const String signin = '/auth/signin';
  static const String refresh = '/auth/refresh';

  static const String boards = '/boards';
  static const String boardCategories = '/boards/categories';

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';

  static const String likedPostsBoxName = 'liked_posts';
  static const String myPostsBoxName = 'my_posts';

  static const String expiredAccessTokenForTest = 'expired_access_token_for_test';
  static const String expiredRefreshTokenForTest = 'expired_refresh_token_for_test';
}
