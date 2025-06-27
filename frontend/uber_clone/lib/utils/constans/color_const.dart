import 'package:flutter/material.dart';

class ColorConst {
  // Background colors
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color tertiary(BuildContext context) =>
      Theme.of(context).colorScheme.tertiary;

  // Text/Icon colors (used on top of above)
  static Color onPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;

  static Color onSecondary(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondary;

  static Color onTertiary(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiary;
}
