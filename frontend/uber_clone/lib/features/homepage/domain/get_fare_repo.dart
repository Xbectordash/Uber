import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/get_fare_model.dart';

class GetFareRepo {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  GetFareRepo()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiEndpoints.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<GetFare> getFare(String pickup, String destination) async {
    try {
      final token = await _storage.read(key: 'token');
      debugPrint('Requesting fare: pickup=$pickup, destination=$destination');
      debugPrint('User token: $token');

      final response = await _dio.get(
        ApiEndpoints.getFareEndpoint,
        queryParameters: {
          'pickup': Uri.encodeComponent(pickup),
          'destination': Uri.encodeComponent(destination),
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      debugPrint('GetFare API response: ${response.statusCode} => ${response.data}');

      if (response.statusCode != 200 || response.data == null) {
        throw Exception('Invalid or null response');
      }

      return GetFare.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('❌ DioException occurred!');
      debugPrint('Type: ${e.type}');
      debugPrint('Message: ${e.message}');
      debugPrint('Status code: ${e.response?.statusCode}');
      debugPrint('Data: ${e.response?.data}');
      debugPrint('Request: ${e.requestOptions.uri}');
      throw Exception('Failed to fetch fare: ${e.response?.data ?? e.message}');
    }
  }
}
