import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
  );
}
