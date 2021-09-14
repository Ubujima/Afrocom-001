import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/event_category.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/event.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class EventWidgets {
  static chooseDateTime({required BuildContext context}) {
    EventNotifier eventNotifier(bool renderUI) =>
        Provider.of<EventNotifier>(context, listen: renderUI);
    return Container(
      child: Column(
        children: [
          Text("Choose Date & Time",
              style: KConstantTextStyles.MediumText(fontSize: 14)),
          vSizedBox1,
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(eventNotifier(true).eventTime,
                          style: KConstantTextStyles.MediumText(fontSize: 14)),
                      IconButton(
                          onPressed: () {
                            eventNotifier(false).selectTime(context);
                          },
                          icon: Icon(EvaIcons.clock))
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(eventNotifier(true).eventDate,
                          style: KConstantTextStyles.MediumText(fontSize: 14)),
                      IconButton(
                          onPressed: () {
                            eventNotifier(false).selectDate(context);
                          },
                          icon: Icon(EvaIcons.calendarOutline))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static uploadEventPost(
      {required TextEditingController eventTitleController,
      required TextEditingController eventDescriptionController,
      required TextEditingController eventAddressController,
      required BuildContext context}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    EventNotifier _eventNotifier({required bool renderUI}) =>
        Provider.of<EventNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (eventTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String eventDate = _eventNotifier(renderUI: false).eventDate;
          String eventTime = _eventNotifier(renderUI: false).eventTime;
          String posttitle = eventTitleController.text;
          String postDescription = eventDescriptionController.text;
          String eventAddress = eventAddressController.text;
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
                collectionId: DatabaseCredentials.EventCategoryCollectionID,
                data: EventCategoryModel(
                        "Event",
                        postusername,
                        postsubcategory,
                        [postAsset],
                        posttitle,
                        postDescription,
                        postuseraddress,
                        postuserlocationcords,
                        posttime,
                        postuserid,
                        false,
                        eventAddress,
                        eventDate,
                        eventTime)
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
                  collectionId: DatabaseCredentials.EventCategoryCollectionID,
                  data: EventCategoryModel(
                          "Event",
                          postusername,
                          postsubcategory,
                          [postasset],
                          posttitle,
                          postDescription,
                          postuseraddress,
                          postuserlocationcords,
                          posttime,
                          postuserid,
                          true,
                          eventAddress,
                          eventDate,
                          eventTime)
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
