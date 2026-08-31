import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 0,
        children: [
          CustomTextFormField(
            controller: searchController,
            hintText: AppLocalizations.of(context)!.searchForEvent,
            hintStyle: AppStyles.bold14Primary,
            borderSideColor: AppColors.primaryLight,
            prefixIcon: Icons.search,
            iconColor: AppColors.primaryLight,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container();
              },
              separatorBuilder: (context, index) => SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
