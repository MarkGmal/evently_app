import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.borderSideColor = AppColors.greyColor,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.iconColor,
    this.maxLines = 1,
    required this.controller,
    required this.hintText,
  });
  Color? borderSideColor;
  Color? iconColor;
  String hintText;
  TextStyle? hintStyle;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Validator? validator;
  int? maxLines;
  TextInputType keyboardType;
  bool obscureText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      style: AppStyles.bold14Primary,
      cursorColor: AppColors.primaryLight,
      decoration: InputDecoration(
        disabledBorder: _getBorder(borderSideColor!),
        focusedBorder: _getBorder(borderSideColor!),
        enabledBorder: _getBorder(borderSideColor!),
        errorBorder: _getBorder(AppColors.redColor),
        focusedErrorBorder: _getBorder(AppColors.redColor),
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor ?? Theme.of(context).hoverColor,
          size: 25,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: iconColor ?? Theme.of(context).hoverColor,
          size: 25,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  _getBorder(Color borderSideColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderSideColor, width: 2),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
