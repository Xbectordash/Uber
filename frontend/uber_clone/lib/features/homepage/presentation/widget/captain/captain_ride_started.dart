import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:uber_clone/features/homepage/domain/end_ride_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_event.dart';

class CaptainRideStartedScreen extends StatefulWidget {
  final String source;
  final String destination;
  final String fare;
  final String rideId;

  const CaptainRideStartedScreen({
    super.key,
    required this.source,
    required this.destination,
    required this.fare,
    required this.rideId,
  });

  @override
  State<CaptainRideStartedScreen> createState() =>
      _CaptainRideStartedScreenState();
}

class _CaptainRideStartedScreenState extends State<CaptainRideStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w800,
      color: Colors.black54,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 80,
              child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_touohxv0.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "🚕 Ride Started",
              style: textStyle?.copyWith(
                fontSize: 18,
                color: Colors.green[700],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Source
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 20),
              const SizedBox(width: 6),
              Text("Source:", style: textStyle),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.source,
                  style: textStyle?.copyWith(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Destination
          Row(
            children: [
              const Icon(Icons.flag, color: Colors.blue, size: 20),
              const SizedBox(width: 6),
              Text("Destination:", style: textStyle),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.destination,
                  style: textStyle?.copyWith(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Fare
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Fare: ", style: textStyle),
                const SizedBox(width: 4),
                Text(
                  widget.fare,
                  style: textStyle?.copyWith(
                    fontSize: 16,
                    color: Colors.blueGrey[700],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Ride Completed Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final response = await EndRideRepo().endRide(widget.rideId);
                if ([200, 201].contains(response.statusCode)) {
                  context.read<DriverSideFlowCubit>().reset();
                    BlocProvider.of<GetRoutesBloc>(context).add(ResetRoutesEvent());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to end ride: ${response.statusMessage ?? 'Unknown error'}',
                      ),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                "Ride Completed",
                style: textStyle?.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
