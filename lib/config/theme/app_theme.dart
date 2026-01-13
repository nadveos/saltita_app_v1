import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF3F88C5),
      secondary: Color(0xFFFFD166),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFF0F172A),
    ),
    scaffoldBackgroundColor: Color(0xFFF8FAFC),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF3F88C5), foregroundColor: Colors.white),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF60A5FA),
      secondary: Color(0xFFFBBF24),
      surface: Color(0xFF1E293B),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFF0F172A),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1E40AF), foregroundColor: Colors.white),
    useMaterial3: true,
  );
}
