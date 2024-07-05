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
    background: Colors.grey,
    primary: Colors.white,
    secondary: Colors.grey.shade600,
    tertiary: const Color.fromARGB(255, 3, 190, 150),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Colors.blue,
  //   foregroundColor: Colors.white,
  // ),
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    background: Colors.black,
    primary: Colors.black,
    secondary: Colors.grey.shade600,
    tertiary: const Color.fromARGB(255, 3, 190, 150),
  ),
);
