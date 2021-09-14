import 'package:afrocom/core/notifier/filter.notifier.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/arguments/add_post.argument.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:provider/provider.dart';

PostingNotifier _postingNotifier(
        {required BuildContext context, required bool renderUI}) =>
    Provider.of<PostingNotifier>(context, listen: renderUI);
SettingNotifier settingNotifier(BuildContext context, bool renderUI) =>
    Provider.of<SettingNotifier>(context, listen: renderUI);

showPostingOptions({required BuildContext context}) {
  List<String> _postCategory = [
    "Mood",
    "Blog",
    "Campaign",
    "Place",
    "Market",
    "Event",
    "Job",
  ];
  var currentCat;
  _postCategoryBlock({required String postType}) {
    return GestureDetector(
      onTap: () {
        currentCat = postType;
        _postingNotifier(context: context, renderUI: false)
            .assignSelectedPostTyle(candidatePostType: postType);
        Navigator.pop(context);
        Navigator.of(context).pushNamed(AddPostRoute,
            arguments: AddPostArgument(parentCategory: currentCat));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: settingNotifier(context, true).currentColorTheme,
              border: Border.all(color: KConstantColors.darkColor),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(postType,
                  style: KConstantTextStyles.MediumText(fontSize: 12)),
              vSizedBox1,
              Icon(
                Icons.add,
                color: KConstantColors.whiteColor,
              )
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
              Container(
                width: 200,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: KConstantColors.whiteColor),
              ),
              vSizedBox1,
              Container(
                height: 200,
                width: 400,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: _postCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _postCategoryBlock(postType: _postCategory[index]);
                  },
                ),
              )
            ],
          ),
          height: 250,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        );
      });
}

showFilterOptions({required BuildContext context}) {
  FilterNotifier filterNotifier(bool renderUI) =>
      Provider.of<FilterNotifier>(context, listen: renderUI);
  SettingNotifier settingNotifier(bool renderUI) =>
      Provider.of<SettingNotifier>(context, listen: renderUI);
  List<String> _postCategory = [
    "Mood",
    "Blog",
    "Campaign",
    "Place",
    "Market",
    "Event",
    "Job",
  ];
  _postCategoryBlock({required String postType}) {
    return GestureDetector(
      onTap: () {
        filterNotifier(false)
            .assignPostToBeFiltered(context: context, candidateValue: postType);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: settingNotifier(true).currentColorTheme,
              border: Border.all(color: KConstantColors.darkColor),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(postType,
                  style: KConstantTextStyles.MediumText(fontSize: 12)),
              vSizedBox1,
              CircleAvatar(radius: 15, child: Icon(FontAwesomeIcons.filter))
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
              Container(
                width: 200,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: KConstantColors.whiteColor),
              ),
              vSizedBox1,
              Container(
                height: 200,
                width: 400,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: _postCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _postCategoryBlock(postType: _postCategory[index]);
                  },
                ),
              )
            ],
          ),
          height: 250,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        );
      });
}
