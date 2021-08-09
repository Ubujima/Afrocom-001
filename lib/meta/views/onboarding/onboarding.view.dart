import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:flutter/material.dart';

import 'components/onboarding_buttons.component.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void didChangeDependencies() {
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KConstantColors.darkColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vSizedBox4,
              Container(
                  color: KConstantColors.whiteColor,
                  height: SizeConfig.setHeight(context: context, factor: 0.25),
                  width: SizeConfig.setWidth(context: context, factor: 0.5),
                  child: Image.asset(ImageTags.AppLogo)),
              vSizedBox1,
              Text("Afrocom",
                  style: KConstantTextStyles.BHeading1(
                      fontSize: SizeConfig.titleSize!)),
              Text("Afrocentric & Afrothentic",
                  style: KConstantTextStyles.MBody1(
                      fontSize: SizeConfig.mFontSize!)),
              SizeConfig.verticalSizedBox(context: context, factor: 0.3),
              OnBoardingButton(
                  buttonTitle: "Connect to Interact",
                  onPressed: () {
                    NavigationUtility().navigateTo(context, LoginRoute);
                  }),
              vSizedBox2,
              OnBoardingButton(
                  buttonTitle: "Continue as a Guest", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
