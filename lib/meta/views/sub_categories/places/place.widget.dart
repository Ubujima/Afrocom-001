import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/place.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/place.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class PlaceWidgets {
  static chooseTime({required BuildContext context}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    PlaceNotifier placeNotifier(bool renderUI) =>
        Provider.of<PlaceNotifier>(context, listen: renderUI);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Row(
              children: [
                Text(placeNotifier(true).eventTime,
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                IconButton(
                    onPressed: () {
                      placeNotifier(false).selectTime(context);
                    },
                    icon: Icon(EvaIcons.clock,
                        color: settingNotifier(true).currentColorTheme))
              ],
            ),
          ),
        ],
      ),
    );
  }

  static uploadPlacePost(
      {required TextEditingController placeTitleController,
      required TextEditingController placeDescriptionController,
      required TextEditingController placeAddressController,
      required TextEditingController placeWebsiteController,
      required BuildContext context}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    PlaceNotifier _placeNotifier({required bool renderUI}) =>
        Provider.of<PlaceNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (placeTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String posttitle = placeTitleController.text;
          String postDescription = placeDescriptionController.text;
          String placeaddress = placeAddressController.text;
          String placeHours = _placeNotifier(renderUI: false).eventTime;
          String postsubcategory =
              _postingNotifier(renderUI: false).subCategory;
          String placeWebsite = placeWebsiteController.text;
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
                collectionId: DatabaseCredentials.PlaceCategoryCollectionID,
                data: PlaceCategoryModel(
                        "Place",
                        postusername,
                        postsubcategory,
                        [postAsset],
                        posttitle,
                        postDescription,
                        placeaddress,
                        placeHours,
                        postuseraddress,
                        placeWebsite,
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
              String postasset =
                  _postingNotifier(renderUI: false).uploadedVideoURL;
              await DatabaseService.createInstance.uploadPost(
                  collectionId: DatabaseCredentials.PlaceCategoryCollectionID,
                  data: PlaceCategoryModel(
                          "Place",
                          postusername,
                          postsubcategory,
                          [postasset],
                          posttitle,
                          postDescription,
                          placeaddress,
                          placeHours,
                          postuseraddress,
                          placeWebsite,
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
