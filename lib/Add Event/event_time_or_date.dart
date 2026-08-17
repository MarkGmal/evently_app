import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnPressed = void Function()?;

class EventTimeOrDate extends StatelessWidget {
  EventTimeOrDate({
    super.key,
    required this.onPressed,
    required this.text,
    required this.chooseDateOrTime,
    required this.icon,
  });
  IconData icon;
  String text;
  String chooseDateOrTime;
  OnPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: Theme.of(context).canvasColor),
        Text(
          text,
          style: AppStyles.medium16White.copyWith(
            color: Theme.of(context).canvasColor,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(chooseDateOrTime, style: AppStyles.medium16Primary),
        ),
      ],
    );
  }
}
