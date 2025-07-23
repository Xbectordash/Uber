import 'package:flutter/material.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';

class CaptainSignupMessage extends StatelessWidget {
  const CaptainSignupMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorConst.tertiary(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((255 * 0.3).toInt()),
              spreadRadius: 0,
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            StringConstant.captainSignupMessage,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorConst.onPrimary(context),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
