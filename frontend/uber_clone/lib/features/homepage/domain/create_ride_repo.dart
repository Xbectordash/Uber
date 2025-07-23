import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';

class CreateRideRepo {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Dio _dio;
  CreateRideRepo():_dio = Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'}
  ));

  Future<CreateRideResponse>createRide(CreateRideRequest data)async{
    try{
      debugPrint('Json data of Create ride: ${data.toJson()
          .toString()}'); // Debugging: Print the request data
      debugPrint('Token: ${await _storage.read}'
          '(key: \'token\')'); // Debugging: Print the token being used    
      final response = await _dio.post(
        ApiEndpoints.createRideEndpoint,
        data: data.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _storage.read(key:'token')}',
          }
      ));
      debugPrint('Response from create ride: ${response.data.toString()}'); // Debugging: Print the response data
      if ([200, 201].contains(response.statusCode)){
        return CreateRideResponse.fromJson(response.data);
      }else{
        throw Exception('Failed to create ride: ${response.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('Dio error: \\${e.message}');
      if (e.response?.statusCode == 401) {
        // Token expired or invalid
        debugPrint('Token expired or invalid. Logging out user.');
        final storage = FlutterSecureStorage();
        await storage.delete(key: 'token');
        await storage.delete(key: 'isUser');
        // Use navigatorKey or a callback to navigate to landing page
        // (You may want to use a global key or Bloc event for this in production)
        // Example (if you have access to context):
        // GoRouter.of(context).goNamed('landing-screen');
        throw Exception('Session expired. Please login again.');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
      debugPrint('DioExceptionType: Connection Timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
      debugPrint('DioExceptionType: Receive Timeout');
      } else if (e.type == DioExceptionType.badResponse) {
      debugPrint('DioExceptionType: Bad Response');
      } else if (e.type == DioExceptionType.cancel) {
      debugPrint('DioExceptionType: Request Cancelled');
      } else if (e.type == DioExceptionType.unknown) {
      debugPrint('DioExceptionType: Unknown');
      }
      if (e.response != null) {
      debugPrint('Dio error response: \\${e.response?.data}');
      debugPrint('Dio error status code: \\${e.response?.statusCode}');
      debugPrint('Dio error headers: \\${e.response?.headers}');
      } else {
      debugPrint('No response received from server.');
      }
      throw Exception('Failed to create ride: \\${e.message}'); 
    } catch (e) {
      debugPrint('Unexpected error: ${e.toString()}');
      throw Exception('Failed to create ride: ${e.toString()}');
    }
  }
}