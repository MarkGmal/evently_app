import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnPressed = void Function();

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.hasIcon = false,
    this.icon,
    this.backgroundColor = AppColors.primaryLight,
    this.borderColor = AppColors.transparentColor,
  });
  String text;
  Color? backgroundColor;
  Color? borderColor;
  TextStyle? textStyle;
  bool hasIcon;
  Widget? icon;
  OnPressed onPressed;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(width: 2, color: borderColor!),
          ),
        ),
        onPressed: onPressed,
        child: hasIcon
            ? Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  Text(text, style: textStyle ?? AppStyles.medium20White),
                ],
              )
            : Text(text, style: textStyle ?? AppStyles.medium20White),
      ),
    );
  }
}
