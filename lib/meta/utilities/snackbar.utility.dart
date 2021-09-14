import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:flutter/cupertino.dart';

class SnackbarUtility {
  static showSnackbar(
      {required BuildContext context, required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.greenAccent,
        content: Text(message,
            style: TextStyle(
                color: Colors.white,
                fontFamily: KConstantFonts.MonteserratB))));
  }

  static showLoadingSnackbar(
      {required int time,
      required String title,
      required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: time),
        content: Row(children: [
          SizedBox(height: 10, width: 10, child: CircularProgressIndicator()),
          hSizedBox2,
          Text(title,
              style: TextStyle(
                  color: Colors.white, fontFamily: KConstantFonts.MonteserratB))
        ])));
  }

  static featureYetToCome({required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: KConstantColors.bgColor,
        content: Text("Feature is on the way!",
            style: KConstantTextStyles.BHeading1(fontSize: 16))));
  }
}
