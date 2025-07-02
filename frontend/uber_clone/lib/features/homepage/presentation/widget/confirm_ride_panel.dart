import 'package:flutter/material.dart';
import 'package:uber_clone/utils/app_assets_util.dart';

class ConfirmRidePanel extends StatefulWidget {
  final String pickupLocation;
  final String dropoffLocation;
  final String fare;

  const ConfirmRidePanel({
    super.key,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.fare,
  });

  @override
  State<ConfirmRidePanel> createState() => _ConfirmRidePanelState();
}

class _ConfirmRidePanelState extends State<ConfirmRidePanel> {
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
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Confirm your Ride',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  AppAssetsUtil.taxi,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
            ),
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
              RideInfoTile(
                icon: Icons.payment,
                text: widget.fare,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // handle confirm
              },
              child: Text("Confirm", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
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
