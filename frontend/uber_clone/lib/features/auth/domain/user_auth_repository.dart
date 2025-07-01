import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/auth/data/user_model/get_user.dart';
import 'package:uber_clone/features/auth/data/user_model/login_user_model.dart';
import 'package:uber_clone/features/auth/data/user_model/signup_user_model.dart';

class UserAuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  UserAuthRepository()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<void> userSignup(RegisterUserRequest data) async {
    debugPrint(
      '[UserAuthRepository] userSignup called with: \\ndata: \\${data.toJson()}',
    );
    try {
      final response = await _dio.post(
        ApiEndpoints.createUserEndpoint,
        data: data.toJson(),
      );
      debugPrint(
        '[UserAuthRepository] userSignup response: \\n\\${response.data}',
      );
      // No return value needed
    } on DioException catch (e) {
      debugPrint(
        '[UserAuthRepository] Dio POST error: \\${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<void> userSignIn(LoginUserRequest data) async {
    debugPrint(
      '[UserAuthRepository] userSignIn called with: \ndata: ${data.toJson()}',
    );
    try {
      final response = await _dio.post(
        ApiEndpoints.loginUserEndpoint,
        data: data.toJson(),
      );
      debugPrint(
        '[UserAuthRepository] userSignIn response: \n${response.data}',
      );
      final token = response.data['token'];
      if (token != null) {
        await _storage.write(key: 'token', value: token);
        await _storage.write(key: 'isUser', value: 'true');
      }
    } on DioException catch (e) {
      debugPrint(
        '[UserAuthRepository] Dio POST error: ${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<GetUser> getUser() async {
    debugPrint('[UserAuthRepository] getUser called');
    try {
      final token = await _storage.read(key: 'token');
      final response = await _dio.get(
        ApiEndpoints.getUserEndpoint,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      debugPrint(
        '[UserAuthRepository] getUser response: \\n\\${response.data}',
      );
      GetUser getUserResponse = GetUser.fromJson(response.data);
      return getUserResponse;
    } on DioException catch (e) {
      debugPrint(
        '[UserAuthRepository] Dio GET error: \\${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    debugPrint('[UserAuthRepository] logoutUser called');
    try {
      await _dio.get(ApiEndpoints.logoutUserEndpoint);
      await _storage.delete(key: 'token');
      await _storage.delete(key: 'isUser');
      debugPrint('[UserAuthRepository] logoutUser: token deleted');
    } on DioException catch (e) {
      debugPrint(
        '[UserAuthRepository] Dio GET error: ${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }
}
