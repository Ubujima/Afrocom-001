import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/colorProvider.dart';
import 'package:newuiproject/presentation/elements/auth_text_field.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Booster.verticalSpace(40),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  value: true, onChanged: (val) {})),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  value: true, onChanged: (val) {})),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color.saveColor(colorList[i].id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: color.getColor() ==
                                                      colorList[i].id
                                                  ? Colors.black
                                                  : Colors.transparent),
                                          shape: BoxShape.circle,
                                          color: colorList[i].color),
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
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
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
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Color(0x4D7A7878),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    value: true, onChanged: (val) {})),
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
    );
  }
}

class SelectedColor {
  final String id;
  final Color color;

  SelectedColor({required this.id, required this.color});
}
