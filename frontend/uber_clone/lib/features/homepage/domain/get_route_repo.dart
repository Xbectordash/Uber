import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';
import 'package:uber_clone/features/homepage/data/get_routes_model.dart';

class GetRouteRepo {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  GetRouteRepo()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );
  Future<GetRouteModel> getRoute(String origin, String destination) async {
    try {
      debugPrint(
        'Requesting get route : origin=$origin, destination=$destination',
      );

      final response = await _dio.get(
        ApiEndpoints.getRouteEndpoint,
        queryParameters: {
          'origin': Uri.encodeComponent(origin),
          'destination': Uri.encodeComponent(destination),
        },
      );

      debugPrint(
        'Get route response response: ${response.statusCode} => ${response.data}',
      );

      if (response.statusCode != 200 || response.data == null) {
        throw Exception('Invalid or null response');
      }

      return GetRouteModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('❌ DioException occurred!');
      debugPrint('Type: ${e.type}');
      debugPrint('Message: ${e.message}');
      debugPrint('Status code: ${e.response?.statusCode}');
      debugPrint('Data: ${e.response?.data}');
      debugPrint('Request: ${e.requestOptions.uri}');
      throw Exception(
        'Failed to fetch distance/time: ${e.response?.data ?? e.message}',
      );
    }
  }
}
