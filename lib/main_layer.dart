

import 'package:evently_app/Tabs/Favorite%20Tab/favorite_tab.dart';
import 'package:evently_app/Tabs/Home%20Tab/home_tab.dart';
import 'package:evently_app/Tabs/Map%20Tab/map_tab.dart';
import 'package:evently_app/Tabs/Profile%20Tab/profile_tab.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'l10n/app_localizations.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});
  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int tabIndex = 0;
  List tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Navigator to add event
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (value) {
          tabIndex = value;
          setState(() {});
        },
        items: [
          buildBottomNavigationBar(
            index: 0,
            selectedIcon: AppImages.homeSelected,
            unselectedIcon: AppImages.homeUnselected,
            label: AppLocalizations.of(context)!.home,
          ),
          buildBottomNavigationBar(
            index: 1,
            selectedIcon: AppImages.mapSelected,
            unselectedIcon: AppImages.mapUnselected,
            label: AppLocalizations.of(context)!.map,
          ),
          buildBottomNavigationBar(
            index: 2,
            selectedIcon: AppImages.favSelected,
            unselectedIcon: AppImages.favUnselected,
            label: AppLocalizations.of(context)!.love,
          ),
          buildBottomNavigationBar(
            index: 3,
            selectedIcon: AppImages.profileSelected,
            unselectedIcon: AppImages.profileUnselected,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),

      body: tabs[tabIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBar({
    required String selectedIcon,
    required String unselectedIcon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(tabIndex == index ? selectedIcon : unselectedIcon),
      label: label,
    );
  }
}