import 'package:afrocom/core/api/appwrite.api.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class AppwriteAuthentication {
  static Future signUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    await AppwriteAPI.createInstance
        .signUp(context: context, name: name, email: email, password: password);
  }

  static Future<void> login(
      {required String email, required String password}) async {
    await AppwriteAPI.createInstance.login(email: email, password: password);
  }
}
