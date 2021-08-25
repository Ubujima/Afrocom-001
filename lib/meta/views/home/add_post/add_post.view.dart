import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/meta/utilities/sub_category.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.exports.dart';
import 'package:afrocom/meta/widgets/back_button.dart';
import 'package:provider/provider.dart';
import 'components/add_post_components.dart';

class AddPostView extends StatefulWidget {
  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _customTextField() {
      return Container(
          child: Center(
        child: TextField(
          minLines: 5,
          maxLines: 6,
          style: TextStyle(color: KConstantColors.whiteColor, fontSize: 16.0),
          controller: descriptionController,
          decoration: new InputDecoration(
              filled: true,
              hintText: "Enter caption...",
              hintStyle: new TextStyle(
                  color: KConstantColors.textColor, fontSize: 16.0),
              fillColor: KConstantColors.bgColorFaint,
              border: new OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(const Radius.circular(5.0)))),
        ),
      ));
    }

    return Scaffold(
      backgroundColor: KConstantColors.darkColor,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  KConstantColors.darkColor,
                  KConstantColors.bgColor,
                ],
                begin: const FractionalOffset(0.0, 0.1),
                end: const FractionalOffset(0.9, 0.0),
                stops: [0.5, 1.0]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox3,
                vSizedBox1,
                CustomBackButton(
                    backPressed: () =>
                        Navigator.of(context).pushNamed(HomeRoute),
                    title:
                        "Post as ${_postingNotifier(renderUI: true).selectedPostType}"),
                _customTextField(),
                vSizedBox2,
                ShowSubCategories(
                    parentCategory:
                        _postingNotifier(renderUI: false).selectedPostType!),
                vSizedBox2,
                AddPostComponents.selectImageSection(context: context),
                vSizedBox2,
                AddPostComponents.addLocation(context: context),
                vSizedBox2,
                AddPostComponents.uploadPostButton(
                    textEditingController: descriptionController,
                    context: context),
                vSizedBox3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
