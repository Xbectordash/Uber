import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';

class CaptainContentPanel extends StatefulWidget {
  final GetCaptain captainData;

  const CaptainContentPanel({
    super.key,
    required this.captainData,
  });

  @override
  State<CaptainContentPanel> createState() => _CaptainContentPanelState();
}

class _CaptainContentPanelState extends State<CaptainContentPanel> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.black54,
        );

    final captain = widget.captainData.captain;
    final status = captain?.status ?? '';
    final fullName = '${captain?.fullname?.firstname ?? ''} ${captain?.fullname?.lastname ?? ''}'.trim();
    final vehicleColor = captain?.vehicle?.color ?? '';
    final plate = captain?.vehicle?.plate ?? '';
    final vehicleType = captain?.vehicle?.vehicleType ?? '';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Status Badge - Top Right
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: status.toLowerCase() == "active"
                    ? Colors.green[100]
                    : Colors.red[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status.toUpperCase(),
                style: textStyle?.copyWith(
                  color: status.toLowerCase() == "active"
                      ? Colors.green[800]
                      : Colors.red[800],
                ),
              ),
            ),
          ),

          // Main Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile Icon
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.blueGrey,
                    ),
                  ),

                  // Name and Vehicle Color
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fullName, style: textStyle),
                        const SizedBox(height: 4),
                        Text('Color: $vehicleColor', style: textStyle),
                        if (vehicleType.isNotEmpty)
                          Text('Type: $vehicleType', style: textStyle),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Plate Number
              Text('Plate: $plate', style: textStyle),
            ],
          ),
        ],
      ),
    );
  }
}
