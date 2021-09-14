import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/elements/app_button_red_round.dart';
import 'package:newuiproject/presentation/elements/auth_text_field.dart';

class MoodPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Booster.verticalSpace(34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 6,
                      shadowColor: Color(0x4D000000),
                      child: AuthTextField(
                        label: "Post Text",
                      ),
                    ),
                  ),
                  Booster.verticalSpace(18),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffEFEFEF),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Booster.dynamicFontSize(
                          label: 'OR',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Booster.verticalSpace(18),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Booster.dynamicFontSize(
                        label: 'Post Media',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Booster.verticalSpace(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xffEFEFEF),
                            height: 45,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/photo.png',
                                    width: 18,
                                    height: 18,
                                  ),
                                  Booster.horizontalSpace(6),
                                  Booster.dynamicFontSize(
                                      label: 'Photo',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Booster.horizontalSpace(7),
                        Expanded(
                          child: Container(
                            color: Color(0xffEFEFEF),
                            height: 45,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/video.png',
                                      width: 22, height: 14),
                                  Booster.horizontalSpace(6),
                                  Booster.dynamicFontSize(
                                      label: 'Video',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Booster.horizontalSpace(7),
                        Expanded(
                          child: Container(
                            color: Color(0xffEFEFEF),
                            height: 45,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/file.png',
                                      width: 18.38, height: 19.49),
                                  Booster.horizontalSpace(6),
                                  Booster.dynamicFontSize(
                                      label: 'File',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Booster.verticalSpace(39),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Booster.dynamicFontSize(
                        label: 'Select Moment',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Booster.verticalSpace(18.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/reg_emoji.png',
                          height: 40.77,
                          width: 40.77,
                        ),
                        Image.asset(
                          'assets/images/yellow_emoji.png',
                          height: 40.77,
                          width: 40.77,
                        ),
                        Image.asset(
                          'assets/images/green_emoji.png',
                          height: 40.77,
                          width: 40.77,
                        ),
                        Image.asset(
                          'assets/images/purple_emoji.png',
                          height: 40.77,
                          width: 40.77,
                        ),
                        Image.asset(
                          'assets/images/blue_emoji.png',
                          height: 40.77,
                          width: 40.77,
                        ),
                      ],
                    ),
                  ),
                  Booster.verticalSpace(16.72),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Booster.dynamicFontSize(
                        label: 'Pin Location',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Booster.verticalSpace(12),
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 492,
                      child: Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButtonRedRound(
                      text: "Upload Post",
                      onTap: () {},
                    ),
                    Booster.verticalSpace(20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
