import 'package:afrocom/core/api/appwrite.api.dart';

class AppwriteAuthentication {
  static Future signUp(
      {required String name,
      required String email,
      required String password}) async {
    await AppwriteAPI.createInstance
        .signUp(name: name, email: email, password: password);
  }

  static Future<void> login(
      {required String email, required String password}) async {
    await AppwriteAPI.createInstance.login(email: email, password: password);
  }
}
