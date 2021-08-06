import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/core/models/user.model.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';

class AppwriteAPI {
  static AppwriteAPI? _instance;
  late Client _client;
  late Database _database;
  late Account _account;
  final NavigationUtility navigationUtility = new NavigationUtility();
  AppwriteAPI._initialize() {
    _client = Client(
      endPoint: AppwriteCredentials.AppwriteLocalEndpoint,
    ).setProject(AppwriteCredentials.AppwriteLocalProjectID).setSelfSigned();
    _account = Account(_client);
    _database = Database(_client);
  }
  static AppwriteAPI get createInstance {
    if (_instance == null) {
      _instance = AppwriteAPI._initialize();
    }
    return _instance!;
  }

  Future getUser(BuildContext context) async {
    dynamic res;
    try {
      res = await _account.get();
      var user = User.fromMap(res.data);
      SnackbarUtility.showSnackbar(
          context: context, message: "${user.name} has logged in");
      return user;
    } on AppwriteException catch (e) {
      SnackbarUtility.showSnackbar(context: context, message: e.message!);
    }
  }

  Future logOut(BuildContext context) async {
    await _account.deleteSession(sessionId: "current").whenComplete(() {
      navigationUtility.navigateTo(context, LoginRoute);
    });
  }

  //! Database
  Future addData({required dynamic data, required String collectionId}) async {
    await _database.createDocument(collectionId: collectionId, data: data);
  }
}
