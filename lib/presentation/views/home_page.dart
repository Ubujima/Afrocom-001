import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/elements/app_button_blue_short.dart';
import 'package:newuiproject/presentation/elements/app_button_green_short.dart';
import 'package:newuiproject/presentation/elements/app_button_red_round_1.dart';
import 'package:newuiproject/presentation/views/blog_posting_form.dart';
import 'package:newuiproject/presentation/views/event_posting_form.dart';
import 'package:newuiproject/presentation/views/job_posting_form.dart';
import 'package:newuiproject/presentation/views/place_posting_form.dart';
import 'package:newuiproject/presentation/views/post_display_with_mood_color_feature.dart';
import 'package:newuiproject/presentation/views/profile_screen.dart';
import 'package:newuiproject/presentation/views/project_campaign_post_form.dart';
import 'package:newuiproject/presentation/views/setting_screen.dart';

import 'mood_post.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
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
        showLocation = false;
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
                            ? Image.asset(
                                'assets/images/roundFab.png',
                                height: 38,
                                width: 38,
                              )
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
                                              showLocation = true;
                                              setState(() {});
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
              body: Container(
                height: Booster.screenHeight(context),
                width: Booster.screenWidth(context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bgImage.png'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
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
                                          builder: (context) =>
                                              SettingScreen()));
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
                                child: Image.asset(
                                  'assets/images/center.png',
                                  height: 36,
                                  width: 3368,
                                ),
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
                                  height: 204,
                                  width: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Column(
                      children: [
                        Booster.verticalSpace(40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (showLeftBar == false)
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 36,
                                  width: 36,
                                ),
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
                                    child: Center(
                                      child: Booster.dynamicFontSize(
                                          label: "Search Afracom",
                                          fontSize: 14),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffE9E9E9),
                                      border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black),
                                      ),
                                    ),
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
                                      child: Image.asset(
                                        'assets/images/dpMark.png',
                                        height: 39,
                                        width: 39,
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
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
                                          text: "Mood",
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _getBoxes(
                                        text: "Market",
                                        image: 'assets/images/5.png'),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width:
                                          Booster.screenWidth(context) * 0.65,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
            ),
            if (showLocation)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 405.34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      Booster.verticalSpace(19.34),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtonGreenShort(
                              text: "Add",
                              onTap: () {},
                            ),
                            Image.asset(
                              'assets/images/dp1.png',
                              height: 78,
                              width: 78,
                            ),
                            AppButtonBlueShort(
                              text: "Follow",
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Booster.verticalSpace(20),
                      Booster.dynamicFontSize(
                        label: 'Micheal Jordon',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      Booster.verticalSpace(10),
                      Booster.dynamicFontSize(
                        label: '24M',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      Booster.verticalSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Booster.dynamicFontSize(
                            label: '2.5 miles',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Booster.verticalSpace(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Booster.dynamicFontSize(
                                  label: '450',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                Booster.verticalSpace(7),
                                Booster.dynamicFontSize(
                                  label: 'Friends',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Booster.dynamicFontSize(
                                  label: '15',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                Booster.verticalSpace(7),
                                Booster.dynamicFontSize(
                                  label: 'Followers',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Booster.dynamicFontSize(
                                  label: '300',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                Booster.verticalSpace(7),
                                Booster.dynamicFontSize(
                                  label: 'Following',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Booster.verticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 63),
                        child: Booster.dynamicFontSize(
                            label:
                                'Lorem Ipsum is simply a dummy text of  the printing and tyresetting industry.\nLorem Ipsum has been the inductry’s standard.',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            isAlignCenter: false,
                            lineHeight: 1.4),
                      ),
                      Booster.verticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtonRedRound1(
                              text: "Send Message",
                              onTap: () {},
                            ),
                            Image.asset(
                              'assets/images/Group 145.png',
                              height: 42,
                              width: 42,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (showFilter)
              Container(
                height: Booster.screenHeight(context),
                width: Booster.screenWidth(context),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  children: [
                    Booster.verticalSpace(40),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showFilter = false;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Booster.screenWidth(context) * 0.4),
                        child: Container(
                          height: Booster.screenHeight(context),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filterList.length,
                              itemBuilder: (context, index) {
                                return ExpansionTile(
                                  expandedAlignment: Alignment.topLeft,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  iconColor: Colors.white,
                                  onExpansionChanged: (val) {
                                    selectedIndex.add(index);
                                    setState(() {});
                                  },
                                  title: Row(
                                    children: [
                                      !selectedIndex.contains(index)
                                          ? Icon(
                                              Icons.radio_button_off,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.radio_button_checked,
                                              color: Colors.blue,
                                            ),
                                      Booster.horizontalSpace(6),
                                      Text(
                                        filterList[index].label,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 48.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.white,
                                          ),
                                          Booster.horizontalSpace(6),
                                          Text(
                                            filterList[index].value[0],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Booster.verticalSpace(3),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 48.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.white,
                                          ),
                                          Booster.horizontalSpace(6),
                                          Text(
                                            filterList[index].value[1],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
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

class Filter {
  final String label;
  final List<String> value;

  Filter(this.label, this.value);
}
