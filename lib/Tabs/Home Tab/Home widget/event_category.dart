import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventCategory extends StatelessWidget {
  EventCategory({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.eventIcon,
    required this.borderColor,
    required this.selectedBgColor,
    required this.selectedIconColor,
    required this.unSelectedIconColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
  });
  bool isSelected;
  String eventName;
  IconData eventIcon;
  Color borderColor;
  Color selectedBgColor;
  Color selectedIconColor;
  Color unSelectedIconColor;
  TextStyle selectedTextStyle;
  TextStyle unSelectedTextStyle;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.006,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(46),
        border: Border.all(width: 2, color: borderColor),
        color: isSelected ? selectedBgColor : AppColors.transparentColor,
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            eventIcon,
            color: isSelected ? selectedIconColor : unSelectedIconColor,
          ),
          Text(
            eventName,
            style: isSelected ? selectedTextStyle : unSelectedTextStyle,
          ),
        ],
      ),
    );
  }
}
