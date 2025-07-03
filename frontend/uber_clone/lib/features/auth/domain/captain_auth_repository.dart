import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';
import 'package:uber_clone/features/auth/data/captain_model/login_captain_model.dart';
import 'package:uber_clone/features/auth/data/captain_model/signup_captain_model.dart';

class CaptainAuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  CaptainAuthRepository()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<void> captainSignup(CaptainRegisterRequest data) async {
    debugPrint(
      '[CaptainAuthRepository] captainSignup called with: \\ndata: \\${data.toJson()}',
    );
    try {
      final response = await _dio.post(
        ApiEndpoints.createCaptainEndpoint,
        data: data.toJson(),
      );
      debugPrint(
        '[CaptainAuthRepository] captainSignup response: \\n\\${response.data}',
      );
    } on DioException catch (e) {
      debugPrint(
        '[CaptainAuthRepository] Dio POST error:  \\${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<void> captainSignIn(CaptainLoginRequest data) async {
    debugPrint(
      '[CaptainAuthRepository] captainSignIn called with: \ndata: ${data.toJson()}',
    );
    try {
      final response = await _dio.post(
        ApiEndpoints.loginCaptainEndpoint,
        data: data.toJson(),
      );
      debugPrint(
        '[CaptainAuthRepository] captainSignIn response: \n${response.data}',
      );
      final token = response.data['token'];
      if (token != null) {
        await _storage.write(key: 'token', value: token);
        await _storage.write(key: 'isUser', value: 'false');
      }
    } on DioException catch (e) {
      debugPrint(
        '[CaptainAuthRepository] Dio POST error:  ${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<GetCaptain> get() async {
    debugPrint('[CaptainAuthRepository] getCaptain called');
    try {
      final token = await _storage.read(key: 'token');
      final response = await _dio.get(
        ApiEndpoints.getCaptainEndpoint,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      debugPrint(
        '[CaptainAuthRepository] getCaptain response: \\n\\${response.data}',
      );
      GetCaptain responseData = GetCaptain.fromJson(response.data);
      return responseData;
    } on DioException catch (e) {
      debugPrint(
        '[CaptainAuthRepository] Dio GET error: \\${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  Future<void> logoutCaptain() async {
    debugPrint('[CaptainAuthRepository] logoutCaptain called');
    try {
      final token = await _storage.read(key: 'token');
      if (token == null) {
        debugPrint('[CaptainAuthRepository] No token found, skipping logout');
        return;
      }
      debugPrint('[CaptainAuthRepository] Token found: $token');
      try {
        await _dio.get(
          ApiEndpoints.logoutCaptainEndpoint,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
      } catch (e) {
        debugPrint('[CaptainAuthRepository] Logout request failed, proceeding to clear token anyway: $e');
      }
      await _storage.delete(key: 'token');
      await _storage.delete(key: 'isUser');
      debugPrint('[CaptainAuthRepository] logoutCaptain: token deleted');
    } catch (e) {
      debugPrint('[CaptainAuthRepository] Dio GET error:  \\${e.toString()}');
      rethrow;
    }
  }
}