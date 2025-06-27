import 'package:flutter/material.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';

class LoginMessage extends StatelessWidget {
  final bool isUser;
  const LoginMessage({super.key, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
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
            isUser
                ? StringConstant.welcomePassenger
                : StringConstant.welcomeCaptain,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
