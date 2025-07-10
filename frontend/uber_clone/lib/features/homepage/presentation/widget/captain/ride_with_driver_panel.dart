import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uber_clone/utils/app_assets_util.dart';
// import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/l10n/app_localizations.dart';

class RideWithDriverPannel extends StatelessWidget {
  final String driverName;
  final String vehicleNumber;
  final String vehicleName;
  final String otp;
  final String source;
  final String destination;
  final bool isWating;

  const RideWithDriverPannel({
    super.key,
    required this.driverName,
    required this.vehicleNumber,
    required this.vehicleName,
    required this.otp,
    required this.source,
    required this.destination,
    required this.isWating,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${localizations!.driverLabel}$driverName",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 4),
                    Text("${localizations!.vehicleNoLabel}$vehicleNumber",
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 4),
                    Text("${localizations!.vehicleLabel}$vehicleName",
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssetsUtil.car,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${localizations!.otpLabel}$otp",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.my_location, size: 20, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      source,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Icon(Icons.arrow_downward, size: 16),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 20, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      destination,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: isWating
                ? Lottie.asset(
                    AppAssetsUtil.waitingAnimation,
                    height: 60,
                    fit: BoxFit.contain,
                    repeat: true,
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Handle payment
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      localizations!.makePayment,
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
