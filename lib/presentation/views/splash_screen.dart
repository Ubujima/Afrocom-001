import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> logoList = [
    'assets/images/logo.png',
    'assets/images/onB1.png',
    'assets/images/onB2.png',
    'assets/images/onB3.png',
    'assets/images/onB4.png',
    'assets/images/onB5.png',
  ];

  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoardingScreens()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 666), () {
      if (index < 6) {
        index++;
        setState(() {});
      }
    });
    print(index);
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: Booster.screenHeight(context),
        width: Booster.screenWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/splash_screen.png'))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 32,
                    width: 154,
                  ),
                ],
              ),
            ),
            Booster.verticalSpace(138),
            Image.asset(
              logoList[index],
              height: 187,
              width: 186.55,
            ),
            Booster.verticalSpace(62),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Afrocom',
                    speed: Duration(milliseconds: 100),
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff010101),
                    )),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Afrocentric & Afrothentic',
                    speed: Duration(milliseconds: 100),
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff010101),
                    )),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
            Booster.verticalSpace(100),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Booster.dynamicFontSize(
                label:
                    '“I am not African because I was born in Africa but because Africa was born in me.”',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff010101),
                isAlignCenter: true,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
