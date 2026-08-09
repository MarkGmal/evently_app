import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeAppTheme({required ThemeMode newTheme}) {
    if (themeMode == newTheme) {
      return;
    }
    themeMode = newTheme;
    notifyListeners();
  }
}
