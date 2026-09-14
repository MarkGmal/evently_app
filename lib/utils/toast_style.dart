import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class ToastStyle {
  static void showToastMSG(
    String msg,
    Color? backgroundColor,
    Color? textColor,
  ) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
