import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/views/when_mood_post_open.dart';

class PostDisplayWithMoodColorFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WhenMoosPostIsOpen()));
                  },
                  child: Column(
                    children: [
                      Booster.verticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            height: 366,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffEB4132), width: 2),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      _gettext1(
                                          text:
                                              'This is my first post on Afracom'),
                                    ],
                                  ),
                                ),
                                Booster.verticalSpace(18),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Image.asset(
                                    'assets/images/post_1.png',
                                    height: 197,
                                  ),
                                ),
                                Booster.verticalSpace(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                )
                              ],
                            )),
                      ),
                      Booster.verticalSpace(8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            height: 274,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff53C81B), width: 2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(children: [
                              Booster.verticalSpace(18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Image.asset(
                                        'assets/images/dp.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    Booster.horizontalSpace(7),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _gettext(text: 'Username'),
                                        Booster.verticalSpace(3),
                                        _gettext(text: 'City & Country'),
                                      ],
                                    ),
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Vector (6).png',
                                          width: 14,
                                          height: 18,
                                        ),
                                        Booster.horizontalSpace(15),
                                        Image.asset(
                                          'assets/images/Vector (7).png',
                                          width: 12,
                                          height: 6,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Booster.verticalSpace(24),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Booster.dynamicFontSize(
                                      label:
                                          'This is my second post in\ngreen\nmood. This time I am posting a text like we have in twitter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      lineHeight: 1.4,
                                      isAlignCenter: false)),
                              Booster.verticalSpace(25),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/heart_green.png',
                                          width: 20.9,
                                          height: 18.23,
                                        ),
                                        Image.asset(
                                          'assets/images/smile_green.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        Booster.horizontalSpace(3),
                                        _gettext(text: "10"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/chat_green.png',
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
                                          'assets/images/retweet_green.png',
                                          width: 28,
                                          height: 16,
                                        ),
                                        Booster.horizontalSpace(3),
                                        _gettext(text: "10"),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/images/location_green.png',
                                      width: 18,
                                      height: 22,
                                    ),
                                    Image.asset(
                                      'assets/images/share_green.png',
                                      width: 18,
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ])),
                      )
                    ],
                  ),
                );
              })),
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
  );
}
