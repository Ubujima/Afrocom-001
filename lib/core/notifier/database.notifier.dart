import 'package:afrocom/core/models/fetch_posts.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class DatabaseNotifier extends ChangeNotifier {
  Future<String> submitUserData(
      {required BuildContext context, required SignedUser signedUser}) async {
    var userDocumentId;
    try {
      var _userDocumentId = await DatabaseService.createInstance
          .submitUserData(signedUser: signedUser, context: context);
      userDocumentId = _userDocumentId;
      return userDocumentId;
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
    return userDocumentId;
  }

  Future updateData(
      {required String collectionId,
      required String documentId,
      required Map<String, dynamic> data,
      required BuildContext context}) async {
    try {
      await DatabaseService.createInstance.updateData(
          collectionId: collectionId,
          documentId: documentId,
          data: data,
          context: context);
    } catch (e) {
      print(e);
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong.");
    }
  }

  //! <---------------------------------------------FETCH CORDS------------------------------------------------>

  Future fetchCoordinates({required BuildContext context}) async {
    try {
      var response =
          await DatabaseService.createInstance.fetchPosts(context: context);
      var modelledData = FetchPosts.fromJson(response);
      return modelledData.documents;
    } catch (e) {}
  }
}
