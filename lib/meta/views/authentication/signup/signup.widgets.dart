import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/signup/terms_and_conditions.component.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            style: KConstantTextStyles.MBody1(fontSize: SizeConfig.sfontSize!),
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
    final utilityNotifier =
        Provider.of<UtilityNotifier>(context, listen: false);

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
            CustomTextField.stylishTextField(0.9, context, "Enter Password*",
                textEditingController['userpassword']!),
            vSizedBox1,
            CustomTextField.stylishTextField(0.9, context, "Confirm Password",
                textEditingController['userconfirmpasswordController']!),
            vSizedBox1,
            CustomTextField.stylishTextField(0.9, context, "Enter Email*",
                textEditingController['useremail']!),
            vSizedBox1,
            Container(
              width: SizeConfig.setWidth(context: context, factor: 0.9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField.stylishTextField(0.4, context,
                        "First Name*", textEditingController['userfirstname']!),
                    CustomTextField.stylishTextField(0.4, context, "Last Name*",
                        textEditingController['userlastname']!),
                  ]),
            ),
            vSizedBox2,
            Text("Optional",
                style: KConstantTextStyles.MBody1(
                    fontSize: SizeConfig.sfontSize!)),
            vSizedBox2,
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Column(
                    children: [
                      optionButton(
                          context: context,
                          onTap: () {
                            utilityNotifier.selectUserDOB(context);
                          },
                          title: "DOB"),
                      vSizedBox1,
                      Text(
                        Provider.of<UtilityNotifier>(context, listen: true)
                            .pickedUserDOB!
                            .toLocal()
                            .toString()
                            .split(" ")[0],
                        style: KConstantTextStyles.MBody1(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      optionButton(
                          context: context,
                          onTap: () {
                            utilityNotifier.selectUserSex(context: context);
                          },
                          title: "Sex"),
                      vSizedBox1,
                      Text(
                        Provider.of<UtilityNotifier>(context, listen: true)
                            .userSex,
                        style: KConstantTextStyles.MBody1(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      optionButton(
                          context: context,
                          onTap: () {
                            utilityNotifier.selectUserOrigin(context: context);
                          },
                          title: "Origin"),
                      vSizedBox1,
                      Text(
                        Provider.of<UtilityNotifier>(context, listen: true)
                            .userOrigin,
                        style: KConstantTextStyles.MBody1(fontSize: 16),
                      )
                    ],
                  )
                ]))
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
                style:
                    KConstantTextStyles.MBody1(fontSize: SizeConfig.sfontSize!),
              ))
        ],
      ),
    );
  }

  static signupButton(
      {required BuildContext context, required dynamic onPressed}) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Center(
      child: GestureDetector(
        onTap: authenticationNotifier.checkedTandC! ? onPressed : () {},
        child: Container(
          width: SizeConfig.setWidth(context: context, factor: 0.85),
          height: SizeConfig.setHeight(context: context, factor: 0.06),
          decoration: BoxDecoration(
              color: authenticationNotifier.checkedTandC!
                  ? Colors.white.withOpacity(1)
                  : KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "Create Account",
              style: TextStyle(
                  fontSize: SizeConfig.sfontSize,
                  fontWeight: FontWeight.w900,
                  fontFamily: KConstantFonts.MonteserratB),
            ),
          ),
        ),
      ),
    );
  }
}
