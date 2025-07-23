import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/get_suggestion_model.dart';

class GetSuggestionRepo {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  GetSuggestionRepo(): _dio = Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl, // Replace with your API base URL
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ));

  Future<GetSuggestion> getSuggestion(String input) async {
    try {
      final token = await _storage.read(key: 'token');
      debugPrint("User token in suggestion: $token");
      if (token == null) {
        throw Exception('User token not found');
      }
      final response = await _dio.get(
        ApiEndpoints.getSuggestion,
        queryParameters: {'input': input}, 
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("In getsuggestion Response data: ${response.data}");
      debugPrint("Response status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("in getsuggestio Response data: ${response.data}");
        return GetSuggestion.fromJson(response.data);
      } else {
        throw Exception('Failed to load suggestions');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      throw e; // Rethrow the exception for further handling
    } catch (e) {
      print('Error: $e');
      throw e; // Rethrow any other exceptions
    }

  }

}