import 'package:afrocom/core/api/appwrite.authentication.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final DatabaseService databaseService = new DatabaseService();
  Future signUp(
      {required BuildContext context,
      required String username,
      required String userfullname,
      required String useremail,
      required String password}) async {
    try {
      if (useremail.isNotEmpty && password.isNotEmpty) {
        await AppwriteAuthentication.signUp(
                context: context,
                name: username,
                email: useremail,
                password: password)
            .whenComplete(() {
          Future.delayed(Duration(seconds: 3));
          databaseService.addUserToDB(
              user: SignedUser(username, useremail, userfullname));
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
