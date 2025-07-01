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
      final response = await _dio.post(
        ApiEndpoints.createRideEndpoint,
        data: data.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _storage.read(key:'token')}',
          }
      ));
      debugPrint('Response from create ride: ${response.data.toString()}'); // Debugging: Print the response data
      if(response.statusCode == 200){
        return CreateRideResponse.fromJson(response.data);
      }else{
        throw Exception('Failed to create ride: ${response.statusCode}');
      }
    }on DioException catch(e){
      debugPrint('Dio error: ${e.message}');
      if (e.response != null) {
        debugPrint('Dio error response: ${e.response?.data}');
      }
      throw Exception('Failed to create ride: ${e.message}'); 

    }catch(e){
      throw Exception('Failed to create ride: ${e.toString()}');
    }
  }
}