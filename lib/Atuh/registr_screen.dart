import 'package:evently_app/Common%20Widget/custom_elevated_button.dart';
import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';

class RegistrScreen extends StatefulWidget {
  RegistrScreen({super.key});

  @override
  State<RegistrScreen> createState() => _RegistrScreenState();
}

class _RegistrScreenState extends State<RegistrScreen> {
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    bool isDark = appThemeProvider.themeMode == ThemeMode.dark;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.bold20Primary,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Form(
              key: fromKey,
              child: Column(
                spacing: height * 0.02,
                children: [
                  SizedBox(height: height * 0.01),
                  Image.asset(AppImages.eventlyLogo),
                  SizedBox(height: height * 0.02),
                  // name
                  CustomTextFormField(
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.name,
                    prefixIcon: Icons.person,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter your Name";
                      }
                      return null;
                    },
                  ),
                  // email
                  CustomTextFormField(
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
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
                  ),
                  // password
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      if (text.length < 6) {
                        return "Password must be 6 numbers";
                      }
                      return null;
                    },
                  ),
                  // re password
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: AppLocalizations.of(context)!.rePassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      if (text != passwordController.text) {
                        return " Re password not match";
                      }
                      return null;
                    },
                  ),
                  //create account
                  CustomElevatedButton(
                    onPressed: () {
                      register();
                    },
                    text: AppLocalizations.of(context)!.createAccount,
                  ),
                  // login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAccount,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppStyles.bold16Primary,
                        ),
                      ),
                    ],
                  ),
                  // theme and localization
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: appLanguageProvider.languageCode == "en",
                        onChanged: (bool value) {
                          appLanguageProvider.changeLanguage(
                            newCode: value ? "en" : "ar",
                          );
                        },
                        activeThumbImage: AssetImage(AppImages.enIcon),
                        inactiveThumbImage: AssetImage(AppImages.egIcon),
                        activeTrackColor: AppColors.primaryLight,
                        inactiveTrackColor: AppColors.primaryLight,
                      ),
                      IconButton(
                        onPressed: () {
                          //TODO: Change Theme
                          appThemeProvider.changeAppTheme(
                            newTheme: isDark ? ThemeMode.light : ThemeMode.dark,
                          );
                        },
                        icon: Icon(
                          Icons.light_mode,
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (fromKey.currentState!.validate() == true) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
    }
  }
}
