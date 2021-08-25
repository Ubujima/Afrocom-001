import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/filter.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

FilterNotifier _filterNotifier(
        {required BuildContext context, required bool renderUI}) =>
    Provider.of<FilterNotifier>(context, listen: renderUI);

MapNotifier _mapNotifier(
        {required BuildContext context, required bool renderUI}) =>
    Provider.of<MapNotifier>(context, listen: renderUI);

DatabaseNotifier _databaseNotifier(
        {required BuildContext context, required bool renderUI}) =>
    Provider.of<DatabaseNotifier>(context, listen: renderUI);

showMoodSubFilters({required BuildContext context}) {
  _moods({required String subCategory, required String image}) =>
      GestureDetector(
        onTap: () {
          _databaseNotifier(context: context, renderUI: false)
              .filteredMarkersPosts(subCategory: subCategory, context: context);
          _mapNotifier(context: context, renderUI: false)
              .filterMarkers(context: context, subCategory: subCategory);
        },
        child: CircleAvatar(
          backgroundColor: KConstantColors.bgColor,
          radius: 25,
          backgroundImage: AssetImage(image),
        ),
      );
  return Positioned(
    top: 420,
    left: 10,
    child: Container(
        child: Column(
      children: [
        _moods(subCategory: "Happy", image: ImageTags.HappyFace),
        _moods(subCategory: "Angry", image: ImageTags.AngryFace),
        _moods(subCategory: "Shock", image: ImageTags.ShockFace),
        _moods(subCategory: "Arrogant", image: ImageTags.ArrogantFace),
      ],
    )),
  );
}

showParentFilterTypes({required BuildContext context}) {
  var _postCategory = [
    "Mood",
    "Blog",
    "Project",
    "Product",
    "Job offering",
    "Services"
  ];

  _postCategoryBlock({required String postType}) {
    return GestureDetector(
      onTap: () {
        _filterNotifier(context: context, renderUI: false)
            .assignPostToBeFiltered(canditateValue: postType);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Provider.of<FilterNotifier>(context, listen: true)
                          .currentSelectedFilteredPosts ==
                      postType
                  ? KConstantColors.blueColor
                  : KConstantColors.textColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(postType,
                  style: KConstantTextStyles.MediumText(fontSize: 18)),
              vSizedBox1,
              CircleAvatar(radius: 20, child: Icon(Icons.add))
            ],
          )),
        ),
      ),
    );
  }

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              vSizedBox1,
              Text("Select filter category",
                  style: KConstantTextStyles.BoldText(fontSize: 20)),
              vSizedBox1,
              Container(
                height: 300,
                width: 400,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _postCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _postCategoryBlock(postType: _postCategory[index]);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_filterNotifier(context: context, renderUI: false)
                          .currentSelectedFilteredPosts !=
                      "Mood") {
                    Navigator.pop(context);
                    showChildFilterTypes(
                        context: context,
                        parentType:
                            _filterNotifier(context: context, renderUI: false)
                                .currentSelectedFilteredPosts);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: KConstantColors.blueColor,
                      borderRadius: BorderRadius.circular(15)),
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                        "Filter ${_filterNotifier(context: context, renderUI: true).currentSelectedFilteredPosts} posts",
                        style: KConstantTextStyles.BoldText(fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
          height: 410,
          decoration: BoxDecoration(
              color: KConstantColors.bgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        );
      });
}

showChildFilterTypes(
    {required BuildContext context, required String parentType}) {
  List<String> baseChildPosts = [];
  var moodPosts = ["Happy", "Arrogant", "Shock", "Angry"];
  var _parentType = parentType;
  switch (_parentType) {
    case "Mood":
      {
        baseChildPosts = moodPosts;
      }
      break;
    case "Blog":
      {}
      break;
    case "Project":
      {}
      break;
    case "Product":
      {}
      break;
    case "Job offering":
      {}
      break;
    case "Services":
      {}
      break;
  }

  _childPostCategoryBlock({required String postType}) {
    return GestureDetector(
      onTap: () {
        _filterNotifier(context: context, renderUI: false)
            .assignPostToBeFiltered(canditateValue: postType);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Provider.of<FilterNotifier>(context, listen: true)
                          .currentSelectedFilteredPosts ==
                      postType
                  ? KConstantColors.blueColor
                  : KConstantColors.textColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(postType,
                  style: KConstantTextStyles.MediumText(fontSize: 18)),
              vSizedBox1,
              CircleAvatar(radius: 20, child: Icon(Icons.add))
            ],
          )),
        ),
      ),
    );
  }

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              vSizedBox1,
              Text("Select $parentType subcategory",
                  style: KConstantTextStyles.BoldText(fontSize: 20)),
              vSizedBox1,
              Container(
                height: 300,
                width: 400,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: baseChildPosts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _childPostCategoryBlock(
                        postType: baseChildPosts[index]);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: KConstantColors.blueColor,
                      borderRadius: BorderRadius.circular(15)),
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                        "Filter ${_filterNotifier(context: context, renderUI: true).currentSelectedFilteredPosts} posts",
                        style: KConstantTextStyles.BoldText(fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
          height: 410,
          decoration: BoxDecoration(
              color: KConstantColors.bgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        );
      });
}
