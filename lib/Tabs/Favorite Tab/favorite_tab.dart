import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/Providers/app_events_provider.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

late AppEventsProvider appEventsProvider;

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appEventsProvider.getAllFavoriteEvents();
    });
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    appEventsProvider = Provider.of<AppEventsProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        spacing: 0,
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.01),
            child: CustomTextFormField(
              controller: searchController,
              hintText: AppLocalizations.of(context)!.searchForEvent,
              hintStyle: AppStyles.bold14Primary,
              borderSideColor: AppColors.primaryLight,
              prefixIcon: Icons.search,
              iconColor: AppColors.primaryLight,
            ),
          ),
          Expanded(
            child: appEventsProvider.favoriteEventsList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.img1),
                      Text(
                        AppLocalizations.of(context)!.noEventsFound,
                        style: AppStyles.bold20Primary,
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: appEventsProvider.favoriteEventsList.length,
                    itemBuilder: (context, index) {
                      return EventCard(
                        eventModel: appEventsProvider.favoriteEventsList[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(),
                  ),
          ),
        ],
      ),
    );
  }
}
