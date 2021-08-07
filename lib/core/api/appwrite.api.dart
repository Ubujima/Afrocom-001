import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';

class AppwriteAPI {
  static AppwriteAPI? _instance;
  late Client _client;
  final NavigationUtility navigationUtility = new NavigationUtility();
  AppwriteAPI._initialize() {
    _client = Client(
      endPoint: AppwriteCredentials.AppwriteLocalEndpoint,
    ).setProject(AppwriteCredentials.AppwriteLocalProjectID).setSelfSigned();
  }
  static AppwriteAPI get createInstance {
    if (_instance == null) {
      _instance = AppwriteAPI._initialize();
    }
    return _instance!;
  }
}
