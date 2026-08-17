import 'package:evently_app/Common%20Widget/custom_elevated_button.dart';
import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgetPassController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    final fromKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: AppStyles.bold20Primary,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(height * 0.01),
        child: SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              spacing: height * 0.02,
              children: [
                Image.asset(AppImages.changeSetting),
                CustomTextFormField(
                  controller: forgetPassController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter your email";
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                ),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.resetPassword,
                  onPressed: () {
                    //TODO: logic
                    fromKey.currentState!.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
