import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/utils/app_assets_util.dart';
import 'package:uber_clone/utils/constans/color_const.dart';
import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/l10n/app_localizations.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
              child: Image.asset(AppAssetsUtil.uberLanding, fit: BoxFit.cover),
            ),
          ),
          Text(
            localizations!.welcomeMessage,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  'Continue as:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed(StringConstant.loginRouteName, extra: true);
                      },
                      icon: const Icon(Icons.person),
                      label: const Text('Passenger'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primary(context),
                        foregroundColor: ColorConst.onPrimary(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed(
                          StringConstant.loginRouteName,
                          extra: false,
                        );
                      },
                      icon: const Icon(Icons.directions_car),
                      label: const Text('Driver'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primary(context),
                        foregroundColor: ColorConst.onPrimary(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
