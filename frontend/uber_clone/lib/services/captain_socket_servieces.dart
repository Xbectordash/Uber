import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/ride_with_user_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';

class CaptainSocketService {
  DriverSideFlowCubit driverSideFlowCubit;
  IO.Socket? socket;
  CaptainSocketService({required this.driverSideFlowCubit});

  void connect(String captainId) {
    // Connect to your backend socket server
    socket = IO.io(ApiEndpoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();

    // On connect, emit join event
    socket!.on('connect', (_) {
      print('Connected to socket');
      socket!.emit('join', {
        'userID': captainId,
        'userType': 'captain',
      });
    });

    // Listen for ride requests
    socket!.on('ride-request', (data) {
      print('Received ride request: $data');
      // Show ride request to captain, allow accept/reject, etc.
      final rideData = RideWithUser.fromJson(data);
      driverSideFlowCubit
          .toRideRequested(rideData);

    });
  }

  // Call this method periodically (e.g., every 5 seconds) with updated coordinates
  void updateLocation(String captainId, double ltd, double lng) {
    if (socket != null && socket!.connected) {
      socket!.emit('update-location-captain', {
        'userID': captainId,
        'location': {'ltd': ltd, 'lng': lng}
      });
    }
  }

  void disconnect() {
    socket?.disconnect();
  }
}