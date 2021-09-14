import 'dart:io';
import 'package:afrocom/app/constants/cloudinary.credentials.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostingNotifier extends ChangeNotifier {
  String? _pickedVideoPath;
  String? get pickedVideoPath => _pickedVideoPath;

  XFile? _pickedVideoFile;
  XFile? get pickedVideoFile => _pickedVideoFile;

  String _uploadedVideoURL = "";
  String get uploadedVideoURL => _uploadedVideoURL;

  String? _selectedPostType = "";
  String? get selectedPostType => _selectedPostType;

  assignSelectedPostTyle({required String candidatePostType}) {
    _selectedPostType = candidatePostType;
    notifyListeners();
  }

  //!<-----------------------------------------------ADDING SUBCATEGORIES----------------------------------------------->
  String _subCategory = "";
  String get subCategory => _subCategory;

  assignSubcategory({required String candidateSubCategory}) {
    _subCategory = candidateSubCategory;
    print(_subCategory);
    notifyListeners();
  }

  //! Select images
  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  void pickImages({required ImageSource source}) async {
    final picker = ImagePicker();
    var _pickedImage = await picker.pickImage(source: source);
    _selectedImage = File(_pickedImage!.path);
    if (_pickedImage.path.isNotEmpty) {
      _pickedVideoPath = null;
    }
    notifyListeners();
  }

  Future<String> pickVideos() async {
    final picker = ImagePicker();
    var video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _pickedVideoFile = video;
      _pickedVideoPath = video.path;
      _selectedImage = null;
      notifyListeners();
    }
    return _pickedVideoPath!;
  }

  void clearImages() {
    _selectedImage = null;
    notifyListeners();
  }

  void clearVideo() {
    _pickedVideoPath = null;
    _pickedVideoFile = null;
    notifyListeners();
  }

  Future uploadPostVideo({required BuildContext context}) async {
    final _cloudinary = Cloudinary(CloudinaryCredentials.APIKEY,
        CloudinaryCredentials.APISecret, CloudinaryCredentials.CLOUDNAME);
    try {
      await _cloudinary
          .uploadFile(
              filePath: _pickedVideoFile!.path,
              resourceType: CloudinaryResourceType.video,
              folder: "afrocom")
          .then((value) {
        _uploadedVideoURL = value.secureUrl!;
        if (_uploadedVideoURL.isNotEmpty) {
          print(
              "=========VIDEO IS UPLOADED : $_uploadedVideoURL==============");
        }
        notifyListeners();
        return _uploadedVideoURL;
      });
    } catch (e) {
      print(e);
    }
  }
}
