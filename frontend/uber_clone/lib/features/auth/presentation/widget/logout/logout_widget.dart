import 'package:flutter/material.dart';
import 'package:uber_clone/l10n/app_localizations.dart';
import 'package:uber_clone/utils/constans/color_const.dart';

class LogoutWidget extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutWidget({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onLogout,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.tertiary(context),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          localizations.logout,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorConst.onPrimary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
