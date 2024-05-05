import 'package:flutter/material.dart';
import 'package:medical/Screens/Widgets/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  final lightMode = lightTheme;
  final darkMode = darkTheme;

  // Toggle button
  void changeTheme() {
    _isDark = !isDark;
    notifyListeners();
  }

  init() {
    notifyListeners();
  }
}
