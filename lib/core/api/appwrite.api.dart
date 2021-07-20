import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/core/models/user.model.dart';
import 'package:afrocom/meta/utilities/navigation.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';

class AppwriteAPI {
  static AppwriteAPI? _instance;
  late Client _client;
  late Database _database;
  late Storage _storage;
  late Account _account;
  final NavigationUtility navigationUtility = new NavigationUtility();
  AppwriteAPI._initialize() {
    _client = Client(
      endPoint: AppwriteCredentials.AppwriteEndpoint,
    ).setProject(AppwriteCredentials.AppwriteProjectID).setSelfSigned();
    _account = Account(_client);
    _database = Database(_client);
    _storage = Storage(_client);
  }
  static AppwriteAPI get createInstance {
    if (_instance == null) {
      _instance = AppwriteAPI._initialize();
    }
    return _instance!;
  }

  //! Authentication
  Future signUp(
      {required String name, required String email, required String password}) {
    return _account
        .create(name: name, email: email, password: password)
        .then((value) {
      print(value);
    }).catchError((error) {
      print(error);
    });
  }

  Future login({required String email, required String password}) {
    return _account
        .createSession(email: email, password: password)
        .then((value) {
      print(value);
    }).catchError((error) {
      print(error);
    });
  }

  Future getUser(BuildContext context) async {
    dynamic res;
    try {
      res = await _account.get();
      return User.fromMap(res.data);
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
  Future addData({required String data}) async {
    await _database
        .createDocument(collectionId: "60f60c1c07767", data: {"title": data});
  }

  //! Storage
}
