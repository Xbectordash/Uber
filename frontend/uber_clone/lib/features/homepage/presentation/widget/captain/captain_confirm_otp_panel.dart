import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:uber_clone/features/homepage/domain/start_ride_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/start_ride_bloc/start_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/start_ride_bloc/start_ride_event.dart';
import 'package:uber_clone/l10n/app_localizations.dart';
// import 'package:uber_clone/utils/constans/string_constant.dart';

class CaptainOtpStartPanel extends StatefulWidget {
  final String userName;
  final String pickupLocation;
  final String dropoffLocation;
  final String distance;
  final rideId;

  const CaptainOtpStartPanel({
    super.key,
    required this.userName,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.distance,
    required this.rideId,
  });

  @override
  State<CaptainOtpStartPanel> createState() => _CaptainOtpStartPanelState();
}

class _CaptainOtpStartPanelState extends State<CaptainOtpStartPanel> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleOtpConfirm() async {
    final otp = _otpController.text.trim();
    if (otp.isNotEmpty) {
      // context.read<StartRideBloc>().add(
      //   StartRideRequested(rideId: widget.rideId, otp: otp),
      // );
      final response = await StartRideRepo().startRide(
        rideId: widget.rideId,
        otp: otp,
      );
      if ([200, 201].contains(response.statusCode)) {
        context.read<DriverSideFlowCubit>().toStartRide();
          debugPrint("calling fetch route with, picup: ${widget.pickupLocation} and pickup ${widget.dropoffLocation}");
        BlocProvider.of<GetRoutesBloc>(context).add(
        
          FetchRoutesEvent(
            origin:widget.pickupLocation,
            destination: widget.dropoffLocation,
          ),
        );
      } else {
        final localizations = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${localizations!.failedToEndRide}${response.statusMessage ?? localizations!.unknownError}',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }

      // 🔥 Directly update UI step (even if API fails)
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.userName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              RideInfoTile(
                icon: Icons.my_location,
                text: widget.pickupLocation,
              ),
              const Divider(),
              RideInfoTile(
                icon: Icons.location_on,
                text: widget.dropoffLocation,
              ),
              const Divider(),
              RideInfoTile(icon: Icons.directions_car, text: widget.distance),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: localizations!.enterOtpToStartRide,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleOtpConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                localizations!.confirmOtpStartRide,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RideInfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const RideInfoTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
