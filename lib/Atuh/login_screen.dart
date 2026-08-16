import 'package:evently_app/Common%20Widget/custom_elevated_button.dart';
import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/Providers/app_language_provider.dart';
import 'package:evently_app/Providers/app_theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    bool isDark = appThemeProvider.themeMode == ThemeMode.dark;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Form(
              key: fromKey,
              child: Column(
                spacing: height * 0.02,
                children: [
                  Image.asset(AppImages.eventlyLogo),
                  SizedBox(height: height * 0.02),
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
                      return null;
                    },
                  ),
                  // forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          //TODO : to forgetPass Screen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.forgetPasswordScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // login
                  CustomElevatedButton(
                    onPressed: () {
                      login();
                    },
                    text: AppLocalizations.of(context)!.login,
                  ),
                  // create account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAccount,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.registrScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: AppStyles.bold16Primary,
                        ),
                      ),
                    ],
                  ),
                  // or
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: AppColors.primaryLight,
                          indent: width * 0.02,
                          endIndent: width * 0.02,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: AppStyles.medium16Primary,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: AppColors.primaryLight,
                          indent: width * 0.02,
                          endIndent: width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  // login with google
                  CustomElevatedButton(
                    onPressed: () {
                      //TODO : login with google
                    },
                    text: AppLocalizations.of(context)!.loginWithGoogle,
                    textStyle: AppStyles.medium20Primary,
                    icon: SvgPicture.asset(AppImages.googleIcon),
                    hasIcon: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: AppColors.primaryLight,
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

  void login() {
    if (fromKey.currentState!.validate() == true) {
      // TODO: logic;
    }
  }
}
