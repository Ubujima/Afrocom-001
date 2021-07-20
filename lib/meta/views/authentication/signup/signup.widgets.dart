import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupWidgets {
  static Container signupSection(
      {required List<TextEditingController> textEditingController}) {
    return Container(
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField.stylishTextField(
                "Enter name", textEditingController[0]),
            vSizedBox1,
            CustomTextField.stylishTextField(
                "Enter email", textEditingController[1]),
            vSizedBox1,
            CustomTextField.stylishTextField(
                "Enter password", textEditingController[2]),
          ],
        ),
      ),
    );
  }

  static signupButton(
      {required BuildContext context, required dynamic onPressed}) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 200.0,
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(18.0)),
          child: Center(
            child: Text(
              "Signup",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: KConstantFonts.MonteserratB),
            ),
          ),
        ),
      ),
    );
  }

  static loginScreenText({required dynamic onPressed}) {
    return Center(
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
                color: KConstantColors.textColor,
                fontWeight: FontWeight.w700,
                fontFamily: KConstantFonts.Monteserrat),
          ),
          TextSpan(
            text: "Login",
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 17.0,
                color: KConstantColors.textColor,
                fontWeight: FontWeight.bold,
                fontFamily: KConstantFonts.MonteserratB),
          )
        ]),
      ),
    );
  }

  static skipAuthentication({required BuildContext context}) {
    final NavigationUtility navigationUtility = new NavigationUtility();
    return Center(
        child: TextButton(
      onPressed: navigationUtility.navigateTo(context, HomeRoute),
      child: Text(
        "Skip for now",
        style: TextStyle(
            color: KConstantColors.textColor,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w700,
            fontFamily: KConstantFonts.Monteserrat),
      ),
    ));
  }
}
