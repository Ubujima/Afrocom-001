import 'dart:io';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupNotifier extends ChangeNotifier {
  File? _imageAsAFile;
  File? get imageAsAFile => _imageAsAFile;

  String _userProfilePicture = "";
  String get userProfilePicture => _userProfilePicture;

  String? _uploadedImageId;
  String? get uploadedImageId => _uploadedImageId;

  pickUserImage() async {
    final picker = ImagePicker();
    var _pickerImage = await picker.pickImage(source: ImageSource.gallery);
    if (_pickerImage != null) {
      _imageAsAFile = File(_pickerImage.path);
      _userProfilePicture = _pickerImage.path;
      print(_userProfilePicture);
      notifyListeners();
      return _pickerImage.path;
    }
  }

  uploadProfilePicture({required BuildContext context}) async {
    SnackbarUtility.showLoadingSnackbar(
        time: 5, title: "Uploading image", context: context);
    var imageId = await StorageService.createInstance.uploadUserProfilePicture(
        imagePath: _userProfilePicture, context: context);
    if (imageId.toString().isNotEmpty) {
      _uploadedImageId = imageId;
      print("Uploaded image id => $uploadedImageId");
      notifyListeners();
    }
  }
}
