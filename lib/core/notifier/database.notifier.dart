import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class DatabaseNotifier extends ChangeNotifier {
  Future submitUserData(
      {required BuildContext context, required SignedUser signedUser}) async {
    try {
      await DatabaseService.createInstance
          .submitUserData(signedUser: signedUser, context: context);
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }
}
