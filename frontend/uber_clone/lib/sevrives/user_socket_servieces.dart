import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/data/ride_model.dart';
import 'package:uber_clone/features/homepage/data/ride_with_user_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/widget/ride_with_driver_panel.dart';
class UserSocketService {
  final RideFlowCubit rideFlowCubit;
  IO.Socket? socket;

  UserSocketService({required this.rideFlowCubit});

  void connect(String userId) {
    socket = IO.io(ApiEndpoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();

    socket!.on('connect', (_) {
      debugPrint('User connected to socket');
      socket!.emit('join', {
        'userID': userId,
        'userType': 'user',
      });
    });

    socket!.on('ride-confirmed', (data) {
      debugPrint('Ride confirmed from socket when driver accept: $data');
      final confirmationData = RideModel.fromJson(data);

      // Convert to Ride model
      rideFlowCubit.toConfirmedByDriver(confirmationData);

    });

    socket!.on('ride-status-update', (data) {
      debugPrint('Ride status update: $data');
    });
  }

  void disconnect() {
    socket?.disconnect();
  }
}
