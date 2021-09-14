import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/elements/app_button_black.dart';
import 'package:newuiproject/presentation/elements/app_button_red.dart';
import 'package:newuiproject/presentation/views/create_account.dart';
import 'package:newuiproject/presentation/views/forgot_passward.dart';
import 'package:newuiproject/presentation/views/home_page.dart';

class ConnectionOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Booster.verticalSpace(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 140,
                    width: 140,
                  ),
                ],
              ),
              Booster.verticalSpace(112),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "User name or Emial",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              AppLightButton(
                text: "Login",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageView()));
                },
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.only(right: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Booster.dynamicFontSize(
                          label: 'Forgot Password?',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Booster.verticalSpace(34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButtonRed(
                        text: "Google",
                        onTap: () {},
                      ),
                    ),
                    Booster.horizontalSpace(9),
                    Expanded(
                      child: Container(
                        width: Booster.screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xff306AFF)),
                        child: Booster.paddedWidget(
                            top: 17,
                            bottom: 15,
                            child: Booster.dynamicFontSize(
                                label: "Facebook",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccount()));
                  },
                  child: Container(
                    width: Booster.screenWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black),
                    child: Booster.paddedWidget(
                        top: 17,
                        bottom: 15,
                        child: Booster.dynamicFontSize(
                            label: "Create Account",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
              Booster.verticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}
