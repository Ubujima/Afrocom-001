import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/elements/app_button_black.dart';
import 'package:newuiproject/presentation/elements/app_button_blue.dart';
import 'package:newuiproject/presentation/views/connection_options.dart';

class OnBoardingScreens extends StatelessWidget {
  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => HomePage()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Booster.screenHeight(context),
            width: Booster.screenWidth(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/splash_screen.png',
                    ),
                    fit: BoxFit.fill)),
            child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return _buildPage1(context);
                  } else if (i == 1) {
                    return _buildPage2(context);
                  } else if (i == 2) {
                    return _buildPage3(context);
                  } else if (i == 3) {
                    return _buildPage4(context);
                  } else {
                    return _buildPage5(context);
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo1.png',
                  height: 160,
                  width: 160,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Booster.verticalSpace(56),
                AppLightButton(
                  text: "Connect To Interact",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnectionOptions()));
                  },
                ),
                Booster.verticalSpace(14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: AppDarkButton(
                    text: "Connect As A Guest",
                    onTap: () {},
                  ),
                ),
                Booster.verticalSpace(46),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildPage1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Booster.verticalSpace(205),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onB1.png',
              height: 160,
              width: 160,
            ),
          ],
        ),
        Booster.verticalSpace(45),
        Booster.dynamicFontSize(
            label: 'Consciousness & \nCommunity',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xff4B0082)),
        Booster.verticalSpace(94),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loader_1.png',
              color: Colors.black,
              height: 8,
            ),
          ],
        ),
      ],
    );
  }

  _buildPage2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Booster.verticalSpace(205),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onB2.png',
              height: 160,
              width: 160,
            ),
          ],
        ),
        Booster.verticalSpace(45),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Booster.dynamicFontSize(
              label: 'A Global Afro-Community',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xff0CA00C),
              isAlignCenter: true),
        ),
        Booster.verticalSpace(94),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loader_2.png',
              color: Colors.black,
              height: 8,
            ),
          ],
        ),
      ],
    );
  }

  _buildPage3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Booster.verticalSpace(205),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onB3.png',
              height: 160,
              width: 160,
            ),
          ],
        ),
        Booster.verticalSpace(45),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Booster.dynamicFontSize(
              label: 'Collaborate on projects and access funding',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xff0000FF),
              isAlignCenter: true),
        ),
        Booster.verticalSpace(94),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loader_3.png',
              color: Colors.black,
              height: 8,
            ),
          ],
        ),
      ],
    );
  }
}

_buildPage4(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Booster.verticalSpace(205),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/onB4.png',
            height: 160,
            width: 160,
          ),
        ],
      ),
      Booster.verticalSpace(45),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Booster.dynamicFontSize(
          label: 'Collaborate on projects and access funding',
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: Color(0xffF4FC14),
        ),
      ),
      Booster.verticalSpace(94),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loader_4.png',
            color: Colors.black,
            height: 8,
          ),
        ],
      ),
    ],
  );
}

_buildPage5(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Booster.verticalSpace(205),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/onB5.png',
            height: 160,
            width: 160,
          ),
        ],
      ),
      Booster.verticalSpace(45),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Booster.dynamicFontSize(
          label: 'Collaborate on projects and access funding',
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: Color(0xffFF1C1C),
        ),
      ),
      Booster.verticalSpace(94),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loader_5.png',
            color: Colors.black,
            height: 8,
          ),
        ],
      ),
    ],
  );
}
