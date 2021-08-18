import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:flutter/cupertino.dart';

class SnackbarUtility {
  static showSnackbar(
      {required BuildContext context, required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        backgroundColor: KConstantColors.blueColor,
        content:
            Text(message, style: KConstantTextStyles.BoldText(fontSize: 14))));
  }

  static showLoadingSnackbar(
      {required int time,
      required String title,
      required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: KConstantColors.bgColor,
        duration: Duration(seconds: time),
        content: Row(children: [
          SizedBox(height: 10, width: 10, child: CircularProgressIndicator()),
          hSizedBox2,
          Text(
            title,
            style: KConstantTextStyles.BHeading1(fontSize: 16),
          )
        ])));
  }
}
