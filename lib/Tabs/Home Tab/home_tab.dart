import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_card.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/home_header.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return EventCard();
              },
              separatorBuilder: (context, index) => SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
