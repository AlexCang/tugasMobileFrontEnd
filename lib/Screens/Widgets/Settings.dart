import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  List<String> privacyOption = ["public", "followers", "private"];
  String currentPrivacyOption = "public";

  void selectPrivacyOption(String value) {
    currentPrivacyOption = value;
    notifyListeners();
  }
}
