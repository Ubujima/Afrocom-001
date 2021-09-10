import 'dart:async';

import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/views/on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoardingScreens()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              'assets/images/logo.png',
              height: 187,
              width: 186.55,
            ),
            Booster.verticalSpace(62),
            Booster.dynamicFontSize(
                label: 'Afrocom\nAfrocentric & Afrothentic',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                isAlignCenter: true,
                color: Color(0xff010101),
                lineHeight: 1.2),
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
