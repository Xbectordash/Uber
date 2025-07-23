import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TextStyleConst {
  TextStyleConst._();

  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();

  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall ?? const TextStyle();
}
