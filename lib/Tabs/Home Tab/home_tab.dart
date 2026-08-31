import 'package:evently_app/Providers/app_events_provider.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_card.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/home_header.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late AppEventsProvider eventsProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventsProvider.getAllEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<AppEventsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: eventsProvider.filterEventsList.isEmpty
                ? Column(
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
                    itemCount: eventsProvider.filterEventsList.length,
                    itemBuilder: (context, index) {
                      return EventCard(
                        eventModel: eventsProvider.filterEventsList[index],
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
