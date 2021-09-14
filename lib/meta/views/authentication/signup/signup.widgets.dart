import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/signup/terms_and_conditions.component.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupWidgets {
  static Container appLogo({required BuildContext context}) {
    return Container(
      color: KConstantColors.whiteColor,
      height: SizeConfig.setHeight(context: context, factor: 0.1),
      width: SizeConfig.setWidth(context: context, factor: 0.3),
      child: Image.asset(ImageTags.AppLogo),
    );
  }

  static optionButton(
      {required BuildContext context,
      required dynamic onTap,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.setHeight(context: context, factor: 0.054),
        width: SizeConfig.setWidth(context: context, factor: 0.2),
        child: Center(
          child: Text(
            title,
            style: KConstantTextStyles.MBody1(fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KConstantColors.bgColorFaint,
        ),
      ),
    );
  }

  static Container signupSection(
      {required Map<String, TextEditingController> textEditingController,
      required BuildContext context}) {
    return Container(
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField.stylishTextField(0.9, context, "Enter username*",
                textEditingController['username']!),
            vSizedBox1,
            CustomTextField.stylishTextField(0.9, context, "Enter Email*",
                textEditingController['useremail']!),
            vSizedBox1,
            CustomTextField.stylishTextField(0.9, context, "Enter Password*",
                textEditingController['userpassword']!),
            vSizedBox1,
            CustomTextField.stylishTextField(0.9, context, "Confirm Password",
                textEditingController['userconfirmpasswordController']!),
            vSizedBox1,
          ],
        ),
      ),
    );
  }

  static termsAndConditions({required BuildContext context}) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Container(
      child: Row(
        children: [
          Checkbox(
              checkColor: KConstantColors.whiteColor,
              value: Provider.of<AuthenticationNotifier>(context, listen: true)
                  .checkedTandC,
              onChanged: (value) {
                authenticationNotifier.toggleTermsAndConditionCheck();
              }),
          TextButton(
              onPressed: () {
                showTermsAndConditions(context: context);
              },
              child: Text(
                "Terms and conditions",
                style: TextStyle(
                    fontFamily: KConstantFonts.PoppinsMedium,
                    color: KConstantColors.darkColor),
              ))
        ],
      ),
    );
  }

  static signupButton(
      {required BuildContext context, required dynamic onPressed}) {
    return Center(
      child: GestureDetector(
        onTap:
            onPressed, //authenticationNotifier.checkedTandC! ? onPressed : () {},
        child: Container(
          width: SizeConfig.setWidth(context: context, factor: 0.85),
          height: SizeConfig.setHeight(context: context, factor: 0.06),
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: KConstantFonts.MonteserratB),
            ),
          ),
        ),
      ),
    );
  }
}
