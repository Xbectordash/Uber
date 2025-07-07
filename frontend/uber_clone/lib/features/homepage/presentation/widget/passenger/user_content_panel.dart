import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/widget/passenger/create_ride_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/passenger/search_panel_widget.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain/ride_with_driver_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/passenger/vehicle_selection_panel.dart';

class PanelContent extends StatefulWidget {
  final PanelController? panelController;
  const PanelContent({super.key, this.panelController});

  @override
  State<PanelContent> createState() => _PanelContentState();
}

class _PanelContentState extends State<PanelContent> {
  final FocusNode _pickupFocus = FocusNode();
  final FocusNode _destinationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _pickupFocus.addListener(_handleFocusChange);
    _destinationFocus.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if ((widget.panelController != null) &&
        (_pickupFocus.hasFocus || _destinationFocus.hasFocus)) {
      widget.panelController!.open();
    }
  }

  @override
  void dispose() {
    _pickupFocus.removeListener(_handleFocusChange);
    _destinationFocus.removeListener(_handleFocusChange);
    _pickupFocus.dispose();
    _destinationFocus.dispose();
    super.dispose();
  }

  Widget _buildStepContent(BuildContext context, RideFlowState state) {
    switch (state.step) {
      case RideFlowStep.search:
        return SearchPanelWidget(
          pickupFocusNode: _pickupFocus,
          destinationFocusNode: _destinationFocus,
        );
      case RideFlowStep.vehicleSelection:
        final searchResult = state.searchResult;
        final pickup = searchResult?.pickupLocation ?? '-';
        final dropoff = searchResult?.dropoffLocation ?? '-';

        return VehicleSelectionPanel(
          pickupFocus: _pickupFocus,
          destinationFocus: _destinationFocus,
          pickupLocation: pickup,
          dropoffLocation: dropoff,
        );
      case RideFlowStep.confirmation:
        final searchResult = state.searchResult;
        // Extract pickup, dropoff, fare from state or selectedVehicle/searchResult as needed
        final pickup = searchResult?.pickupLocation ?? '-';
        final dropoff = searchResult?.dropoffLocation ?? '-';
        final fare = state.selectedFare ?? '-';
        return ConfirmRidePanel(
          pickupLocation: pickup,
          dropoffLocation: dropoff,
          fare: fare,
        );
      case RideFlowStep.rideStarted:
        final rideData = state.confirmationData;
        final driverName = rideData!.captain.fullname.firstname;
        final vehicleNumber = rideData.captain.vehicle.plate;
        final vehicleName = rideData.captain.vehicle.vehicleType;
        final otp = rideData.otp;
        final source = rideData.pickup;
        final destination = rideData.destination;
        return RideWithDriverPannel(
          driverName: driverName,
          vehicleNumber: vehicleNumber,
          vehicleName: vehicleName,
          otp: otp,
          source: source,
          destination: destination,
          isWating: false,
        );

      // This step is for showing the ride creation confirmation

      case RideFlowStep.confirmedByDriver:
        final rideData = state.confirmationData;
        final driverName = rideData!.captain.fullname.firstname;
        final vehicleNumber = rideData.captain.vehicle.plate;
        final vehicleName = rideData.captain.vehicle.vehicleType;
        final otp = rideData.otp;
        final source = rideData.pickup;
        final destination = rideData.destination;
        return RideWithDriverPannel(
          driverName: driverName,
          vehicleNumber: vehicleNumber,
          vehicleName: vehicleName,
          otp: otp,
          source: source,
          destination: destination,
          isWating: true,
        );

      case RideFlowStep.rideCompleted:
        final ride = state.confirmationData;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 48),
              const SizedBox(height: 12),
              const Text(
                'Ride Created!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (ride != null) ...[
                const SizedBox(height: 8),
                Text('Ride ID: \\${ride.userId ?? '-'}'),
              ],
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Larger tap area for the handle
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              debugPrint('Panel handle tapped');
              if (widget.panelController != null) {
                if (widget.panelController!.isPanelClosed) {
                  widget.panelController!.open();
                } else {
                  widget.panelController!.close();
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 32, // Larger tap area
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          BlocBuilder<RideFlowCubit, RideFlowState>(
            builder: (context, state) {
              return _buildStepContent(context, state);
            },
          ),
        ],
      ),
    );
  }
}
