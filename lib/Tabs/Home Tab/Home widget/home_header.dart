import 'package:evently_app/Providers/app_events_provider.dart';
import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_category.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var appEventsProvider = Provider.of<AppEventsProvider>(context);
    appEventsProvider.getEventsNameList(context);
    bool isDark = appThemeProvider.themeMode == ThemeMode.dark;
    bool isArabic = appLanguageProvider.languageCode == "ar";

    List<IconData> iconsList = [
      Icons.all_inclusive,
      Icons.sports_soccer,
      Icons.cake,
      Icons.meeting_room,
      Icons.sports_esports,
      Icons.work,
      Icons.menu_book,
      Icons.beach_access,
      Icons.dining,
    ];
    return Container(
      color: Theme.of(context).primaryColor,
      height: height * 0.27,
      padding: EdgeInsets.all(height * 0.02),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  //TODO: logic to change text
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: AppStyles.regular14White,
                    ),
                    Text("Mark Gamal", style: AppStyles.bold24White),
                    Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(AppImages.mapUnselected),
                        Text("Cairo , Egypt", style: AppStyles.medium14White),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    //TODO: Change Theme
                    appThemeProvider.changeAppTheme(
                      newTheme: isDark ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  icon: Icon(Icons.light_mode, color: AppColors.whiteColor),
                ),
                Container(
                  padding: EdgeInsets.all(height * 0.01),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      appLanguageProvider.changeLanguage(
                        newCode: isArabic ? "en" : "ar",
                      );
                    },
                    child: Text(
                      isArabic ? "EN" : "AR",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            DefaultTabController(
              //TODO: category logic
              length: appEventsProvider.eventsNameList.length,
              child: TabBar(
                onTap: (value) {
                appEventsProvider.changeSelectedIndex(value);
                },
                isScrollable: true,
                dividerColor: AppColors.transparentColor,
                indicatorColor: AppColors.transparentColor,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                tabs: appEventsProvider.eventsNameList.map((eventName) {
                  return EventCategory(
                    borderColor: Theme.of(context).focusColor,
                    selectedBgColor: Theme.of(context).focusColor,
                    selectedIconColor: Theme.of(context).dividerColor,
                    unSelectedIconColor: AppColors.whiteColor,
                    selectedTextStyle: Theme.of(context).textTheme.bodyLarge!,
                    unSelectedTextStyle: AppStyles.medium16White,
                    eventName: eventName,
                    eventIcon:
                        iconsList[appEventsProvider.eventsNameList.indexOf(
                          eventName,
                        )],
                    isSelected:
                        appEventsProvider.selectedIndex ==
                        appEventsProvider.eventsNameList.indexOf(eventName),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
