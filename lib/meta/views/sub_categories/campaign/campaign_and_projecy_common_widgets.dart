import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/campaign_and_project.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/campaign_and_project.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class ProjectAndCampaignCommonWidgets {
  static serviceSubCategoryTile(
      {required BuildContext context, required String subCategoryTitle}) {
    CampaignAndProjectNotifier _campaignAndProjectNotifier(
            {required bool renderUI}) =>
        Provider.of<CampaignAndProjectNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _campaignAndProjectNotifier(renderUI: false)
            .setProjectType(candidateSubCategory: subCategoryTitle);
        print(subCategoryTitle);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(subCategoryTitle,
                      style: KConstantTextStyles.MediumText(fontSize: 14)))),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _campaignAndProjectNotifier(renderUI: true)
                          .projectSubCateogory ==
                      subCategoryTitle
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static List<String> _subCategory = [
    "Goodhealth & Well-Being",
    "Pan-Africanism",
    "Gender Equality,",
    "Humane IoT",
    "Sustainanble Cities",
    "Industry, Innovation",
  ];

  static renderProjectCategory() {
    return Container(
      height: 60,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _subCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return serviceSubCategoryTile(
              context: context, subCategoryTitle: _subCategory[index]);
        },
      ),
    );
  }

  static uploadProjectPost(
      {required TextEditingController projectTitleController,
      required TextEditingController projectDescriptionController,
      required TextEditingController requiredFundsAmountController,
      required TextEditingController raisedFundsControllerController,
      required BuildContext context}) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    CampaignAndProjectNotifier _campaignAndProjectNotifier(
            {required bool renderUI}) =>
        Provider.of<CampaignAndProjectNotifier>(context, listen: renderUI);
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (projectTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String posttitle = projectTitleController.text;
          String postDescription = projectDescriptionController.text;
          String requiredFunds = requiredFundsAmountController.text;
          String raisedFunds = raisedFundsControllerController.text;
          String postsubcategory =
              _campaignAndProjectNotifier(renderUI: false).projectSubCateogory;
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
                collectionId: DatabaseCredentials.ProjectCategoryCollectionID,
                data: CampaignAndProjectCategoryModel(
                        "Project",
                        postusername,
                        postsubcategory,
                        [postAsset],
                        posttitle,
                        postDescription,
                        requiredFunds,
                        raisedFunds,
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
              String postasset =
                  _postingNotifier(renderUI: false).uploadedVideoURL;
              await DatabaseService.createInstance.uploadPost(
                  collectionId: DatabaseCredentials.ProjectCategoryCollectionID,
                  data: CampaignAndProjectCategoryModel(
                          "Campaign",
                          postusername,
                          postsubcategory,
                          [postasset],
                          posttitle,
                          postDescription,
                          requiredFunds,
                          raisedFunds,
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
