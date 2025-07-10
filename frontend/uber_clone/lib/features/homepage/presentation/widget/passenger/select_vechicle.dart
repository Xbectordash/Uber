import 'package:flutter/material.dart';
import 'package:uber_clone/utils/app_assets_util.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';


class ChooseVehicleTile extends StatefulWidget {
  final String vehicleType;
  final int peopleCount;
  final String time;
  final String price;
  final VoidCallback onTap;

  const ChooseVehicleTile({
    super.key,
    required this.vehicleType,
    this.peopleCount = 1,
    required this.time,
    required this.price,
    required this.onTap,
  });

  @override
  State<ChooseVehicleTile> createState() => _ChooseVehicleTileState();
}

class _ChooseVehicleTileState extends State<ChooseVehicleTile> {
  String get _imagePath {
    switch (widget.vehicleType.toLowerCase()) {
      case StringConstant.carType:
        return AppAssetsUtil.car;
      case StringConstant.autoType:
        return AppAssetsUtil.taxi;
      case StringConstant.motorcycleType:
        return AppAssetsUtil.moto;
      default:
        return AppAssetsUtil.car;
    }
  }

  String get _title {
    switch (widget.vehicleType.toLowerCase()) {
      case StringConstant.carType:
        return StringConstant.carName;
      case StringConstant.autoType:
        return StringConstant.autoName;
      case StringConstant.motorcycleType:
        return StringConstant.motorcycleName;
      default:
        return widget.vehicleType[0].toUpperCase() + widget.vehicleType.substring(1);
    }
  }

  String get _subtitle {
    switch (widget.vehicleType.toLowerCase()) {
      case StringConstant.carType:
        return StringConstant.carSubtitle;
      case StringConstant.autoType:
        return StringConstant.taxiSubtitle;
      case StringConstant.motorcycleType:
        return StringConstant.motoSubtitle;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width * 0.11;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
            children: [
            Image.asset(
              _imagePath,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                children: [
                  Expanded(
                  child: SizedBox(
                    width: 100,
                    child: Text(
                    _title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                  Icons.person,
                  size: 16,
                  ),
                  Text(
                  '${widget.peopleCount}',
                  style: const TextStyle(fontSize: 14),
                  ),
                ],
                ),
                const SizedBox(height: 4),
                Text(
                widget.time,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                ),
                ),
                Text(
                _subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
                ),
              ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                '₹${widget.price}',
                style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
