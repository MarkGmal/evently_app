import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

typedef OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
 const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        style: AppStyles.bold14Primary,
        cursorColor: AppColors.primaryLight,
        decoration: InputDecoration(
          disabledBorder: _getBorder(),
          focusedBorder: _getBorder(),
          enabledBorder: _getBorder(),
          prefixIcon: Icon(Icons.search,size: 25,color: AppColors.primaryLight,),
          hintText:AppLocalizations.of(context)!.searchForEvent,
          hintStyle: AppStyles.bold14Primary,
        ),
      ),
    );
  }

  _getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
