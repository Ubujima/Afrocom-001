import 'package:flutter/cupertino.dart';

class StorageNotifier extends ChangeNotifier {
  String? _postImage;
  String? get postImage => _postImage;

  // Future<String?> uploadUserProfilePicture(
  //     {required BuildContext context}) async {
  //   try {
  //     var imageUploaded = await StorageService.createInstance
  //         .uploadUserProfilePicture(context: context);
  //     if (imageUploaded != null) {
  //       _postImage = imageUploaded;
  //       return imageUploaded;
  //     } else {
  //       SnackbarUtility.showSnackbar(
  //           context: context, message: "Something went wrong, Try again.");
  //     }
  //   } catch (error) {
  //     SnackbarUtility.showSnackbar(
  //         context: context, message: "Something went wrong, Try again.");
  //   }
  // }
}
