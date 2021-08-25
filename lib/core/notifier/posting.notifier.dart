import 'dart:convert';
import 'dart:io';
import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/core/models/fetch_posts.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostingNotifier extends ChangeNotifier {
  String? _pickedVideoPath;
  String? get pickedVideoPath => _pickedVideoPath;

  XFile? _pickedVideoFile;
  XFile? get pickedVideoFile => _pickedVideoFile;

  String? _selectedPostType = "Campaign";
  String? get selectedPostType => _selectedPostType;

  assignSelectedPostTyle({required String candidatePostType}) {
    _selectedPostType = candidatePostType;
    notifyListeners();
  }

  String? _moodLogoValue = "Happy";
  String? get moodLogoValue => _moodLogoValue;
  String? _moodLogo = ImageTags.HappyFace;
  String? get moodLogo => _moodLogo;

  assignMoodLogo({required String candidateMoodLogo}) {
    _moodLogo = candidateMoodLogo;
    notifyListeners();
    switch (candidateMoodLogo) {
      case ImageTags.HappyFace:
        {
          _moodLogoValue = "Happy";
        }
        break;
      case ImageTags.ArrogantFace:
        {
          _moodLogoValue = "Arrogant";
        }
        break;
      case ImageTags.ShockFace:
        {
          _moodLogoValue = "Shock";
        }
        break;
      case ImageTags.AngryFace:
        {
          _moodLogoValue = "Angry";
          break;
        }
    }
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

  //!<---------------------------------------- FETCH POSTS---------------------------------------------------->
  Future fetchPosts({required BuildContext context}) async {
    try {
      var response =
          await DatabaseService.createInstance.fetchPosts(context: context);
      var modelledData = FetchPosts.fromJson(response);
      var _data = modelledData.documents;
      return _data;
    } catch (e) {
      print(e.toString());
    }
  }

  Stream posts({required BuildContext context}) async* {
    yield await fetchPosts(context: context);
  }
}
