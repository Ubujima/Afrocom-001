import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowMoodCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShowSubCategories extends StatelessWidget {
  final String parentCategory;
  const ShowSubCategories({required this.parentCategory});

  moodSelection({required BuildContext context}) {
    PostingNotifier _postingNotifier(
            {required BuildContext context, required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _moods({required String image}) => GestureDetector(
          onTap: () {
            _postingNotifier(context: context, renderUI: false)
                .assignMoodLogo(candidateMoodLogo: image);
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius:
                _postingNotifier(context: context, renderUI: true).moodLogo ==
                        image
                    ? 35
                    : 25,
            backgroundImage: AssetImage(image),
          ),
        );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox1,
          Text(
              "Select mood : ${_postingNotifier(context: context, renderUI: true).moodLogoValue}",
              style: KConstantTextStyles.MediumText(fontSize: 16)),
          vSizedBox1,
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: KConstantColors.bgColorFaint,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _moods(image: ImageTags.HappyFace),
                _moods(image: ImageTags.AngryFace),
                _moods(image: ImageTags.ShockFace),
                _moods(image: ImageTags.ArrogantFace),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (parentCategory) {
      case "Blog":
        {
          return Container(
            child: Center(
                child: Text(parentCategory,
                    style: KConstantTextStyles.BoldText(fontSize: 16))),
          );
        }
      default:
        {
          return moodSelection(context: context);
        }
    }
  }
}
