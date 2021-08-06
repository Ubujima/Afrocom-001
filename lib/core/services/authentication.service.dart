import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/models/user.model.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
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
    _client = Client(endPoint: AppwriteCredentials.AppwriteLocalEndpoint)
        .setProject(AppwriteCredentials.AppwriteLocalProjectID)
        .setSelfSigned(status: true);
    _account = Account(_client);
    print("The endpoint is...");
    print(_account.client.endPoint);
  }
  static AppwriteAuthenticationAPI get createInstance {
    print("Initializing instance");
    if (_instance == null) {
      _instance = AppwriteAuthenticationAPI._initialize();
    }
    return _instance!;
  }

  //! Create new account and submit the data in database
  Future signUp(
      {required BuildContext context,
      required SignedUser signedUser,
      required String userfullname,
      required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      print("Executing sign up process...");
      final databaseNotifier =
          Provider.of<DatabaseNotifier>(context, listen: false);
      // //! Response  from Appwrite
      var response = await _account.create(
          name: username, email: useremail, password: userpassword);
      if (response.data != null) {
        var responseStatusCode = response.statusCode;
        print("Signing process status code : $responseStatusCode");
        print("Signing process response : ${response.data}");
        //   //! Adding data only when status code is 201
        if (responseStatusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: KConstantColors.greenColor,
                duration: Duration(seconds: 6),
                content: Row(children: [
                  SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator()),
                  hSizedBox2,
                  Text(
                    "Creating new account, Please wait",
                    style: KConstantTextStyles.BHeading1(
                        fontSize: SizeConfig.sfontSize!),
                  )
                ])),
          );
          await databaseNotifier
              .submitUserData(context: context, signedUser: signedUser)
              .whenComplete(() {
            Future.delayed(Duration(seconds: 8)).whenComplete(() {
              Navigator.of(context).pushNamed(HomeRoute);
            });
          });
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
      print("Executing login process : ${_account.client.initialized}");
      var response =
          await _account.createSession(email: email, password: password);
      if (response.data != null) {
        var loginStatus = response.statusCode;
        print("Login process status code : $loginStatus");
        print("Login process response : ${response.data}");
        if (loginStatus == 201) {
          SnackbarUtility.showLoadingSnackbar(
              time: 3, title: "Logging in...", context: context);
          Future.delayed(Duration(seconds: 5)).whenComplete(
              () => {navigationUtility.navigateTo(context, HomeRoute)});
          return response;
        }
      }
    } on AppwriteException catch (error) {
      _logger.i(error.code, error.message);
      var errorCode = error.code;
      var errorMessage = error.message;
      switch (errorCode) {
        case 400: //! Invalid email
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
        print(res.statusCode);
        print(res.data);
        var user = User.fromMap(res.data);
        return user.toJson();
      }
    } on AppwriteException catch (error) {
      _logger.i(error.response);
      _logger.i(error.code);
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
        SnackbarUtility.showLoadingSnackbar(
            time: 2, title: "Logging out", context: context);
        Future.delayed(Duration(seconds: 2)).whenComplete(() {
          navigationUtility.navigateTo(context, LoginRoute);
        });
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
