import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidgets {
  static Container loginSection(
      {required List<TextEditingController> textEditingController}) {
    return Container(
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField.stylishTextField(
                "Enter email", textEditingController[0]),
            vSizedBox1,
            CustomTextField.stylishTextField(
                "Enter password", textEditingController[1]),
          ],
        ),
      ),
    );
  }

  static loginButton(
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
              "Login",
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

  static signupScreenText({required dynamic onPressed}) {
    return Center(
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
                color: KConstantColors.textColor,
                fontWeight: FontWeight.w700,
                fontFamily: KConstantFonts.Monteserrat),
          ),
          TextSpan(
            text: "Signup",
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

  static skipAuthentication() {
    return Center(
        child: TextButton(
      onPressed: () {},
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
