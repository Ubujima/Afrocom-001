import 'package:afrocom/app/constants/appwrite.credentials.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:appwrite/appwrite.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  static StorageService? _instance;
  late Client _client;
  late Storage _storage;

  StorageService._initialize() {
    _client = Client(endPoint: AppwriteCredentials.AppwriteEndpoint)
        .setProject(AppwriteCredentials.AppwriteProjectID)
        .setSelfSigned();
    _storage = Storage(_client);
  }
  static StorageService get createInstance {
    if (_instance == null) {
      _instance = StorageService._initialize();
    }
    return _instance!;
  }

  pickUserImage() async {
    final picker = ImagePicker();
    var _pickerImage = await picker.pickImage(source: ImageSource.gallery);
    if (_pickerImage != null) {
      return _pickerImage.path;
    }
  }

  Future uploadFile({required BuildContext context}) async {
    var _pickedFile = await pickUserImage();
    try {
      var _file = await MultipartFile.fromFile(_pickedFile);
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
