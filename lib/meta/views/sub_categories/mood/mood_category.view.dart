import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.widgets.dart';

class ShowMoodCategoryView extends StatefulWidget {
  @override
  _ShowMoodCategoryViewState createState() => _ShowMoodCategoryViewState();
}

class _ShowMoodCategoryViewState extends State<ShowMoodCategoryView> {
  TextEditingController moodPostTitle = TextEditingController();

  @override
  void initState() {
    moodPostTitle = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox3,
              CommonWidgets.backButton(context, "Mood"),
              MoodWidgets.customTextField(moodPostTitle: moodPostTitle),
              vSizedBox1,
              Text("Post Media",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              vSizedBox1,
              MoodWidgets.selectImageSection(context: context),
              vSizedBox2,
              Text("Select Mood",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              vSizedBox1,
              MoodWidgets.moodSection(context: context),
              vSizedBox2,
              MoodWidgets.addLocation(context: context),
              vSizedBox2,
              MoodWidgets.uploadMoodPost(
                  parentCategory:
                      _postingNotifier(renderUI: false).selectedPostType!,
                  moodTitleController: moodPostTitle,
                  context: context),
              vSizedBox3
            ],
          ),
        ),
      ),
    );
  }
}
