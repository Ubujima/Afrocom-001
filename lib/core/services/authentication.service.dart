import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/models/user.model.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AppwriteAuthenticationAPI {
  final _logger = Logger();
  static AppwriteAuthenticationAPI? _instance;
  late Client _client;
  late Account _account;
  final NavigationUtility navigationUtility = new NavigationUtility();

  AppwriteAuthenticationAPI._initialize() {
    _client = Client(endPoint: AppwriteCredentials.AppwriteEndpoint)
        .setProject(AppwriteCredentials.AppwriteProjectID)
        .setSelfSigned();
    _account = Account(_client);
  }
  static AppwriteAuthenticationAPI get createInstance {
    if (_instance == null) {
      _instance = AppwriteAuthenticationAPI._initialize();
    }
    return _instance!;
  }

  //! Create new account and submit the data in database
  Future signUp(
      {required BuildContext context,
      required String userfullname,
      required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      //! Notifiers
      final databaseNotifier =
          Provider.of<DatabaseNotifier>(context, listen: false);
      final utilityNotifier =
          Provider.of<UtilityNotifier>(context, listen: false);
      // var userdob =
      //     utilityNotifier.pickedUserDOB!.toLocal().toString().split(" ")[0];
      //! Response  from Appwrite
      var response = await _account.create(
          name: username, email: useremail, password: userpassword);
      if (response.data != null) {
        var responseStatusCode = response.statusCode;
        //! Adding data only when status code is 201
        if (responseStatusCode == 201) {
          // var res = User.fromMap(response.data);
          // //! Submit data in user database
          // Future.delayed(Duration(seconds: 1)).whenComplete(() async {
          //   await databaseNotifier.submitUserData(
          //       context: context,
          //       signedUser:
          //           SignedUser(username, useremail, userfullname, userdob));
          // });
          // return res.toJson();
        }
      }
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      var errorResponse = error.message;
      var errorCode = error.code;
      switch (errorCode) {
        case 429: //! Too many requests
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again!");
          break;
        case 400:
          SnackbarUtility.showSnackbar(
              context: context, message: errorResponse!);
          break;
        case 409:
          SnackbarUtility.showSnackbar(
              context: context, message: "User already exists.");
          break;
      }
    } catch (error) {
      _logger.i(error);
    }
  }

//! Login to existing account
  Future login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      var response =
          await _account.createSession(email: email, password: password);
      if (response.data != null) {
        _logger.i(response.statusCode);
        var loginStatus = response.statusCode;
        if (loginStatus == 201) {
          navigationUtility.navigateTo(context, HomeRoute);
          SnackbarUtility.showSnackbar(
              context: context, message: "User logged in succesfully!");
          return response;
        }
      }
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      var errorCode = error.code;
      var errorMessage = error.message;
      switch (errorCode) {
        case 400: //! Invalid email@
          SnackbarUtility.showSnackbar(
              context: context, message: errorMessage!);
          break;
        case 401: //! Wrong password
          SnackbarUtility.showSnackbar(
              context: context, message: "Wrong user password.");
          break;
        case 429: //! Server error
          SnackbarUtility.showSnackbar(
              context: context, message: "Server error, Try again.");
          break;
      }
    }
  }

  //! Get current session of the user
  Future getCurrentUserSession({required BuildContext context}) async {
    try {
      var res = await _account.get();
      var responseStatusCode = res.statusCode;
      if (responseStatusCode == 200) {
        var user = User.fromMap(res.data);
        // _logger.i("${user.name} has logged in");
        return user.toJson();
      }
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      var responseCode = error.code;
      if (responseCode == 401) {
        SnackbarUtility.showSnackbar(
            context: context,
            message: "Session expired. Please login one more time.");
      }
    }
  }

  //! Log out/Remove current session
  Future logOut({required BuildContext context}) async {
    final NavigationUtility navigationUtility = new NavigationUtility();
    try {
      var response = await _account.deleteSession(sessionId: "current");
      _logger.i(response.statusCode);
      var responseCode = response.statusCode;
      if (responseCode == 204) {
        SnackbarUtility.showSnackbar(
            context: context, message: "Logged out successfully.");
        navigationUtility.navigateTo(context, LoginRoute);
      }
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      var responseCode = error.code;
      if (responseCode == 401) {
        SnackbarUtility.showSnackbar(
            context: context, message: "Session expired. Login one more time.");
      }
    }
  }
}
