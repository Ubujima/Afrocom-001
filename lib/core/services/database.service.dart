import 'dart:io';
import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';
import 'package:logger/logger.dart';

class DatabaseService {
  final _logger = Logger();
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

  Future submitUserData(
      {required BuildContext context, required SignedUser signedUser}) async {
    var userDocumentId;
    try {
      var response = await _database.createDocument(
          collectionId: "610d7c664edbe",
          data: signedUser.toJson(),
          read: ["*"],
          write: ["*"]);
      var _userDocumentId = response.data['\$id'];
      var resStatusCode = response.statusCode;
      print("Database status : $resStatusCode");
      if (resStatusCode == 201) {
        userDocumentId = _userDocumentId;
        SnackbarUtility.showSnackbar(
            context: context, message: "Account data added!");
        Navigator.of(context).pushNamed(ShareRoute);
      }
      return userDocumentId;
    } on SocketException catch (error) {
      _logger.i(error.message);
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      _logger.i(error.code);
      _logger.i(error.message);
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
    } catch (error) {
      _logger.i(error);
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }

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
          read: ["*"],
          write: ["*"]);

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
      SnackbarUtility.showSnackbar(
          context: context, message: exceptionMessage!);
    } catch (e) {
      print("🔦 = $e");
    }
  }
}
