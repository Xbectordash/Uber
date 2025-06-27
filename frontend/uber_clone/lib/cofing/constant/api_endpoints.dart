class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'http://192.168.0.127:4000';
  static const String createUserEndpoint = '/api/users/register/';
  static const String loginUserEndpoint = '/api/users/login/';
  static const String getUserEndpoint = '/api/users/profile/';
  static const String createCaptainEndpoint = '/api/captains/register/';
  static const String loginCaptainEndpoint = '/api/captains/login/';
  static const String getCaptainEndpoint = '/api/captains/profile/';
  static const String logoutUserEndpoint = '/api/users/logout/';
  static const String logoutCaptainEndpoint = '/api/captains/logout/';
}
