import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain_confirm_otp_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain_confirm_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain_info_panel.dart';

class CaptainContentPanel extends StatefulWidget {
  final GetCaptain captainData;

  const CaptainContentPanel({super.key, required this.captainData});

  @override
  State<CaptainContentPanel> createState() => _CaptainContentPanelState();
}

class _CaptainContentPanelState extends State<CaptainContentPanel> {
  @override
  void initState() {
    super.initState();

    // Pass the captainData to the cubit when widget loads
    final driverFlowCubit = context.read<DriverSideFlowCubit>();
    driverFlowCubit.setCaptainData(widget.captainData);
  }

  Widget _buildStepContent(BuildContext context, DriverSideFlowState state) {
    switch (state.step) {
      case DriverSideStep.idle:
        return CaptainInfoPanel(captainData: state.captainData!);
      case DriverSideStep.rideRequested:
        // Return some other widget
        final userData = state.rideData;
        final rideId = userData!.id;
        final userName = userData.userFirstName;
        final pickupLocation = userData.pickup;
        final dropoffLocation = userData.destination;
        final distance = userData.fare.toString();

        return CaptainConfirmRidePanel(
          userName: userName,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
          distance: distance,
          rideId: rideId,
        );
      case DriverSideStep.forConfirmingOtp:
        final userData = state.rideData!;
        final userName = userData.userFirstName;
        final pickupLocation = userData.pickup;
        final dropoffLocation = userData.destination;
        final distance = userData.fare.toString();
        return CaptainOtpStartPanel(
          userName: userName,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
          distance: distance,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverSideFlowCubit, DriverSideFlowState>(
      builder: (context, state) {
        if (state.captainData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return _buildStepContent(context, state);
      },
    );
  }
}
