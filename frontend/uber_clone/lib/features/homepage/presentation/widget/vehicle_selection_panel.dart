import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/create_ride_bloc/create_ride_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/create_ride_bloc/create_ride_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_state.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_state.dart';
import 'package:uber_clone/features/homepage/presentation/widget/select_vechicle.dart';
import 'package:uber_clone/features/homepage/presentation/widget/search_panel_widget.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';

class VehicleSelectionPanel extends StatelessWidget {
  final FocusNode pickupFocus;
  final FocusNode destinationFocus;
  final String pickupLocation;
  final String dropoffLocation;
  const VehicleSelectionPanel({
    Key? key,
    required this.pickupFocus,
    required this.destinationFocus,
    required this.pickupLocation,
    required this.dropoffLocation,
  }) : super(key: key);

  void _onVehicleSelected(BuildContext context, String vehicleType, String? fare) {
    // Move to confirmation step in RideFlowCubit
    final rideData = CreateRideRequest(
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      vehicleType: vehicleType,
    );
    BlocProvider.of<CreateRideBloc>(context).add(FetchCreateRideEvent(rideData: rideData));
  
    context.read<RideFlowCubit>().toConfirmation(vehicleType, fare ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetDistanceTimeBloc, GetDistanceTimeState>(
        builder: (context, distanceState) {
          return BlocBuilder<GetFareBloc, GetFareState>(
            builder: (context, fareState) {
              if (distanceState is LoadingGetDistanceTimeState || fareState is LoadingGetFareState) {
                return const Center(child: CircularProgressIndicator());
              } else if (distanceState is LoadedGetDistanceTimeState && fareState is LoadedGetFareState) {
                final duration = distanceState.distanceTime.duration?.text ?? '-';
                final fare = fareState.fare.fare;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please select a vehicle',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    ChooseVehicleTile(
                      vehicleType: StringConstant.carType,
                      price: fare?.car?.toString() ?? '-',
                      time: duration,
                      onTap: () => _onVehicleSelected(context, StringConstant.carType, fare?.car?.toString()),
                    ),
                    ChooseVehicleTile(
                      vehicleType: StringConstant.autoType,
                      price: fare?.auto?.toString() ?? '-',
                      time: duration,
                      onTap: () => _onVehicleSelected(context, StringConstant.autoType, fare?.auto?.toString()),
                    ),
                    ChooseVehicleTile(
                      vehicleType: StringConstant.motorcycleType,
                      price: fare?.moto?.toString() ?? '-',
                      time: duration,
                      onTap: () => _onVehicleSelected(context, StringConstant.motorcycleType, fare?.moto?.toString()),
                    ),
                  ],
                );
              } else if (distanceState is ErrorGetDistanceTimeState) {
                return Center(child: Text('Error: \\${distanceState.message}'));
              } else if (fareState is ErrorGetFareState) {
                return Center(child: Text('Error: \\${fareState.message}'));
              } else if (distanceState is IntialGetDistanceTimeState) {
                return SearchPanelWidget(
                  pickupFocusNode: pickupFocus,
                  destinationFocusNode: destinationFocus,
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
