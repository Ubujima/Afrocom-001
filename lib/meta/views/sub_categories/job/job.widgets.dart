import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/job.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/job.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class JobWidgets {
  static List<String> _jobExperience = [
    "Internship",
    "Entry level",
    "Associate",
    "Mid-Senior",
    "Director",
    "Executive",
  ];

  static List<String> _contractType = ["Freelance", "Part time", "Full time"];

  static jobExperienceLevelTile(
      {required BuildContext context, required String jobTitle}) {
    JobNotifier _jobNotifier({required bool renderUI}) =>
        Provider.of<JobNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _jobNotifier(renderUI: false).setJobLevel(candidateJob: jobTitle);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(jobTitle,
                      style: KConstantTextStyles.MediumText(fontSize: 16)))),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _jobNotifier(renderUI: true).jobLevel == jobTitle
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static renderjobExperienceLevel({required BuildContext context}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _jobExperience.length,
          itemBuilder: (BuildContext context, int index) {
            return jobExperienceLevelTile(
                context: context, jobTitle: _jobExperience[index]);
          },
        ),
      ),
    );
  }

  static contractTypeTile(
      {required BuildContext context, required String candidateContract}) {
    JobNotifier _jobNotifier({required bool renderUI}) =>
        Provider.of<JobNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _jobNotifier(renderUI: false)
            .setJobContractType(candidateContract: candidateContract);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(candidateContract,
                      style: KConstantTextStyles.MediumText(fontSize: 16)))),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _jobNotifier(renderUI: true).jobContractType ==
                      candidateContract
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static renderContractType({required BuildContext context}) {
    return Container(
      height: 60,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _contractType.length,
        itemBuilder: (BuildContext context, int index) {
          return contractTypeTile(
              context: context, candidateContract: _contractType[index]);
        },
      ),
    );
  }

  static serviceSubCategoryTile(
      {required BuildContext context, required String subCategoryTitle}) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _postingNotifier(renderUI: false)
            .assignSubcategory(candidateSubCategory: subCategoryTitle);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(subCategoryTitle,
                      style: KConstantTextStyles.MediumText(fontSize: 16)))),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _postingNotifier(renderUI: true).subCategory ==
                      subCategoryTitle
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static List<String> _subCategory = [
    "Admin/Office",
    "Accounting/Finance",
    "Education/Teaching,",
    "General Labor",
    "Customer Service",
    "Art/Media/Design",
    "Security",
    "Systems/Networking"
  ];

  static renderSubCategory() {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
      ),
    );
  }

  static uploadJobPost(
      {required TextEditingController jobTitleController,
      required TextEditingController jobDescriptionController,
      required TextEditingController jobAddressController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    JobNotifier _jobNotifier({required bool renderUI}) =>
        Provider.of<JobNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (jobTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String posttitle = jobTitleController.text;
          String contractType = _jobNotifier(renderUI: false).jobContractType;
          String experienceLevel = _jobNotifier(renderUI: false).jobLevel;
          String postDescription = jobDescriptionController.text;
          String postsubcategory =
              _postingNotifier(renderUI: false).subCategory;
          String jobAddress = jobAddressController.text;
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
                collectionId: DatabaseCredentials.JobCategoryCollectionID,
                data: JobCategoryModel(
                        "Job",
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
                        jobAddress,
                        contractType,
                        experienceLevel)
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
                  collectionId: DatabaseCredentials.JobCategoryCollectionID,
                  data: JobCategoryModel(
                          "Job",
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
                          jobAddress,
                          contractType,
                          experienceLevel)
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
              color: KConstantColors.blueColor,
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
