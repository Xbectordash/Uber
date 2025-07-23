import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0ABAB5),
      secondary: Color(0xFF56DFCF),
      tertiary: Color(0xFFADEED9),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onTertiary: Colors.black,
    ),
    fontFamily: 'OpenSans',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
