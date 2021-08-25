import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/models/post.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/utilities/sub_category.view.dart';
import 'package:afrocom/meta/views/home/add_post/components/add_post_components.dart';
import 'package:afrocom/meta/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShowBlogCategoryView extends StatefulWidget {
  @override
  _ShowBlogCategoryViewState createState() => _ShowBlogCategoryViewState();
}

class _ShowBlogCategoryViewState extends State<ShowBlogCategoryView> {
  TextEditingController blogTitleController = TextEditingController();
  TextEditingController blogDescriptionController = TextEditingController();

  @override
  void initState() {
    blogTitleController = TextEditingController();
    blogDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);

    //! UPLOAD BUTTON
    uploadButton(
        {required TextEditingController textEditingController,
        required BuildContext context}) {
      var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
      var authenticationNotifier =
          Provider.of<AuthenticationNotifier>(context, listen: false);
      PostingNotifier _postingNotifier({required bool renderUI}) =>
          Provider.of<PostingNotifier>(context, listen: renderUI);
      return GestureDetector(
        onTap: () async {
          var userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          var postuserid = userData['\$id'];
          var postusername = userData['name'];
          var postusercaption = textEditingController.text;
          var postuseraddress = mapNotifier.selectedLocation;
          var postuserlocationcords =
              "${mapNotifier.selectedLocationCords!.latitude.toString()},${mapNotifier.selectedLocationCords!.longitude.toString()}";
          var posttime = DateTime.now().toLocal().toString();
          var postcategory = _postingNotifier(renderUI: false).selectedPostType;
          var postusermood = _postingNotifier(renderUI: false).moodLogoValue;
          var postasset = await StorageService.createInstance.uploadPostAsset(
              assetPath: _postingNotifier(renderUI: false).pickedVideoPath ??
                  _postingNotifier(renderUI: false).selectedImage!.path,
              context: context);
          if (postusercaption.isNotEmpty) {
            bool isVideo = false;
            if (_postingNotifier(renderUI: false).pickedVideoFile != null) {
              isVideo = true;
            }
            await DatabaseService.createInstance.uploadPost(
                post: Post(
                    postcategory!,
                    postusername,
                    postusermood!,
                    [postasset],
                    postusercaption,
                    postuseraddress!,
                    postuserlocationcords,
                    posttime,
                    postuserid,
                    isVideo),
                context: context);
          } else {
            SnackbarUtility.showSnackbar(
                context: context, message: "Enter caption");
          }
        },
        child: Center(
          child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: KConstantColors.bgColorFaint,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text("Upload Post",
                      style: KConstantTextStyles.BoldText(fontSize: 16)))),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          vSizedBox3,
          vSizedBox1,
          CustomBackButton(
              backPressed: () => Navigator.of(context).pushNamed(HomeRoute),
              title:
                  "Post as ${_postingNotifier(renderUI: true).selectedPostType}"),
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
              textEditingController: blogDescriptionController,
              context: context),
          vSizedBox3,
        ],
      ),
    );
  }
}
