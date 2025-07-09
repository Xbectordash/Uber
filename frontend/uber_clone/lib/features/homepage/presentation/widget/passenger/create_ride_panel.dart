import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
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

class _ConfirmRidePanelState extends State<ConfirmRidePanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
          ..repeat();

    _animation1 = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3, curve: Curves.easeInOut)),
    );

    _animation2 = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.5, curve: Curves.easeInOut)),
    );

    _animation3 = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Transform.translate(
        offset: Offset(0, animation.value),
        child: Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: const BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

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
          const Text(
            'Waiting for Driver...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(_animation1),
              _buildDot(_animation2),
              _buildDot(_animation3),
            ],
          ),
          const SizedBox(height: 24),
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
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // handle cancel ride]
                context.read<RideFlowCubit>().resetFlow();
                              },
              child: Text(
                "Cancel Ride",
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
}//helo

