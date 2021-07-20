import 'package:afrocom/core/api/appwrite.authentication.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationNotifier extends ChangeNotifier {
  Future signUp(
      {required BuildContext context,
      required String username,
      required String email,
      required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await AppwriteAuthentication.signUp(
                name: username, email: email, password: password)
            .then((value) {
          print(value);
        });
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
}
