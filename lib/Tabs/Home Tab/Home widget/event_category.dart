import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventCategory extends StatelessWidget {
  EventCategory({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.eventIcon,
  });
  bool isSelected;
  String eventName;
  IconData eventIcon;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.006,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(46),
        border: Border.all(width: 2, color: Theme.of(context).focusColor),
        color: isSelected
            ? Theme.of(context).focusColor
            : AppColors.transparentColor,
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            eventIcon,
            color: isSelected
                ? Theme.of(context).dividerColor
                : AppColors.whiteColor,
          ),
          Text(
            eventName,
            style: isSelected
                ? Theme.of(context).textTheme.bodyLarge
                : AppStyles.medium16White,
          ),
        ],
      ),
    );
  }
}
