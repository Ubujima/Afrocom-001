import 'package:afrocom/core/models/post.model.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/cupertino.dart';

class DatabaseNotifier extends ChangeNotifier {
  Future submitUserData(
      {required BuildContext context, required SignedUser signedUser}) async {
    try {
      await DatabaseService.createInstance
          .submitUserData(signedUser: signedUser, context: context);
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }

  Future createPost({required BuildContext context, required Post post}) async {
    // try {
    //   if (post.documents..isNotEmpty &&
    //       post.postusername.isNotEmpty &&
    //       post.postlocation.isNotEmpty &&
    //       post.postdate.isNotEmpty) {
    //     return await DatabaseService.createInstance
    //         .createPost(context: context, post: post);
    //   } else {
    //     SnackbarUtility.showSnackbar(
    //         context: context, message: "Fill the required details");
    //   }
    // } catch (error) {
    //   SnackbarUtility.showSnackbar(
    //       context: context, message: "Something went wrong, Try again");
    // }
  }

  Future<Post?> fetchPosts({required BuildContext context}) async {
    try {
      var posts =
          await DatabaseService.createInstance.fetchPosts(context: context);
      // return posts;
    } catch (error) {
      SnackbarUtility.showSnackbar(
          context: context, message: "Something went wrong, Try again");
    }
  }
}
