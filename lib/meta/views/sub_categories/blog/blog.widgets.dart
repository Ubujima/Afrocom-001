import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/blog_category.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class BlogWidgets {
  static uploadBlogPost(
      {required TextEditingController blogTitleController,
      required TextEditingController blogDescriptionController,
      required BuildContext context}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (blogTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String postcategory = "Blog";
          String posttitle = blogTitleController.text;
          String postDescription = blogDescriptionController.text;
          String postsubcategory =
              _postingNotifier(renderUI: false).subCategory;
          String postuseraddress = mapNotifier.selectedLocation!;
          String postuserlocationcords =
              "${mapNotifier.selectedLocationCords!.latitude.toString()},${mapNotifier.selectedLocationCords!.longitude.toString()}";
          if (_postingNotifier(renderUI: false).pickedVideoFile == null) {
            dynamic postAsset = await StorageService.createInstance
                .uploadPostAsset(
                    assetPath:
                        _postingNotifier(renderUI: false).selectedImage!.path,
                    context: context);
            await DatabaseService.createInstance.uploadPost(
                collectionId: DatabaseCredentials.BlogCategoryCollectionID,
                data: BlogCategoryModel(
                        postcategory,
                        postusername,
                        postsubcategory,
                        [postAsset],
                        posttitle,
                        postDescription,
                        postuseraddress,
                        postuserlocationcords,
                        posttime,
                        postuserid,
                        false)
                    .toJson(),
                context: context);
          }
          if (_postingNotifier(renderUI: false).pickedVideoFile != null) {
            print("Uploading video post");
            await _postingNotifier(renderUI: false)
                .uploadPostVideo(context: context)
                .whenComplete(() async {
              String postAsset =
                  _postingNotifier(renderUI: false).uploadedVideoURL;
              await DatabaseService.createInstance.uploadPost(
                  collectionId: DatabaseCredentials.BlogCategoryCollectionID,
                  data: BlogCategoryModel(
                          postcategory,
                          postusername,
                          postsubcategory,
                          [postAsset],
                          posttitle,
                          postDescription,
                          postuseraddress,
                          postuserlocationcords,
                          posttime,
                          postuserid,
                          true)
                      .toJson(),
                  context: context);
            });
          }
        }
      },
      child: Center(
        child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: settingNotifier(true).currentColorTheme,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Text("Upload Post",
                    style: TextStyle(
                        fontFamily: KConstantFonts.PoppinsBold,
                        color: KConstantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))),
      ),
    );
  }
}
