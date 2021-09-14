import 'dart:io';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupNotifier extends ChangeNotifier {
  File? _imageAsAFile;
  File? get imageAsAFile => _imageAsAFile;

  String _userProfilePicture = "";
  String get userProfilePicture => _userProfilePicture;

  String _uploadedImageId = "";
  String get uploadedImageId => _uploadedImageId;

  pickUserImage() async {
    final picker = ImagePicker();
    var _pickerImage = await picker.pickImage(source: ImageSource.gallery);
    if (_pickerImage != null) {
      _imageAsAFile = File(_pickerImage.path);
      notifyListeners();
      _userProfilePicture = _pickerImage.path;
      notifyListeners();
      return _pickerImage.path;
    }
  }

  clearUserImage() {
    _imageAsAFile = null;
    notifyListeners();
  }

  Future uploadProfilePicture({required BuildContext context}) async {
    print(
        "=================================UPLOADING PROFILE PICTURE=============================");
    var imageId = await StorageService.createInstance.uploadUserProfilePicture(
        imagePath: _userProfilePicture, context: context);
    if (imageId.toString().isNotEmpty) {
      _uploadedImageId = imageId;
      print(
          "=================================PROFILE PICTURE UPLOADED : $_uploadedImageId=============================");
      notifyListeners();
    }
  }

  String _userGender = "";
  String get userGender => _userGender;

  setUserGender({required String candidateGender}) {
    _userGender = candidateGender;
    notifyListeners();
  }
}
