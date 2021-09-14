import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:newuiproject/presentation/elements/app_button_red_round.dart';
import 'package:newuiproject/presentation/elements/auth_text_field.dart';
import 'package:newuiproject/presentation/elements/auth_text_field_big.dart';

class BlogPostingForm extends StatelessWidget {
  static List<Category> _categories = [
    Category(id: 1, name: "Lion"),
    Category(id: 2, name: "Flamingo"),
    Category(id: 3, name: "Hippo"),
    Category(id: 4, name: "Horse"),
    Category(id: 5, name: "Tiger"),
    Category(id: 6, name: "Penguin"),
    Category(id: 7, name: "Spider"),
    Category(id: 8, name: "Snake"),
    Category(id: 9, name: "Bear"),
    Category(id: 10, name: "Beaver"),
    Category(id: 11, name: "Cat"),
    Category(id: 12, name: "Fish"),
    Category(id: 13, name: "Rabbit"),
    Category(id: 14, name: "Mouse"),
    Category(id: 15, name: "Dog"),
    Category(id: 16, name: "Zebra"),
    Category(id: 17, name: "Cow"),
    Category(id: 18, name: "Frog"),
    Category(id: 19, name: "Blue Jay"),
    Category(id: 20, name: "Moose"),
    Category(id: 21, name: "Gecko"),
    Category(id: 22, name: "Kangaroo"),
    Category(id: 23, name: "Shark"),
    Category(id: 24, name: "Crocodile"),
    Category(id: 25, name: "Owl"),
    Category(id: 26, name: "Dragonfly"),
    Category(id: 27, name: "Dolphin"),
  ];

  List<Category> _selectedCategory = [];
  final _items = _categories
      .map((cate) => MultiSelectItem<Category>(cate, cate.name))
      .toList();
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Booster.dynamicFontSize(
                      label: 'Choose a category',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Booster.verticalSpace(17),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 6,
                      shadowColor: Color(0x4D000000),
                      child: MultiSelectDialogField<Category?>(
                        buttonIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Color(0xff7A7878),
                        ),
                        items: _categories
                            .map((e) => MultiSelectItem(e, e.name))
                            .toList(),
                        listType: MultiSelectListType.LIST,
                        onConfirm: (values) {
                          _selectedCategory = values.cast<Category>();
                        },
                      ),
                    ),
                  ),
                  Booster.verticalSpace(7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 6,
                      shadowColor: Color(0x4D000000),
                      child: AuthTextField(
                        label: "Title",
                      ),
                    ),
                  ),
                  Booster.verticalSpace(7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 6,
                      shadowColor: Color(0x4D000000),
                      child: AuthTextFieldBig(
                        label: "Main Text",
                      ),
                    ),
                  ),
                  Booster.verticalSpace(14),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Booster.dynamicFontSize(
                        label: 'Add Media',
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
                  Booster.verticalSpace(15),
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
                      height: 399,
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
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}
