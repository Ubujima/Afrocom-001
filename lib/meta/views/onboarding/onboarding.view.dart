import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
    List<String> images = [
      ImageTags.Onboarding1,
      ImageTags.Onboarding2,
      ImageTags.Onboarding3,
      ImageTags.Onboarding4,
      ImageTags.Onboarding5,
    ];
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      iconData: null,
                      tag: "Connect to Interact",
                      buttonColor: Colors.greenAccent,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginRoute);
                      },
                      width: 300),
                  vSizedBox1,
                  CustomButton(
                      iconData: null,
                      tag: "Connect As a Guest",
                      buttonColor: KConstantColors.darkColor,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeRoute);
                      },
                      width: 300),
                  vSizedBox2
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
            );
          }),
    );
  }
}
