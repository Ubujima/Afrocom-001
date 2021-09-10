import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhenMoosPostIsOpen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEB4132), width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Booster.verticalSpace(18),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/images/dp.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Booster.horizontalSpace(7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _gettext1(text: 'Username'),
                            Booster.verticalSpace(3),
                            _gettext1(text: 'City & Country'),
                          ],
                        ),
                      ],
                    ),
                    Booster.verticalSpace(23),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _gettext1(text: 'This is my first post on Afracom'),
                        ],
                      ),
                    ),
                    Booster.verticalSpace(18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/post_1.png',
                        height: 197,
                      ),
                    ),
                    Booster.verticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/heart_red.png',
                                width: 20.9,
                                height: 18.23,
                              ),
                              Image.asset(
                                'assets/images/smile_red.png',
                                width: 20,
                                height: 20,
                              ),
                              Booster.horizontalSpace(3),
                              Booster.dynamicFontSize(
                                label: '10',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/chat_red.png',
                                width: 18,
                                height: 18,
                              ),
                              Booster.horizontalSpace(3),
                              _gettext(text: "10"),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/retweet_red.png',
                                width: 28,
                                height: 16,
                              ),
                              Booster.horizontalSpace(3),
                              _gettext(text: "10"),
                            ],
                          ),
                          Image.asset(
                            'assets/images/location_red.png',
                            width: 18,
                            height: 22,
                          ),
                          Image.asset(
                            'assets/images/share_red.png',
                            width: 18,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Booster.verticalSpace(15),
                    Divider(
                      thickness: 2,
                      color: Color(0xffF2F2F2),
                    ),
                    Booster.verticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/dp.png',
                                width: 37,
                                height: 37,
                              ),
                              Booster.horizontalSpace(7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Booster.dynamicFontSize(
                                      label: 'Username',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  Booster.verticalSpace(3),
                                  Row(
                                    children: [
                                      Booster.dynamicFontSize(
                                          label: 'replying to',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                      Booster.horizontalSpace(3),
                                      Booster.dynamicFontSize(
                                          label: 'michel jorden',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Booster.dynamicFontSize(
                              label: '19 aug',
                              fontSize: 12,
                              fontWeight: FontWeight.w300)
                        ],
                      ),
                    ),
                    Booster.verticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, right: 15),
                      child: _gettext3(
                          text:
                              'This is my second post in green mood. This time I am posting a text like we have in twitter.'),
                    ),
                    Booster.verticalSpace(17),
                    Padding(
                      padding: const EdgeInsets.only(left: 79, right: 36.72),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/hearth_red_empty.png',
                            width: 20.9,
                            height: 18.23,
                          ),
                          Image.asset(
                            'assets/images/chat_red.png',
                            width: 18,
                            height: 18,
                          ),
                          Image.asset(
                            'assets/images/retweet_red.png',
                            width: 28,
                            height: 16,
                          ),
                          Image.asset(
                            'assets/images/share_red.png',
                            width: 18,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Booster.verticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/dp.png',
                                width: 37,
                                height: 37,
                              ),
                              Booster.horizontalSpace(7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Booster.dynamicFontSize(
                                      label: 'Username',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  Booster.verticalSpace(3),
                                  Row(
                                    children: [
                                      Booster.dynamicFontSize(
                                          label: 'replying to',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                      Booster.horizontalSpace(3),
                                      Booster.dynamicFontSize(
                                          label: 'michel jorden',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Booster.dynamicFontSize(
                              label: '19 aug',
                              fontSize: 12,
                              fontWeight: FontWeight.w300)
                        ],
                      ),
                    ),
                    Booster.verticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, right: 15),
                      child: _gettext3(
                          text:
                              'This is my second post in green mood. This time I am posting a text like we have in twitter.'),
                    ),
                    Booster.verticalSpace(17),
                    Padding(
                      padding: const EdgeInsets.only(left: 79, right: 36.72),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/hearth_red_empty.png',
                            width: 20.9,
                            height: 18.23,
                          ),
                          Image.asset(
                            'assets/images/chat_red.png',
                            width: 18,
                            height: 18,
                          ),
                          Image.asset(
                            'assets/images/retweet_red.png',
                            width: 28,
                            height: 16,
                          ),
                          Image.asset(
                            'assets/images/share_red.png',
                            width: 18,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Booster.verticalSpace(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_gettext({
  required text,
}) {
  return Booster.dynamicFontSize(
    label: text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

_gettext1({
  required String text,
}) {
  return Booster.dynamicFontSize(
      label: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      isAlignCenter: false);
}

_gettext2({
  required String text,
}) {
  return Booster.dynamicFontSize(
    label: text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
  );
}

_gettext3({
  required String text,
}) {
  return Booster.dynamicFontSize(
      label: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      isAlignCenter: false,
      lineHeight: 1.3);
}
