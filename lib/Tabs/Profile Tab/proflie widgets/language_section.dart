import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Tabs/Profile%20Tab/proflie%20widgets/language_bottom_sheet.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        GestureDetector(
          onTap: () {
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              border: Border.all(color: AppColors.primaryLight, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageProvider.languageCode == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: AppStyles.semi20Primary,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                  color: AppColors.primaryLight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
