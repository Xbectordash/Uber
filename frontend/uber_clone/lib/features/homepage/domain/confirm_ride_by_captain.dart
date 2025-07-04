import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/data/rideId_model.dart';

class ConfirmRideByCaptain {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Dio _dio;
  ConfirmRideByCaptain()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );
  Future<Response> confirmRideRequest(RideIdModel rideId) async {
    try {
      final token = await _storage.read(key: 'token');


      final response = await _dio.post(
        ApiEndpoints.confirmRideByCaptainEndpoint,
        
        data: rideId.toJson(),
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
      throw Exception('Failed to create ride: ${e.toString()}');
    }
  }
}
