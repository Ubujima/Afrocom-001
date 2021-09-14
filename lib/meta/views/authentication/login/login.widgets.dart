import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      {required BuildContext context,
      required List<TextEditingController> textEditingController}) {
    return Container(
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField.stylishTextField(
                0.9, context, "Enter email", textEditingController[0]),
            vSizedBox1,
            CustomTextField.stylishTextField(
                0.9, context, "Enter password", textEditingController[1]),
          ],
        ),
      ),
    );
  }

  static loginButton(
      {required BuildContext context, required dynamic onPressed}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: SizeConfig.setWidth(context: context, factor: 0.85),
          height: SizeConfig.setHeight(context: context, factor: 0.06),
          decoration: BoxDecoration(
              color: settingNotifier(true).currentColorTheme,
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: KConstantColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: KConstantFonts.MonteserratB),
            ),
          ),
        ),
      ),
    );
  }

  static thirdPartyLogin({required BuildContext context}) {
    final _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
              iconData: EvaIcons.google,
              tag: "Google",
              buttonColor: Colors.redAccent,
              height: 50,
              onPressed: () async {
                await _authenticationNotifier.loginWithGoogle(context: context);
              },
              width: 120),
          CustomButton(
              iconData: EvaIcons.facebook,
              tag: "Facebook",
              buttonColor: Colors.blueAccent,
              height: 50,
              onPressed: () async {
                await _authenticationNotifier.loginWithFacebook(
                    context: context);
              },
              width: 110),
        ],
      ),
    );
  }

  static signUpButton(
      {required BuildContext context, required dynamic onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: SizeConfig.setHeight(context: context, factor: 0.06),
        width: SizeConfig.setWidth(context: context, factor: 0.85),
        child: Center(
          child: Text(
            "Create New Account",
            style: KConstantTextStyles.BHeading1(fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
            color: KConstantColors.bgColorFaint.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
