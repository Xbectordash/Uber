class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'http://192.168.0.113:4000';
  static const String createUserEndpoint = '/api/users/register/';
  static const String loginUserEndpoint = '/api/users/login/';
  static const String getUserEndpoint = '/api/users/profile/';
  static const String createCaptainEndpoint = '/api/captains/register/';
  static const String loginCaptainEndpoint = '/api/captains/login/';
  static const String getCaptainEndpoint = '/api/captains/profile/';
  static const String logoutUserEndpoint = '/api/users/logout/';
  static const String logoutCaptainEndpoint = '/api/captains/logout/';
  static const String getSuggestion = '/api/maps/get-suggestions/';
  static const String getDistanceTimeEndpoint = '/api/maps/get-distance-time/';
  static const String createRideEndpoint = '/api/rides/create-ride';
  static const String getFareEndpoint = '/api/rides/get-fare';
  static const String confirmRideByCaptainEndpoint = '/api/rides/confirm-ride/';
  static const String startRide = '/api/rides/start-ride/';
  static const String endRide = '/api/rides/end-ride/';
  static const String getRouteEndpoint = '/api/maps/get-routes/';
}
