import 'package:evently_app/Atuh/forget_password_screen.dart';
import 'package:evently_app/Atuh/login_screen.dart';
import 'package:evently_app/Atuh/registr_screen.dart';
import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Providers/app_location_provider.dart';
import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/Tabs/Favorite%20Tab/favorite_tab.dart';
import 'package:evently_app/Tabs/Home%20Tab/home_tab.dart';
import 'package:evently_app/Tabs/Map%20Tab/map_tab.dart';
import 'package:evently_app/Tabs/Profile%20Tab/profile_tab.dart';
import 'package:evently_app/Add%20Event/add_event_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/location/location_picker.dart';
import 'package:evently_app/main_layer.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => AppLocationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      locale: Locale(languageProvider.languageCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {
        AppRoutes.mainLayer: (context) => MainLayer(),
        AppRoutes.profileTab: (context) => ProfileTab(),
        AppRoutes.homeTab: (context) => HomeTab(),
        AppRoutes.mapTab: (context) => MapTab(),
        AppRoutes.favoriteTab: (context) => FavoriteTab(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registrScreen: (context) => RegistrScreen(),
        AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
        AppRoutes.addEventScreen: (context) => AddEventScreen(),
        AppRoutes.locationPicker: (context) => LocationPicker(),
      },
      initialRoute: AppRoutes.mainLayer,
    );
  }
}
