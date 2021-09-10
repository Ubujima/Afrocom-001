import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/views/mood_tap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                        Row(
                          children: [
                            Booster.dynamicFontSize(
                                label: "Akua Addo Agyeman",
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            Booster.horizontalSpace(6),
                            Image.asset(
                              'assets/images/info.png',
                              height: 25,
                              width: 25,
                            ),
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
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/info.png',
                                  height: 25,
                                  width: 25,
                                ),
                                Booster.horizontalSpace(10),
                                Image.asset(
                                  'assets/images/mail.png',
                                  height: 25,
                                  width: 25,
                                ),
                                Booster.horizontalSpace(10),
                                Image.asset(
                                  //
                                  'assets/images/add.png',
                                  height: 25,
                                  width: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Booster.verticalSpace(10),
                        Card(
                          elevation: 5,
                          child: Container(
                            height: 62,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Booster.dynamicFontSize(
                                        label: "78",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    Booster.dynamicFontSize(
                                        label: "Community",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Booster.dynamicFontSize(
                                        label: "178",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    Booster.dynamicFontSize(
                                        label: "Followers",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Booster.dynamicFontSize(
                                        label: "718",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    Booster.dynamicFontSize(
                                        label: "Following",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
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
                    Booster.dynamicFontSize(
                        label: "User Info",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Booster.verticalSpace(24),
                    Card(
                        child: Column(
                      children: [
                        _getCardWidget(text1: "Username", text2: "Arif Khan"),
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
                        _getCardWidget(
                            text1: "Passions & hobbies & likes",
                            text2: "https://www.dribbble.com\nwww.google.com"),
                      ],
                    )),
                    Booster.verticalSpace(30),
                    Booster.dynamicFontSize(
                        label: "Shared",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Booster.verticalSpace(24),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Booster.dynamicFontSize(
                                  label: "Mood",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              Booster.verticalSpace(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodTabs()));
                                    },
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/post_1.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodTabs()));
                                    },
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/post_1.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                              Booster.verticalSpace(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodTabs()));
                                    },
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/post_1.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodTabs()));
                                    },
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/post_1.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                              Booster.verticalSpace(10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Booster.verticalSpace(16),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Booster.dynamicFontSize(
                                  label: "Events",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              Booster.verticalSpace(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post_1.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post_1.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                              Booster.verticalSpace(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post_1.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post_1.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                              Booster.verticalSpace(10),
                            ],
                          ),
                        ),
                      ),
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
