import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:flutter/cupertino.dart';

class SnackbarUtility {
  static showSnackbar(
      {required BuildContext context, required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: KConstantColors.bgColorFaint,
        content:
            Text(message, style: KConstantTextStyles.MBody1(fontSize: 16))));
  }
}
