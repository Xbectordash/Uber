import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uber_clone/cofing/constant/api_endpoints.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/data/ride_model.dart';
import 'package:uber_clone/features/homepage/data/ride_with_user_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain/ride_with_driver_panel.dart';

class UserSocketService {
  final RideFlowCubit rideFlowCubit;
  final BuildContext context;
  IO.Socket? socket;

  UserSocketService({required this.rideFlowCubit, required this.context});

  void connect(String userId) {
    socket = IO.io(ApiEndpoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();

    socket!.on('connect', (_) {
      debugPrint('User connected to socket');
      socket!.emit('join', {'userID': userId, 'userType': 'user'});
    });

    socket!.on('ride-confirmed', (data) {
      debugPrint('Ride confirmed from socket when driver accept: $data');
      final confirmationData = RideModel.fromJson(data);

      // Convert to Ride model
      rideFlowCubit.toConfirmedByDriver(confirmationData);
    });

    socket!.on('ride-status-update', (data) {
      debugPrint('Ride status update from frontend: $data');
    });
    socket!.on('ride-started', (data) {
      debugPrint('it is from frontend ride - start: $data');
      final confirmationData = RideModel.fromJson(data);
      final origin = confirmationData.pickup;
      final dest = confirmationData.destination;
      BlocProvider.of<GetRoutesBloc>(
        context,
      ).add(FetchRoutesEvent(origin: origin, destination: dest));

      // Convert to Ride model
      rideFlowCubit.rideStarted(confirmationData);
    });
    socket!.on('ride-ended', (data) {
      rideFlowCubit.resetFlow();
      BlocProvider.of<GetRoutesBloc>(context).add(ResetRoutesEvent());
    });
  }

  void disconnect() {
    socket?.disconnect();
  }
}
