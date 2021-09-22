import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/colorProvider.dart';
import 'package:newuiproject/helper.dart';
import 'package:newuiproject/presentation/elements/auth_text_field.dart';
import 'package:newuiproject/presentation/views/blog_posting_form.dart';
import 'package:newuiproject/presentation/views/event_posting_form.dart';
import 'package:newuiproject/presentation/views/job_posting_form.dart';
import 'package:newuiproject/presentation/views/market_place_post_form.dart';
import 'package:newuiproject/presentation/views/place_posting_form.dart';
import 'package:newuiproject/presentation/views/post_display_with_mood_color_feature.dart';
import 'package:newuiproject/presentation/views/profile_map.dart';
import 'package:newuiproject/presentation/views/profile_screen.dart';
import 'package:newuiproject/presentation/views/project_campaign_post_form.dart';
import 'package:provider/provider.dart';

import '../../helper.dart';
import 'home_page.dart';
import 'mood_post.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<SelectedColor> colorList = [
    SelectedColor(id: "B", color: Color(0xff000000)),
    SelectedColor(id: "Y", color: Color(0xffF4FC14)),
    SelectedColor(id: "BL", color: Color(0xff0000FF)),
    SelectedColor(id: "R", color: Color(0xffFF1C1C)),
    SelectedColor(id: "O", color: Color(0xffFF8C00)),
    // SelectedColor(id: "W", color: Color(0xffffffff)),
    SelectedColor(id: "G", color: Color(0xff0CA00C)),
    SelectedColor(id: "PN", color: Color(0xffEE82EE)),
    SelectedColor(id: "PU", color: Color(0xffA92DDB)),
  ];

  bool showLeftBar = false;
  bool showRightBar = false;
  bool showFab = false;
  bool showLocation = false;
  bool showBottomSheet = false;
  bool showFilter = false;
  List<int> selectedIndex = [];

  List<Filter> filterList = [
    Filter("People", ["Female", "Male"]),
    Filter("Mood", ["Value 1", "Value 2"]),
    Filter("Projects", ["Value 1", "Value 2"]),
    Filter("Blog", ["Value 1", "Value 2"]),
    Filter("Marketplace", ["Value 1", "Value 2"]),
    Filter("Places", ["Value 1", "Value 2"]),
    Filter("Jobs", ["Value 1", "Value 2"]),
    Filter("Events", ["Value 1", "Value 2"]),
  ];

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    return GestureDetector(
      onTap: () {
        if (showLeftBar == true) {
          showLeftBar = false;
          setState(() {});
        }
        if (showRightBar == true) {
          showRightBar = false;
          setState(() {});
        }
        showBottomSheet = false;
        showFab = false;

        setState(() {});
      },
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              floatingActionButton: InkWell(
                onTap: () {
                  showFab = !showFab;
                  setState(() {});
                },
                child: showBottomSheet
                    ? Container(
                        height: 1,
                        width: 1,
                      )
                    : showRightBar
                        ? Container(
                            height: 1,
                            width: 1,
                          )
                        : !showFab
                            ? ColorsConfig.getFab(context)
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 80.0, right: 10),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/fab.png',
                                      height: 56,
                                    ),
                                    Positioned.fill(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PostDisplayWithMoodColorFeature()));
                                              if (showLeftBar == true) {
                                                showLeftBar = false;
                                                setState(() {});
                                              }
                                              if (showRightBar == true) {
                                                showRightBar = false;
                                                setState(() {});
                                              }
                                              showBottomSheet = false;
                                              showFab = false;
                                              setState(() {});
                                            },
                                            child: Image.asset(
                                              'assets/images/world.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PostDisplayWithMoodColorFeature()));
                                              showLocation = true;
                                              setState(() {});
                                            },
                                            child: Image.asset(
                                              'assets/images/wifi.png',
                                              height: 24,
                                              width: 24,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileMapView()));
                                            },
                                            child: Image.asset(
                                              'assets/images/roundPr.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (showBottomSheet == false) {
                                                showBottomSheet = true;
                                                showFab = false;
                                                setState(() {});
                                              }
                                            },
                                            child: Image.asset(
                                              'assets/images/target.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                          Booster.horizontalSpace(30),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
              ),
              body: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Booster.verticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (showLeftBar == false)
                                  ColorsConfig.getLogo(context),
                                if (showLeftBar == true)
                                  Container(
                                    height: 36,
                                    width: 36,
                                  ),
                                Booster.horizontalSpace(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 190,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Booster.horizontalSpace(10),
                                          Booster.dynamicFontSize(
                                              label: "Search Afrocom",
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorsConfig.getColor(context)
                                              .withOpacity(0.75),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                  ],
                                ),
                                Booster.horizontalSpace(10),
                                showRightBar
                                    ? Container(
                                        height: 36,
                                        width: 36,
                                      )
                                    : InkWell(
                                        onTap: () {
                                          showRightBar = !showRightBar;
                                          setState(() {});
                                        },
                                        child: ColorsConfig.getDpMark(context),
                                      ),
                              ],
                            ),
                            Booster.verticalSpace(20),
                            Icon(Icons.arrow_back),
                            Booster.verticalSpace(10),
                            Booster.dynamicFontSize(
                                label: "Account Setting",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Booster.verticalSpace(17),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'First Name',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Image.asset(
                                          'assets/images/edit.png',
                                          height: 20,
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Last Name',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Image.asset(
                                          'assets/images/edit.png',
                                          height: 20,
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Username',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Image.asset(
                                          'assets/images/edit.png',
                                          height: 20,
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D000000),
                              child: AuthTextField(
                                label: "example@gmail.com",
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'English',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_sharp)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D000000),
                              child: AuthTextField(
                                label: "11 Sep 1989",
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D000000),
                              child: AuthTextField(
                                label: "Female",
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D000000),
                              child: AuthTextField(
                                label: "Change Password",
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Suspend account',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff306AFF),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Delete account',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffEB4132),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Booster.verticalSpace(44),
                            Booster.dynamicFontSize(
                                label: "Location Share",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Booster.verticalSpace(16),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Root',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Transform.scale(
                                            scale: 0.7,
                                            child: CupertinoSwitch(
                                                value: true,
                                                onChanged: (val) {})),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Booster.dynamicFontSize(
                                          label: 'Current Location',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A7878),
                                        ),
                                        Transform.scale(
                                            scale: 0.7,
                                            child: CupertinoSwitch(
                                                value: true,
                                                onChanged: (val) {})),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Booster.verticalSpace(44),
                            Booster.dynamicFontSize(
                                label: "Theme or Appearance",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Booster.verticalSpace(10),
                            Card(
                              elevation: 6,
                              shadowColor: Color(0x4D7A7878),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Booster.dynamicFontSize(
                                        label: 'Choose color for main icon',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff7A7878),
                                      ),
                                      Booster.verticalSpace(19),
                                      Container(
                                        height: 38,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: colorList.length,
                                            itemBuilder: (context, i) {
                                              return InkWell(
                                                onTap: () {
                                                  color.saveColor(
                                                      colorList[i].id);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: color.getColor() ==
                                                                    colorList[i]
                                                                        .id
                                                                ? Colors.black
                                                                : Colors
                                                                    .transparent),
                                                        shape: BoxShape.circle,
                                                        color:
                                                            colorList[i].color),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      Booster.verticalSpace(15)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Booster.verticalSpace(44),
                            Booster.dynamicFontSize(
                                label: "Privacy",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Booster.verticalSpace(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'Public Profile',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'Private',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Booster.verticalSpace(44),
                            Booster.dynamicFontSize(
                                label: "Privacy",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            Booster.verticalSpace(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'Facebook',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'Twitter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'Github',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'IG',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 6,
                                shadowColor: Color(0x4D7A7878),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Booster.dynamicFontSize(
                                            label: 'LinkedIn',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7A7878),
                                          ),
                                          Transform.scale(
                                              scale: 0.7,
                                              child: CupertinoSwitch(
                                                  value: true,
                                                  onChanged: (val) {})),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Booster.verticalSpace(20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (showRightBar)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 74,
                        decoration: BoxDecoration(
                          color: Color(0xcc000000),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen()));
                                },
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  height: 27,
                                  width: 27,
                                ),
                              ),
                              Image.asset(
                                'assets/images/notifi.png',
                                height: 27,
                                width: 27,
                              ),
                              Image.asset(
                                'assets/images/mail.png',
                                height: 27,
                                width: 27,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostDisplayWithMoodColorFeature()));
                                },
                                child: Image.asset(
                                  'assets/images/wifi.png',
                                  height: 27,
                                  width: 27,
                                ),
                              ),
                              Image.asset(
                                'assets/images/group.png',
                                height: 27,
                                width: 27,
                              ),
                              Image.asset(
                                'assets/images/heart.png',
                                height: 27,
                                width: 27,
                              ),
                              Booster.verticalSpace(1),
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                              Image.asset(
                                'assets/images/em1.png',
                                height: 28,
                                width: 28,
                              ),
                              Image.asset(
                                'assets/images/em2.png',
                                height: 28,
                                width: 28,
                              ),
                              Image.asset(
                                'assets/images/em3.png',
                                height: 28,
                                width: 28,
                              ),
                              Image.asset(
                                'assets/images/em4.png',
                                height: 28,
                                width: 28,
                              ),
                              Image.asset(
                                'assets/images/em5.png',
                                height: 28,
                                width: 28,
                              ),
                              Booster.verticalSpace(20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (showLeftBar)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 74,
                      decoration: BoxDecoration(
                        color: Color(0xcc000000),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/logo2.png',
                              height: 27,
                              width: 27,
                            ),
                            Image.asset(
                              'assets/images/book.png',
                              height: 27,
                              width: 27,
                            ),
                            Image.asset(
                              'assets/images/case.png',
                              height: 27,
                              width: 27,
                            ),
                            Image.asset(
                              'assets/images/play.png',
                              height: 27,
                              width: 27,
                            ),
                            Image.asset(
                              'assets/images/bag.png',
                              height: 27,
                              width: 27,
                            ),
                            Image.asset(
                              'assets/images/share.png',
                              height: 27,
                              width: 27,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingScreen()));
                              },
                              child: Image.asset(
                                'assets/images/setting.png',
                                height: 27,
                                width: 27,
                              ),
                            ),
                            Booster.verticalSpace(20),
                          ],
                        ),
                      ),
                    ),
                  if (!showRightBar)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 74,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                showFilter = true;
                                setState(() {});
                              },
                              child: ColorsConfig.getFilter(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!showLeftBar)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 74,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onHorizontalDragStart: (val) {
                                showLeftBar = true;
                                setState(() {});
                              },
                              child: Image.asset(
                                'assets/images/slider.png',
                                height: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (showBottomSheet)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Booster.verticalSpace(15),
                            Container(
                              width: 100,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Booster.verticalSpace(30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodPost()));
                                    },
                                    child: _getBoxes(
                                        text: "Moments",
                                        image: 'assets/images/1.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BlogPostingForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Article",
                                        image: 'assets/images/2.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProjectCampaignPostForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Campaign",
                                        image: 'assets/images/3.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlacePostingForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Places",
                                        image: 'assets/images/4.png'),
                                  ),
                                ],
                              ),
                            ),
                            Booster.verticalSpace(30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MarketPlacePostForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Market",
                                        image: 'assets/images/5.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EventPostingForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Event",
                                        image: 'assets/images/6.png'),
                                  ),
                                  _getBoxes(
                                      text: "Live",
                                      image: 'assets/images/7.png'),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JobPostingForm()));
                                    },
                                    child: _getBoxes(
                                        text: "Job",
                                        image: 'assets/images/8.png'),
                                  ),
                                ],
                              ),
                            ),
                            Booster.verticalSpace(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: Booster.screenWidth(context) * 0.65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xff306AFF),
                                        ),
                                        color: Color(0xff221F3B)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showBottomSheet = false;
                                      setState(() {});
                                    },
                                    child: Image.asset(
                                      'assets/images/rotate.png',
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (showLocation)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 430.34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                            child: Image.asset(
                              'assets/images/bgDp.png',
                              height: 350,
                              width: Booster.screenWidth(context),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned.fill(
                              top: 20,
                              right: 20,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                    Booster.horizontalSpace(10),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => EditProfileScreen()));
                                      },
                                      child: Image.asset(
                                        //
                                        'assets/images/reload.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    Booster.horizontalSpace(10),
                                    Image.asset(
                                      //
                                      'assets/images/heart_red.png',
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Booster.verticalSpace(200),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfileScreen()));
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                'assets/images/info.png',
                                                height: 25,
                                                width: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Booster.verticalSpace(10),
                                  Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                        ),
                                        margin: EdgeInsets.zero,
                                        elevation: 0,
                                        child: Container(
                                          height: 62,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Booster.dynamicFontSize(
                                                      label: "78",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  Booster.dynamicFontSize(
                                                      label: "Community",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Booster.dynamicFontSize(
                                                      label: "178",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  Booster.dynamicFontSize(
                                                      label: "Followers",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Booster.dynamicFontSize(
                                                      label: "718",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  Booster.dynamicFontSize(
                                                      label: "Following",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 35,
                                        left:
                                            Booster.screenWidth(context) * 0.44,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showLocation = false;
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  'assets/images/location_cross.png',
                                                  height: 52,
                                                  width: 52,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (showFilter)
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      height: Booster.screenHeight(context),
                      width: Booster.screenWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100.0),
                        child: Container(
                          height: Booster.screenHeight(context),
                          width: Booster.screenWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(57),
                            color: Colors.black,
                          ),
                          child: Column(
                            children: [
                              Booster.verticalSpace(40),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Booster.screenWidth(context) * 0.23,
                                      right:
                                          Booster.screenWidth(context) * 0.23),
                                  child: Container(
                                    height: Booster.screenHeight(context),
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: filterList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: ExpansionTile(
                                                    expandedAlignment:
                                                        Alignment.topLeft,
                                                    expandedCrossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    iconColor: Colors.white,
                                                    onExpansionChanged: (val) {
                                                      selectedIndex.add(index);
                                                      setState(() {});
                                                    },
                                                    title: Row(
                                                      children: [
                                                        !selectedIndex
                                                                .contains(index)
                                                            ? Icon(
                                                                Icons
                                                                    .radio_button_off,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .radio_button_checked,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                        Booster.horizontalSpace(
                                                            6),
                                                        Text(
                                                          filterList[index]
                                                              .label,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 48.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Booster
                                                                .horizontalSpace(
                                                                    6),
                                                            Text(
                                                              filterList[index]
                                                                  .value[0],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Booster.verticalSpace(3),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 48.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Booster
                                                                .horizontalSpace(
                                                                    6),
                                                            Text(
                                                              filterList[index]
                                                                  .value[1],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              showFilter = false;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 13.0),
                              child: Image.asset(
                                'assets/images/clear.png',
                                height: 36,
                                width: 36,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getBoxes({required String text, required String image}) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xff306AFF),
              ),
              color: Color(0xff221F3B)),
          child: Center(
            child: Booster.dynamicFontSize(
                label: text,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        Positioned.fill(
          top: -15,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              image,
              height: 44,
              width: 44,
            ),
          ),
        ),
      ],
    );
  }
}

class SelectedColor {
  final String id;
  final Color color;

  SelectedColor({required this.id, required this.color});
}
