import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/categories/market_model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/market.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class MarketCommonWidgets {
  static serviceSubCategoryTile(
      {required BuildContext context, required String subCategoryTitle}) {
    MarketNotifier _marketNotifier({required bool renderUI}) =>
        Provider.of<MarketNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _marketNotifier(renderUI: false)
            .setServiceCategory(candidateServiceCategory: subCategoryTitle);
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
              color: _marketNotifier(renderUI: true).serviceCategory ==
                      subCategoryTitle
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static List<String> _subCategory = [
    "Automotive",
    "Beauty Services",
    "Computer Services",
    "Financial Services",
    "Labor & Hauling",
    "Small Biz Ads",
  ];

  static renderServiceCategory() {
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

  static productCategoryTile(
      {required BuildContext context, required String subCategoryTitle}) {
    MarketNotifier _marketNotifier({required bool renderUI}) =>
        Provider.of<MarketNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () {
        _marketNotifier(renderUI: false)
            .setServiceCategory(candidateServiceCategory: subCategoryTitle);
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
              color: _marketNotifier(renderUI: true).serviceCategory ==
                      subCategoryTitle
                  ? KConstantColors.yellowColor
                  : KConstantColors.textColor.withOpacity(0.4)),
        ),
      ),
    );
  }

  static List<String> _productCategory = [
    "Antiques",
    "Appliances",
    "Auto Parts & Care",
    "Cars & Trucks",
    "Cell Phones",
    "Books",
  ];

  static renderProductCategory() {
    return Container(
      height: 60,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _productCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return productCategoryTile(
              context: context, subCategoryTitle: _productCategory[index]);
        },
      ),
    );
  }

  static uploadMarketProductPost(
      {required TextEditingController productTitleController,
      required TextEditingController productDescriptionController,
      required TextEditingController marketPriceController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (productTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String posttitle = productTitleController.text;
          String postDescription = productDescriptionController.text;
          String postsubcategory =
              _postingNotifier(renderUI: false).subCategory;
          String marketPrice = marketPriceController.text;
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
                collectionId: DatabaseCredentials.MarketCategoryCollectionID,
                data: MarketCategoryModel(
                        "Market",
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
                        "Product",
                        marketPrice)
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
                  collectionId: DatabaseCredentials.MarketCategoryCollectionID,
                  data: MarketCategoryModel(
                          "Market",
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
                          "Product",
                          marketPrice)
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

  static uploadMarketServicePost(
      {required TextEditingController serviceTitleController,
      required TextEditingController serviceDescriptionController,
      required TextEditingController servicePriceController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (serviceTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter required fields");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String postuserid = userData['\$id'];
          String postusername = userData['name'];
          String posttime = DateTime.now().toString();
          String posttitle = serviceTitleController.text;
          String postDescription = serviceDescriptionController.text;
          String postsubcategory =
              _postingNotifier(renderUI: false).subCategory;
          String marketPrice = servicePriceController.text;
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
                collectionId: DatabaseCredentials.MarketCategoryCollectionID,
                data: MarketCategoryModel(
                        "Market",
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
                        "Service",
                        marketPrice)
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
                  collectionId: DatabaseCredentials.MarketCategoryCollectionID,
                  data: MarketCategoryModel(
                          "Market",
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
                          "Service",
                          marketPrice)
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
