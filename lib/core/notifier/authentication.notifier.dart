import 'dart:math';

import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/authentication.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationNotifier extends ChangeNotifier {
  bool? _accountAlreadyExists;
  bool? get accountAlreadyExists => _accountAlreadyExists;

  bool? _checkedTandC = false;
  bool? get checkedTandC => _checkedTandC;

  void toggleTermsAndConditionCheck() {
    _checkedTandC = !_checkedTandC!;
    notifyListeners();
  }

  Future signUp(
      {required BuildContext context,
      required String userfullname,
      required SignedUser signedUser,
      required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      if (userfullname.isNotEmpty &&
          username.isNotEmpty &&
          useremail.isNotEmpty &&
          userpassword.isNotEmpty) {
        await AppwriteAuthenticationAPI.createInstance.signUp(
            signedUser: signedUser,
            context: context,
            username: username,
            useremail: useremail,
            userfullname: userfullname,
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
      // print(error);
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
}
