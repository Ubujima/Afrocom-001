import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/core/models/oAuth/facebook_user.model.dart';
import 'package:afrocom/core/notifier/cache.notifier.dart';
import 'package:afrocom/core/services/OAuth2.service.dart';
import 'package:afrocom/core/services/authentication.service.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.exports.dart';
import 'package:flutter/cupertino.dart';

enum UserLoggedType { EmailUser, OAuthUser }

class AuthenticationNotifier extends ChangeNotifier {
  UserLoggedType? _userLoggedType;
  UserLoggedType? get userLoggedType => _userLoggedType;

  bool? _accountAlreadyExists;
  bool? get accountAlreadyExists => _accountAlreadyExists;

  bool? _checkedTandC = false;
  bool? get checkedTandC => _checkedTandC;

  void toggleTermsAndConditionCheck() {
    _checkedTandC = !_checkedTandC!;
    notifyListeners();
  }

  String? _currentUserDocumentId;
  String? get currentUserDocumentId => _currentUserDocumentId;

  String? _currentUserImage;
  String? get currentUserImage => _currentUserImage;

  Future loginWithFacebook({required BuildContext context}) async {
    try {
      var _facebookData =
          await OAUthService.createInstance.facebookLogin(context: context);
      final response = FacebookUser.fromJson(_facebookData);
      if (response.email.isNotEmpty &&
          response.name.isNotEmpty &&
          response.picture.data.url.isNotEmpty) {
        await CacheService.writeCache(
            key: "facebookuser", value: response.email);
        _currentUserImage = response.picture.data.url;
        notifyListeners();
        _userLoggedType = UserLoggedType.OAuthUser;
        notifyListeners();
        SnackbarUtility.showSnackbar(
            context: context, message: "${response.name} has logged in!");
        final useremail = response.email;
        var isUserExists = await DatabaseService.createInstance.checkIfExists(
            dataKey: "useremail",
            identifier: useremail,
            collectionId: DatabaseCredentials.UserCollectionID);
        if (!isUserExists) {
          Future.delayed(Duration(seconds: 8)).whenComplete(() async {
            notifyListeners();
          });
        } else {
          NavigationUtility().navigateTo(context, HomeRoute);
          SnackbarUtility.showSnackbar(
              context: context,
              message: "User data is already submitted in database");
        }
      } else {
        SnackbarUtility.showSnackbar(
            context: context, message: "Server error, Try again.");
      }
    } catch (e) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Server error, Try again.");
    }
  }

  Future loginWithGoogle({required BuildContext context}) async {
    try {
      await AppwriteAuthenticationAPI.createInstance
          .googleLogin(context: context);
    } catch (e) {
      print(e);
    }
  }

  Future signUp(
      {required BuildContext context,
      required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      if (username.isNotEmpty &&
          useremail.isNotEmpty &&
          userpassword.isNotEmpty) {
        await AppwriteAuthenticationAPI.createInstance.signUp(
            context: context,
            username: username,
            useremail: useremail,
            userpassword: userpassword);
      } else {
        SnackbarUtility.showSnackbar(
            context: context, message: "Fill the required (*) details.");
      }
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, try again");
    }
  }

  Future login({
    required BuildContext context,
    required String useremail,
    required String userpassword,
  }) async {
    try {
      if (useremail.isNotEmpty && userpassword.isNotEmpty) {
        await AppwriteAuthenticationAPI.createInstance
            .login(context: context, email: useremail, password: userpassword);
      } else {
        SnackbarUtility.showSnackbar(
            context: context, message: "Fill the required details");
      }
    } catch (error) {
      print(error);
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, try again");
    }
  }

  Future getCurrentUserSession({required BuildContext context}) async {
    try {
      var user = await AppwriteAuthenticationAPI.createInstance
          .getCurrentUserSession(context: context);
      return user;
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, try again");
    }
  }

  Future logOut({required BuildContext context}) async {
    try {
      await AppwriteAuthenticationAPI.createInstance.logOut(context: context);
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, try again");
    }
  }

//!<------------------------------------CHECK IF USER LOGGED IN--------------------------------------->

  bool _isUserLogged = false;
  bool get isUserLogged => _isUserLogged;

  checkUserIsLogged({required BuildContext context}) async {
    var user = await AppwriteAuthenticationAPI.createInstance
        .getCurrentUserSession(context: context);
    if (user != null) {
      _isUserLogged = true;
      notifyListeners();
    }
  }
}
