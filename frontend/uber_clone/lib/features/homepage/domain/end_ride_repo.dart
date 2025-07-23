import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';

class EndRideRepo {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Dio _dio;
  EndRideRepo()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<Response> endRide(String rideId) async {
    final token = await _storage.read(key: 'token');
    try {
      final response = await _dio.post(
        ApiEndpoints.endRide,
        data: {"rideId": rideId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if ([200, 201].contains(response.statusCode)) {
        debugPrint("confirmation call done by captain");
        return response;
      } else {
        throw Exception('Failed to create ride: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Unexpected error: ${e.toString()}');
      throw Exception('Failed to start ride: ${e.toString()}');
    }
  }
}
