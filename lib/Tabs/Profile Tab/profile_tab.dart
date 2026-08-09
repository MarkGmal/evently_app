import 'package:evently_app/Tabs/Profile%20Tab/proflie%20widgets/language_section.dart';
import 'package:evently_app/Tabs/Profile%20Tab/proflie%20widgets/theme_section.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        title: Row(
          children: [
            Image.asset(
              AppImages.routeLogo,
              width: width * 0.26,
              height: height * 0.26,
            ),
            SizedBox(width: width * .04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mark Gamal",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: Colors.white),
                  ),
                  Text(
                    "markgamal.flutter@gmail.com",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: height * 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(64),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.04,
        ),
        child: Column(
          children: [
            LanguageSection(),
            SizedBox(height: height * 0.03),
            ThemeSection(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                backgroundColor: AppColors.redColor,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.04,
                ),
              ),
              onPressed: () {
                //TODO: logic logout
              },
              child: Row(
                children: [
                  Icon(Icons.logout, size: 30, color: AppColors.whiteColor),
                  SizedBox(width: width * 0.05),
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyles.regular20White,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
