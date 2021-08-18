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

  //!<-----------------------------------------UPLOAD POST IMAGE----------------------------------------<
  Future uploadPostImage(
      {required String imagePath, required BuildContext context}) async {
    try {
      var _file = await MultipartFile.fromFile(imagePath);
      final response =
          await _storage.createFile(file: _file, read: ["*"], write: ["*"]);
      final resStatusCode = response.statusCode;
      if (resStatusCode == 201) {
        SnackbarUtility.showSnackbar(
            context: context, message: "Data uploaded to storage");
        final imageId = response.data['\$id'];
        return imageId;
      }
    } on AppwriteException catch (error) {
      SnackbarUtility.showSnackbar(context: context, message: error.message!);
    }
  }

  //!<--------------------------------------------FETCH POST IMAGES-------------------------------------------->
  Future fetchPostImage(
      {required BuildContext context, required dynamic fileId}) async {
    try {
      var _image = await _storage.getFileView(fileId: fileId);
      return _image.data;
    } on AppwriteException catch (error) {
      SnackbarUtility.showSnackbar(context: context, message: error.message!);
    } catch (e) {}
  }

  //! <------------------------------------------DELETE POST IMAGE---------------------------------------------->
  Future deletePostImage(
      {required dynamic postId, required BuildContext context}) async {
    try {
      var _image = await _storage.deleteFile(fileId: postId);
      var resStatusCode = _image.statusCode;
      print(resStatusCode);
    } on AppwriteException catch (error) {
      SnackbarUtility.showSnackbar(context: context, message: error.message!);
    } catch (e) {}
  }
}
