import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/data/rideId_model.dart';
import 'package:uber_clone/features/homepage/domain/confirm_ride_by_captain.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/driver_side_flow_cubit.dart';

class CaptainConfirmRidePanel extends StatelessWidget {
  final String rideId;
  final String userName;
  final String pickupLocation;
  final String dropoffLocation;
  final String distance;

  const CaptainConfirmRidePanel({
    super.key,
    required this.userName,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.distance,
    required this.rideId
  });

  @override
  Widget build(BuildContext context) {
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
                  userName,
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
              RideInfoTile(icon: Icons.my_location, text: pickupLocation),
              const Divider(),
              RideInfoTile(icon: Icons.location_on, text: dropoffLocation),
              const Divider(),
              RideInfoTile(icon: Icons.directions_car, text: distance),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // handle ignore
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Ignore",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // handle accept
                    try{
                      final rideIdModel =RideIdModel(rideId: rideId);
                      debugPrint("befor entering in confirm ride by captain :${rideIdModel.rideId}");
                      final response =await ConfirmRideByCaptain().confirmRideRequest(rideIdModel);
                      if(response.statusCode==200){
                        BlocProvider.of<DriverSideFlowCubit>(context).toConfirmingOtp();

                      }

                      // we have to implement confirm otp 

                    }catch (e){
                      debugPrint("Error on calling accept button by captain");
                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Accept",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RideInfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const RideInfoTile({
    super.key,
    required this.icon,
    required this.text,
  });

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
