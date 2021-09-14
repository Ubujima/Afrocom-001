import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Image.asset(
                'assets/images/bgDp.png',
                height: 400,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Booster.verticalSpace(280),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Booster.dynamicFontSize(
                                    label: "Akua Addo Agyeman",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                Booster.horizontalSpace(6),
                              ],
                            ),
                            Booster.dynamicFontSize(
                                label: "Mother & Nurse",
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            Booster.verticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 37,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/flag.png'))),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/upload.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Booster.verticalSpace(40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Booster.dynamicFontSize(
                                label: "User Info",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Image.asset(
                              'assets/images/edit.png',
                              height: 21,
                              width: 21,
                            ),
                          ],
                        ),
                        Booster.verticalSpace(24),
                        Card(
                            child: Column(
                          children: [
                            _getCardWidget(
                                text1: "Username", text2: "Arif Khan"),
                            _getCardWidget(
                                text1: "Rolel/Passion/Work in life",
                                text2: "UI/UX Designer"),
                            _getButtonWidget(
                              text1: "Rolel/Passion/Work in life",
                            ),
                            _getCardWidget(
                                text1: "Written Bio",
                                text2:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci justo et quisque neque habitant tincidunt. Aliquam lorem et arcu dui integer sollicitudin magnis. Nulla aliquam nullam laoreet scelerisque amet eleifend sed. "),
                            _getCardWidget(
                                text1: "Passions & hobbies & likes",
                                text2:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci justo et quisque neque habitant tincidunt. Aliquam lorem et arcu dui integer sollicitudin magnis. Nulla aliquam nullam laoreet scelerisque amet eleifend sed. "),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Booster.verticalSpace(18),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Booster.dynamicFontSize(
                                          label: "Passions & hobbies & likes",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff979797)),
                                    ],
                                  ),
                                ),
                                Booster.verticalSpace(12),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 13),
                                    child: Row(
                                      children: [
                                        _getTagContainer("Netflix"),
                                        _getTagContainer("Yoga"),
                                        _getTagContainer("Cooking"),
                                      ],
                                    )),
                                Booster.verticalSpace(10),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 13),
                                    child: Row(
                                      children: [
                                        _getTagContainer("Travel"),
                                        _getTagContainer("Grab a Drink"),
                                      ],
                                    )),
                                Booster.verticalSpace(12),
                                Divider(),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Booster.verticalSpace(18),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Booster.dynamicFontSize(
                                          label: "Linked Account",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff979797)),
                                    ],
                                  ),
                                ),
                                Booster.verticalSpace(12),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 13),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'assets/images/youtube.png',
                                          height: 43,
                                          width: 43,
                                        ),
                                        Image.asset(
                                          'assets/images/twitter.png',
                                          height: 43,
                                          width: 43,
                                        ),
                                        Image.asset(
                                          'assets/images/instagram.png',
                                          height: 43,
                                          width: 43,
                                        ),
                                        Image.asset(
                                          'assets/images/fb.png',
                                          height: 43,
                                          width: 43,
                                        ),
                                      ],
                                    )),
                                Booster.verticalSpace(12),
                                Divider(),
                              ],
                            )
                          ],
                        )),
                        Booster.verticalSpace(30),
                      ],
                    ),
                    Booster.verticalSpace(16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTagContainer(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 26,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Center(
            child: Booster.dynamicFontSize(
                label: text, fontSize: 12, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xffC2C2C2), borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  _getCardWidget({required String text1, required String text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Booster.verticalSpace(18),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 13),
          child: Booster.dynamicFontSize(
              label: text1,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff979797)),
        ),
        Booster.verticalSpace(7),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 13),
          child: Booster.dynamicFontSize(
              label: text2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              isAlignCenter: false,
              color: Colors.black),
        ),
        Booster.verticalSpace(12),
        Divider(),
      ],
    );
  }

  _getButtonWidget({required String text1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Booster.verticalSpace(18),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 13),
          child: Booster.dynamicFontSize(
              label: text1,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff979797)),
        ),
        Booster.verticalSpace(7),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 13),
          child: Row(
            children: [
              Container(
                width: 97,
                height: 41,
                child: Center(
                  child: Booster.dynamicFontSize(
                      label: "Root",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff306AFF),
                    borderRadius: BorderRadius.circular(6)),
              ),
              Booster.horizontalSpace(10),
              Container(
                width: 97,
                height: 41,
                child: Center(
                  child: Booster.dynamicFontSize(
                      label: "Current",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff53C81B),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ],
          ),
        ),
        Booster.verticalSpace(12),
        Divider(),
      ],
    );
  }
}
