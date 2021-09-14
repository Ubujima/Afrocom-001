import 'dart:io';
import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';

class DatabaseService {
  static DatabaseService? _instance;
  late Client _client;
  late Database _database;

  DatabaseService._initialize() {
    _client = Client(endPoint: AppwriteCredentials.AppwriteLocalEndpoint)
        .setProject(AppwriteCredentials.AppwriteLocalProjectID)
        .setSelfSigned();
    _database = Database(_client);
  }
  static DatabaseService get createInstance {
    if (_instance == null) {
      _instance = DatabaseService._initialize();
    }
    return _instance!;
  }

  Future<bool> checkIfExists(
      {required String dataKey,
      required String identifier,
      required String collectionId}) async {
    var userdata;
    await _database.listDocuments(collectionId: collectionId).then((heapDocs) {
      final _listOfDocuments = heapDocs.data['documents'] as List;
      var _userdata =
          _listOfDocuments.where((blux) => blux[dataKey] == identifier);
      userdata = _userdata;
    });
    if (userdata.length >= 1) {
      return true;
    } else {
      return false;
    }
  }

//! <--------------------------------------------------SUBMIT USER DATA------------------------------------------------------------>
  Future submitUserData(
      {required BuildContext context, required SignedUser signedUser}) async {
    var userDocumentId;
    try {
      var response = await _database.createDocument(
          collectionId: DatabaseCredentials.UserCollectionID,
          data: signedUser.toJson(),
          read: ['*'],
          write: ['*']);
      var _userDocumentId = response.data['\$id'];
      var resStatusCode = response.statusCode;
      if (resStatusCode == 201) {
        userDocumentId = _userDocumentId;
        SnackbarUtility.showSnackbar(
            context: context, message: "Information is saved!");
        Navigator.of(context).pushNamed(HomeRoute);
      }
      return userDocumentId;
    } on SocketException catch (error) {
      print(error);
    } on AppwriteException catch (error) {
      var errorCode = error.code;
      var errorMesage = error.message;
      switch (errorCode) {
        case 429:
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again!");
          break;
        case 400:
          SnackbarUtility.showSnackbar(
              context: context, message: "Something went wrong, Try again");
          break;
        default:
          {
            SnackbarUtility.showSnackbar(
                context: context, message: errorMesage!);
          }
      }
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }

  //!<---------------------------- FIND USER DATA BASED ON LOGGED ID--------------------------------->

  Future findUserData(
      {required BuildContext context, required dynamic documentId}) async {
    try {
      var userData = await _database.getDocument(
          collectionId: DatabaseCredentials.UserCollectionID,
          documentId: documentId);
      var userStatusCode = userData.statusCode;
      var data = userData.data;
      switch (userStatusCode) {
        case 200:
          {
            return data;
          }
      }
    } on AppwriteException catch (error) {
      var errorCode = error.code;
      switch (errorCode) {
        case 429: //! Too many requests
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again!");
          break;
        case 400: //! Bad structure. Invalid document structure: Unknown properties are not allowed.
          SnackbarUtility.showSnackbar(
              context: context, message: "Something went wrong, Try again");
      }
    } catch (e) {}
  }

  //!<--------------------------------------------SEARCH USER DATA------------------------------------->

  Future searchUserData(
      {required BuildContext context, required dynamic query}) async {
    try {
      var response = await _database.listDocuments(
          collectionId: DatabaseCredentials.UserCollectionID, search: query);
      var resData = response.data;
      var info = resData['documents'][0];
      return info;
    } on AppwriteException catch (error) {
      var errorMessage = error.message;
      var errorCode = error.code;
      switch (errorCode) {
        case 429:
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again!");
          break;
        case 400:
          SnackbarUtility.showSnackbar(
              context: context, message: "Something went wrong, Try again");
          break;
        default:
          {
            SnackbarUtility.showSnackbar(
                context: context, message: errorMessage!);
          }
      }
    } catch (e) {}
  }

  Future searchPostData(
      {required String collectionId,
      required BuildContext context,
      required dynamic query}) async {
    try {
      var response = await _database.listDocuments(
          collectionId: collectionId, search: query);
      var resData = response.data;
      var info = resData['documents'][0];
      return info;
    } on AppwriteException catch (error) {
      var errorMessage = error.message;
      var errorCode = error.code;
      switch (errorCode) {
        case 429:
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again!");
          break;
        case 400:
          SnackbarUtility.showSnackbar(
              context: context, message: "Something went wrong, Try again");
          break;
        default:
          {
            SnackbarUtility.showSnackbar(
                context: context, message: errorMessage!);
          }
      }
    } catch (e) {}
  }

//! <--------------------------------------------------UPDATE DATA------------------------------------------------------------>
  Future updateData(
      {required String collectionId,
      required String documentId,
      required Map<String, dynamic> data,
      required BuildContext context}) async {
    try {
      var updatedData = await _database.updateDocument(
        collectionId: collectionId,
        documentId: documentId,
        data: data,
        read: ["*", "role:guest", "role:member"],
        write: ["*", "role:guest", "role:member"],
      );

      var statusCode = updatedData.statusCode;
      switch (statusCode) {
        case 200:
          {
            SnackbarUtility.showSnackbar(
                context: context, message: "Information added in database");
          }
      }
    } on AppwriteException catch (exception) {
      var exceptionMessage = exception.message;
      print(exceptionMessage);
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {
      print("🔦 = $e");
    }
  }

//! <--------------------------------------------------UPLOAD POSTS------------------------------------------------------------>
  Future uploadPost(
      {required String collectionId,
      required dynamic data,
      required BuildContext context}) async {
    try {
      var _response = await _database.createDocument(
        collectionId: collectionId,
        data: data,
        read: ["*", "role:guest", "role:member"],
        write: ["*", "role:guest", "role:member"],
      );
      var _resStatusCode = _response.statusCode;
      switch (_resStatusCode) {
        case 201:
          {
            SnackbarUtility.showSnackbar(
                context: context, message: "Post uploaded successfully");
            Navigator.of(context).pushNamed(HomeRoute);
          }
      }
    } on AppwriteException catch (exception) {
      var exceptionMessage = exception.message;
      print(exceptionMessage);
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {
      print(e);
      SnackbarUtility.showSnackbar(context: context, message: e.toString());
    }
  }

//! <--------------------------------------------------FETCH POSTS------------------------------------------------------------>
  fetchPosts(
      {required dynamic collectionId, required BuildContext context}) async {
    try {
      var response = await _database.listDocuments(collectionId: collectionId);
      if (response.data != null) {
        var responseData = response.data;
        return responseData;
      }
    } on AppwriteException catch (exception) {
      var exceptionMessage = exception.message;
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {
      SnackbarUtility.showSnackbar(context: context, message: e.toString());
    }
  }

  //! <------------------------------------------DELETE POSTS--------------------------------------------------->
  deletePost(
      {required dynamic imageId,
      required BuildContext context,
      required dynamic postId}) async {
    try {
      var response = await _database.deleteDocument(
          collectionId: DatabaseCredentials.PostCollectionID,
          documentId: postId);
      var resStatusCode = response.statusCode;
      if (resStatusCode == 204) {
        await StorageService.createInstance
            .deletePostImage(postId: imageId, context: context);
        Future.delayed(Duration(seconds: 6)).whenComplete(() {
          Navigator.of(context).pushNamed(FeedRoute);
        });
      }
    } on AppwriteException catch (exception) {
      var exceptionMessage = exception.message;
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {}
  }

  //!<-------------------------------------------------FILTER MARKERS------------------------------------------>
  Future filteredMarkersPosts(
      {required String subCategory, required BuildContext context}) async {
    try {
      var response = await _database.listDocuments(
          filters: ['postusermood=$subCategory'],
          collectionId: DatabaseCredentials.PostCollectionID);
      if (response.data != null) {
        var responseData = response.data;
        return responseData;
      }
    } on AppwriteException catch (exception) {
      var exceptionMessage = exception.message;
      print(exceptionMessage);
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {
      SnackbarUtility.showSnackbar(context: context, message: e.toString());
    }
  }
}
