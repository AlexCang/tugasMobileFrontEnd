import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Colors.white,
  //   foregroundColor: Colors.black,
  // ),
  colorScheme: ColorScheme.light(
    background: Colors.grey.withOpacity(0.2),
    primary: Colors.white,
    secondary: Colors.grey.shade600,
    tertiary: Colors.red,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black87,
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Colors.blue,
  //   foregroundColor: Colors.white,
  // ),
  colorScheme: ColorScheme.dark(
    surface: Colors.black54,
    background: Colors.black.withOpacity(0.8),
    primary: Colors.black,
    secondary: Colors.grey.shade600,
    tertiary: Colors.red,
  ),
);
