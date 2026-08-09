import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String languageCode = "en";

  void changeLanguage({required String newCode}) {
    if (newCode == languageCode) {
      return;
    }
    languageCode = newCode;
    notifyListeners();
  }
}
