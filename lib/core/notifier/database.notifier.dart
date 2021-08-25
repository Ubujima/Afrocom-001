import 'package:afrocom/core/models/fetch_posts.dart';
import 'package:afrocom/core/models/profile_user.model.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class DatabaseNotifier extends ChangeNotifier {
  late Logger logger;
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

  //!<------------------------------------------SEARCH USER DATA--------------------------------------->
  Future searchUserDocumentId({required BuildContext context}) async {
    try {
      final _authenticationNotifier =
          Provider.of<AuthenticationNotifier>(context, listen: false);
      var user =
          await _authenticationNotifier.getCurrentUserSession(context: context);
      var userid = user['\$id'];
      var response = await DatabaseService.createInstance
          .searchUserData(context: context, query: userid);
      var data = response['documents'][0];
      var userDocumentId = data['\$id'];
      return userDocumentId;
    } catch (e) {
      logger.i(e.toString());
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

  //! <------------------------------------------ FIND USER DATA BASED ON LOGGED ID------------------->
  Future findUserData(
      {required BuildContext context, required dynamic documentId}) async {
    try {
      var response = await DatabaseService.createInstance
          .findUserData(context: context, documentId: documentId);
      var modelledData = ProfileUser.fromJson(response);
      var profileData = modelledData;
      return profileData;
    } catch (e) {
      print(e);
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }

  Future filteredMarkersPosts(
      {required String subCategory, required BuildContext context}) async {
    try {
      var response = await DatabaseService.createInstance
          .filteredMarkersPosts(subCategory: subCategory, context: context);
      var modelledData = FetchPosts.fromJson(response);
      var _data = modelledData.documents;
      return _data;
    } catch (e) {
      print(e);
    }
  }
}
