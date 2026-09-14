import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/FireBase/fire_store.dart';
import 'package:evently_app/Models/event_model.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/toast_style.dart';
import 'package:flutter/material.dart';

class AppEventsProvider extends ChangeNotifier {
  List<EventModel> eventsList = [];
  List<EventModel> filterEventsList = [];
  List<EventModel> favoriteEventsList = [];

  List<String> eventsNameList = [];
  int selectedIndex = 0;

  void getEventsNameList(BuildContext context) {
    eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  void changeSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }

  void getAllEvents() async {
    QuerySnapshot<EventModel> querySnapshot =
        await FireStore.getEventsCollection()
            .orderBy("event_date_time", descending: true)
            .get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEventsList = eventsList;
    notifyListeners();
  }

  void getFilterEvents() async {
    QuerySnapshot<EventModel> querySnapshot =
        await FireStore.getEventsCollection()
            .orderBy("event_date_time", descending: true)
            .where("eventCategory", isEqualTo: eventsNameList[selectedIndex])
            .get();

    filterEventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateFavoriteEvents(EventModel event) {
    FireStore.getEventsCollection()
        .doc(event.id)
        .update({"is_favorite": !event.isFavorite})
        .timeout(
          Duration(microseconds: 500),
          onTimeout: () {
            ToastStyle.showToastMSG(
              "Fav updated",
              AppColors.greenColor,
              AppColors.whiteColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    getAllFavoriteEvents();
    notifyListeners();
  }

  void getAllFavoriteEvents() async {
    QuerySnapshot<EventModel> querySnapshot =
        await FireStore.getEventsCollection()
            .orderBy("event_date_time", descending: true)
            .where("is_favorite", isEqualTo: true)
            .get();
    favoriteEventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}
