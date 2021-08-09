// import 'package:afrocom/core/models/oAuth/facebook_user.model.dart';
// import 'package:afrocom/core/models/signeduser.model.dart';
// import 'package:afrocom/core/notifier/database.notifier.dart';
// import 'package:afrocom/core/services/OAuth2.service.dart';
// import 'package:afrocom/meta/utilities/snackbar.utility.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// enum UserLoggedType { EmailUser, FacebookUser, GoogleUser }

// class OAuthNotifier extends ChangeNotifier {
//   UserLoggedType? _userLoggedType;
//   UserLoggedType? get userLoggedType => _userLoggedType;

//   Future loginWithFacebook({required BuildContext context}) async {
//     try {
//       var _facebookData =
//           await OAUthService.createInstance.facebookLogin(context: context);
//       final response = FacebookUser.fromJson(_facebookData);
//       if (response.email.isNotEmpty &&
//           response.name.isNotEmpty &&
//           response.picture.data.url.isNotEmpty) {
//         _userLoggedType = UserLoggedType.FacebookUser;
//         notifyListeners();
//         SnackbarUtility.showSnackbar(
//             context: context, message: "${response.name} has logged in!");
//         final databaseNotifier =
//             Provider.of<DatabaseNotifier>(context, listen: false);
//         SnackbarUtility.showLoadingSnackbar(
//             time: 6, title: "Processing...", context: context);
//         Future.delayed(Duration(seconds: 8)).whenComplete(() async {
//           final username = response.name;
//           final userfirstname = response.name.split(" ")[0];
//           final userlastname = response.name.split(" ")[1];
//           final useremail = response.email;
//           await databaseNotifier.submitUserData(
//               context: context,
//               signedUser:
//                   SignedUser(username, useremail, userfirstname, userlastname));
//         });
//       } else {
//         SnackbarUtility.showSnackbar(
//             context: context, message: "Server error, Try again.");
//       }
//     } catch (e) {
//       SnackbarUtility.showSnackbar(
//           context: context, message: "Server error, Try again.");
//     }
//   }
// }
