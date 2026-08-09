import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.04,
      ),
      height: height * 0.2, // reduce height bottomSheet
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                themeProvider.changeAppTheme(newTheme: ThemeMode.light),
            child: themeProvider.themeMode == ThemeMode.light
                ? getSelectedLanguage(mode: AppLocalizations.of(context)!.light)
                : getUnSelectedLanguage(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
          GestureDetector(
            onTap: () => themeProvider.changeAppTheme(newTheme: ThemeMode.dark),
            child: themeProvider.themeMode == ThemeMode.dark
                ? getSelectedLanguage(mode: AppLocalizations.of(context)!.dark)
                : getUnSelectedLanguage(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage({required String mode}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mode, style: AppStyles.bold20Primary),
        Icon(Icons.check, size: 30, color: AppColors.primaryLight),
      ],
    );
  }

  Widget getUnSelectedLanguage({required String theme}) {
    return Text(theme, style: Theme.of(context).textTheme.titleLarge);
  }
}
