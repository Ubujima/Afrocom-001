import 'package:afrocom/core/services/authentication.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationNotifier extends ChangeNotifier {
  Future signUp(
      {required BuildContext context,
      required String userfullname,
      required String username,
      required String useremail,
      required String userpassword}) async {
    try {
      if (userfullname.isNotEmpty &&
          username.isNotEmpty &&
          useremail.isNotEmpty &&
          userpassword.isNotEmpty) {
        await AppwriteAuthenticationAPI.createInstance.signUp(
            context: context,
            username: username,
            useremail: useremail,
            userfullname: userfullname,
            userpassword: userpassword);
      } else {
        SnackbarUtility.showSnackbar(
            context: context, message: "Fill the required details");
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
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, try again");
    }
  }

  Future getCurrentUserSession({required BuildContext context}) async {
    try {
      return await AppwriteAuthenticationAPI.createInstance
          .getCurrentUserSession(context: context);
      // switch (userStatusCode) {
      //   case 200:
      //     navigationUtility.navigateTo(context, HomeRoute);
      //     break;
      //   default:
      //     {
      //       navigationUtility.navigateTo(context, LoginRoute);
      //     }
      // }
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
}
