import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // colors
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    focusColor: AppColors.whiteColor,
    dividerColor: AppColors.primaryLight,
    hoverColor: AppColors.greyColor,
    canvasColor: AppColors.blackColor,

    // textTheme
    textTheme: TextTheme(
      titleLarge: AppStyles.bold20Black,
      bodyMedium: AppStyles.bold16Primary,
      bodyLarge: AppStyles.medium16Primary,
      titleMedium: AppStyles.medium16Grey,
      titleSmall: AppStyles.bold16White
    ),

    // bottomSheetTheme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whiteBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
    ),

    // bottomNavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
    ),

    // floatingActionButtonTheme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 5)),
    ),
  );



  static final ThemeData darkTheme = ThemeData(
    // colors
  primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    focusColor: AppColors.primaryLight,
    dividerColor: AppColors.whiteColor,
    hoverColor: AppColors.whiteColor,
    canvasColor: AppColors.whiteColor,

    // textTheme
    textTheme: TextTheme(
      titleLarge: AppStyles.bold20White,
      bodyMedium: AppStyles.bold16Black,
      bodyLarge: AppStyles.medium16White,
      titleMedium: AppStyles.medium16White,
      titleSmall: AppStyles.bold16Black,
    ),

    // bottomSheetTheme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
    ),

    // bottomNavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
    ),

    // floatingActionButtonTheme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 5)),
    ),
  );
}
