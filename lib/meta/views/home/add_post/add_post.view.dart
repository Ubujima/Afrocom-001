// import 'dart:convert';
// import 'package:afrocom/app/constants/images.tag.dart';
// import 'package:afrocom/core/models/post.model.dart';
// import 'package:afrocom/core/notifier/authentication.notifier.dart';
// import 'package:afrocom/core/notifier/database.notifier.dart';
// import 'package:afrocom/core/notifier/storage.notifier.dart';
// import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
// import 'package:afrocom/meta/widgets/custom_button.dart';
// import 'package:provider/provider.dart';

// class AddPost extends StatefulWidget {
//   @override
//   _AddPostState createState() => _AddPostState();
// }

// class _AddPostState extends State<AddPost> {
//   @override
//   Widget build(BuildContext context) {
//     final databaseNotifier =
//         Provider.of<DatabaseNotifier>(context, listen: false);
//     final storageNotifier =
//         Provider.of<StorageNotifier>(context, listen: false);
//     final authenticationNotifier =
//         Provider.of<AuthenticationNotifier>(context, listen: false);
//     var currentDate = DateTime.now();
//     final captionController = TextEditingController();
//     return Scaffold(
//       backgroundColor: KConstantColors.bgColor,
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   child: TextField(
//                     controller: captionController,
//                     decoration: new InputDecoration(
//                         filled: true,
//                         hintText: "Write something...",
//                         hintStyle: new TextStyle(
//                             color: KConstantColors.textColor, fontSize: 16.0),
//                         fillColor: KConstantColors.darkColor,
//                         border: new OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius:
//                                 BorderRadius.all(const Radius.circular(10.0)))),
//                     style: KConstantTextStyles.MBody1(fontSize: 18),
//                     minLines: 5,
//                     maxLines: 10,
//                   ),
//                 ),
//               ),
//               vSizedBox3,
//               Container(
//                 width: 400,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomButton(
//                       iconData: Icons.camera,
//                       height: 50,
//                       buttonColor: KConstantColors.bgColorFaint,
//                       width: 180,
//                       tag: "Camera",
//                       onPressed: () {},
//                     ),
//                     CustomButton(
//                       iconData: Icons.camera,
//                       height: 50,
//                       width: 180,
//                       buttonColor: KConstantColors.bgColorFaint,
//                       tag: "Gallery",
//                       onPressed: () async {
//                         // await storageNotifier.uploadFile(context: context);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               vSizedBox1,
//               CustomButton(
//                 buttonColor: KConstantColors.bgColorFaint,
//                 iconData: Icons.document_scanner,
//                 height: 50,
//                 width: 380,
//                 tag: "Attach a document",
//                 onPressed: () {},
//               ),
//               vSizedBox3,
//               Container(
//                 width: 400,
//                 child: Column(
//                   children: [
//                     vSizedBox1,
//                     Text(
//                       "What's your mood?",
//                       style: KConstantTextStyles.MBody1(fontSize: 16),
//                     ),
//                     vSizedBox1,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.transparent,
//                           backgroundImage: AssetImage(ImageTags.HappyFace),
//                         ),
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.transparent,
//                           backgroundImage: AssetImage(ImageTags.AngryFace),
//                         ),
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.transparent,
//                           backgroundImage: AssetImage(ImageTags.ArrogantFace),
//                         ),
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.transparent,
//                           backgroundImage: AssetImage(ImageTags.ShockFace),
//                         )
//                       ],
//                     ),
//                     vSizedBox1
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                     color: KConstantColors.darkColor,
//                     borderRadius: BorderRadius.circular(5)),
//               ),
//               vSizedBox4,
//               GestureDetector(
//                 onTap: () async {
//                       context: context);
//                   // Future.delayed(Duration(seconds: 2)).whenComplete(() async {
//                   //   await databaseNotifier.createPost(
//                   //       context: context,
//                   //       post: Post(
//                   //           postcaption,
//                   //           postuser ?? "",
//                   //           currentDate.toString(),
//                   //           "India",
//                   //           postImage ?? "",
//                   //           "",
//                   //           ""));
//                   // });
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 200,
//                   child: Center(
//                       child: Text(
//                     "Post",
//                     style: KConstantTextStyles.BHeading1(fontSize: 20),
//                   )),
//                   decoration: BoxDecoration(
//                       color: KConstantColors.greenColor,
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
