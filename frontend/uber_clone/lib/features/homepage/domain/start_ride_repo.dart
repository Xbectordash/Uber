import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';

class StartRideRepo {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Dio _dio;
  StartRideRepo()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<void> startRide(String rideId, String otp) async {
    debugPrint('startRide called with rideId: $rideId and otp: $otp');
    try {
      final token = await _storage.read(key: 'token');
      if (token == null) {
        debugPrint('Token not found in secure storage.');
        throw Exception('Authentication token not found.');
      }
      debugPrint('Token retrieved: $token');

      debugPrint('Sending POST request to ${ApiEndpoints.startRide} with queryParameters: {rideId: $rideId, otp: $otp}');
      final response = await _dio.get(
        ApiEndpoints.startRide,
        queryParameters: {
          "rideId": rideId,
          "otp": otp,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response data: ${response.data}');

      if (response.statusCode != 200) {
        debugPrint('Failed to start ride. Status code: ${response.statusCode}');
        throw Exception('Failed to start ride. Server responded with status code: ${response.statusCode}');
      }
      if (response.data == null) {
        debugPrint('Response data is null.');
        throw Exception('Failed to start ride. Response data is null.');
      }
    } on DioException catch (dioError) {
      debugPrint('DioException occurred: ${dioError.message}');
      if (dioError.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout. Please check your internet connection.');
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout. Server took too long to respond.');
      } else if (dioError.type == DioExceptionType.badResponse) {
        debugPrint('Bad response: ${dioError.response?.data}');
        throw Exception('Server error: ${dioError.response?.data ?? 'Unknown error'}');
      } else if (dioError.type == DioExceptionType.unknown) {
        throw Exception('Unknown network error occurred.');
      } else {
        throw Exception('Network error: ${dioError.message}');
      }
    } catch (e) {
      debugPrint('Unexpected error: ${e.toString()}');
      throw Exception('Failed to start ride: ${e.toString()}');
    }
  }
}
