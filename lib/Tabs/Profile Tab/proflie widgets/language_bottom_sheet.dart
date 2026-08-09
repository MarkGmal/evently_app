import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/app_language_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
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
            onTap: () => languageProvider.changeLanguage(newCode: "en"),
            child: languageProvider.languageCode == "en"
                ? getSelectedLanguage(
                    language: AppLocalizations.of(context)!.english,
                  )
                : getUnSelectedLanguage(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          GestureDetector(
            onTap: () => languageProvider.changeLanguage(newCode: "ar"),
            child: languageProvider.languageCode == "ar"
                ? getSelectedLanguage(
                    language: AppLocalizations.of(context)!.arabic,
                  )
                : getUnSelectedLanguage(
                    language: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language, style: AppStyles.bold20Primary),
        Icon(Icons.check, size: 30, color: AppColors.primaryLight),
      ],
    );
  }

  Widget getUnSelectedLanguage({required String language}) {
    return Text(language, style: Theme.of(context).textTheme.titleLarge);
  }
}
