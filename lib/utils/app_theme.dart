import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(titleLarge: AppStyles.bold20Black),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whiteBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(titleLarge: AppStyles.bold20White),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
    ),
  );
}
