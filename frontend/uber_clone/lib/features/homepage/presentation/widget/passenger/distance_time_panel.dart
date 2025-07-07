import 'package:flutter/material.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';

class DistanceTimePanel extends StatelessWidget {
  final DistanceTime distanceTime;
  const DistanceTimePanel({super.key, required this.distanceTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Distance: \\${distanceTime.distance!.text}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Duration: \\${distanceTime.duration!.text}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
