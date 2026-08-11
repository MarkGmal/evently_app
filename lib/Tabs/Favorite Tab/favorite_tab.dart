import 'package:evently_app/Tabs/Favorite%20Tab/Favorite%20widget/custom_text_field.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 0,
        children: [
          CustomTextField(),
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
