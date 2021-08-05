import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginWidgets {
  static Container appLogo() {
    return Container(
      color: KConstantColors.whiteColor,
      height: 100,
      width: 100,
      child: Image.asset(ImageTags.AppLogo),
    );
  }

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

  static thirdPartyLogin() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
              iconData: EvaIcons.google,
              tag: "Google",
              buttonColor: Colors.redAccent,
              height: 50,
              onPressed: () {},
              width: 120),
          CustomButton(
              iconData: EvaIcons.facebook,
              tag: "Facebook",
              buttonColor: Colors.blueAccent,
              height: 50,
              onPressed: () {},
              width: 110),
        ],
      ),
    );
  }

  static signUpButton({required dynamic onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 200,
        child: Center(
          child: Text(
            "Signup",
            style: KConstantTextStyles.BHeading1(fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
            color: KConstantColors.darkColor,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  static signupScreenText({required dynamic onPressed}) {
    return Center(
      child: Column(
        children: [
          Text("Don't have an account?",
              style: TextStyle(
                  color: KConstantColors.textColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: KConstantFonts.Monteserrat)),
          vSizedBox1,
          signUpButton(onPressed: onPressed)
        ],
      ),
    );
  }

  static skipAuthentication({
    required BuildContext context,
  }) {
    final NavigationUtility navigationUtility = new NavigationUtility();
    return Center(
        child: TextButton(
      onPressed: () {
        navigationUtility.navigateTo(context, HomeRoute);
      },
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
