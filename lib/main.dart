import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/Tabs/Profile%20Tab/profile_tab.dart';
import 'package:evently_app/l10n/app_localizations.dart';
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
      },
      initialRoute: AppRoutes.mainLayer,
    );
  }
}
