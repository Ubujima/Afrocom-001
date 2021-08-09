import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';

class StorageService {
  static StorageService? _instance;
  late Client _client;
  late Storage _storage;

  StorageService._initialize() {
    _client = Client(endPoint: AppwriteCredentials.AppwriteLocalEndpoint)
        .setProject(AppwriteCredentials.AppwriteLocalProjectID)
        .setSelfSigned();
    _storage = Storage(_client);
  }
  static StorageService get createInstance {
    if (_instance == null) {
      _instance = StorageService._initialize();
    }
    return _instance!;
  }

  Future uploadUserProfilePicture(
      {required String imagePath, required BuildContext context}) async {
    try {
      print("Uploading profile picture");
      var _file = await MultipartFile.fromFile(imagePath);
      final response =
          await _storage.createFile(file: _file, read: ["*"], write: ["*"]);
      final resStatusCode = response.statusCode;
      if (resStatusCode == 201) {
        final imageId = response.data['\$id'];
        return imageId;
      }
    } on AppwriteException catch (error) {
      SnackbarUtility.showSnackbar(context: context, message: error.message!);
    }
  }
}
