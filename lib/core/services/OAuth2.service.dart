import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:appwrite/appwrite.dart';

class OAUthService {
  late Client _client;
  static OAUthService? _instance;
  late Account _account;

  OAUthService._initialize() {
    _client = Client(endPoint: AppwriteCredentials.AppwriteLocalEndpoint)
        .setProject(AppwriteCredentials.AppwriteLocalProjectID)
        .setSelfSigned(status: true);
    _account = Account(_client);
    print(_account.client.endPoint);
  }
  static OAUthService get createInstance {
    print("Initializing instance");
    if (_instance == null) {
      _instance = OAUthService._initialize();
    }
    return _instance!;
  }

  Future facebookLogin({required BuildContext context}) async {
    var loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );
    var status = loginResult.status;
    switch (status) {
      case LoginStatus.cancelled:
        SnackbarUtility.showSnackbar(
            context: context, message: "Login cancelled.");
        break;
      case LoginStatus.failed:
        SnackbarUtility.showSnackbar(
            context: context, message: "Something went wrong, Try again");
        break;
      case LoginStatus.operationInProgress:
        break;
      case LoginStatus.success:
        var loginData = await FacebookAuth.instance.getUserData();
        if (loginData.isNotEmpty) {
          return loginData;
        }
        break;
    }
  }
}
