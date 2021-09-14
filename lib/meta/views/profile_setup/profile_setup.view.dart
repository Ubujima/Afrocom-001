import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/profile_setup.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/utilities/progress_controller.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileSetupView extends StatefulWidget {
  @override
  _ProfileSetupViewState createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends State<ProfileSetupView> {
  TextEditingController userBioController = TextEditingController();
  TextEditingController userPhoneNumberController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  @override
  void initState() {
    userBioController = TextEditingController();
    userPhoneNumberController = TextEditingController();
    originController = TextEditingController();
    addressController = TextEditingController();
    professionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final utilityNotifier =
        Provider.of<UtilityNotifier>(context, listen: false);
    final _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    ProfileSetupNotifier profileSetupNotifier(bool renderUI) =>
        Provider.of<ProfileSetupNotifier>(context, listen: false);
    final _databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    optionButton(
        {required BuildContext context,
        required dynamic onTap,
        required String title}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 100,
          child: Center(
              child: Text(
            title,
            style: KConstantTextStyles.BoldText(fontSize: 14),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.greenAccent,
          ),
        ),
      );
    }

    _genderBox({required String candidateGender}) {
      return GestureDetector(
        onTap: () {
          profileSetupNotifier(false)
              .setUserGender(candidateGender: candidateGender);
        },
        child: Container(
          height: 40,
          width: 100,
          child: Center(
              child: Text(
            candidateGender,
            style: KConstantTextStyles.BoldText(fontSize: 14),
          )),
          decoration: BoxDecoration(
              color: profileSetupNotifier(true).userGender == candidateGender
                  ? Colors.greenAccent
                  : KConstantColors.textColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8)),
        ),
      );
    }

    _borderedButton(
        {required Color color, required dynamic onTap, required String title}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 180,
          child: Center(
              child: Text(
            title,
            style: KConstantTextStyles.BoldText(fontSize: 14),
          )),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: KConstantColors.textColor),
              borderRadius: BorderRadius.circular(8)),
        ),
      );
    }

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _authenticationNotifier.getCurrentUserSession(context: context);
      //   },
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                SizeConfig.verticalSizedBox(context: context, factor: 0.05),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new, size: 16)),
                    Text("Fill the information to get started",
                        style: KConstantTextStyles.BoldText(fontSize: 16)),
                  ],
                ),
                SizeConfig.verticalSizedBox(context: context, factor: 0.05),
                CommonWidgets.customTextField(
                    minLines: 2,
                    hintText: "Describe yourself in brief*",
                    descriptionController: userBioController),
                SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Phone number*",
                    descriptionController: userPhoneNumberController),
                SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter address",
                    descriptionController: addressController),
                SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter Profession",
                    descriptionController: professionController),
                SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter origin",
                    descriptionController: originController),
                SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                if (profileSetupNotifier(true).imageAsAFile != null)
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        FileImage(profileSetupNotifier(true).imageAsAFile!),
                  ),
                if (profileSetupNotifier(true).imageAsAFile != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _borderedButton(
                          color: Colors.greenAccent,
                          onTap: () {
                            profileSetupNotifier(false).pickUserImage();
                          },
                          title: "Reselect"),
                      _borderedButton(
                          color: Colors.redAccent,
                          onTap: () {
                            profileSetupNotifier(false).clearUserImage();
                          },
                          title: "Remove"),
                    ],
                  ),
                if (profileSetupNotifier(true).imageAsAFile == null)
                  _borderedButton(
                      color: KConstantColors.yellowColor,
                      onTap: () {
                        profileSetupNotifier(false).pickUserImage();
                      },
                      title: "Select profile picture"),
                vSizedBox2,
                SizeConfig.verticalSizedBox(context: context, factor: 0.02),
                Row(
                  children: [
                    Text("Select Gender",
                        style: KConstantTextStyles.MediumText(fontSize: 14)),
                    hSizedBox2,
                    _genderBox(candidateGender: "Male"),
                    hSizedBox1,
                    _genderBox(candidateGender: "Female"),
                  ],
                ),
                SizeConfig.verticalSizedBox(context: context, factor: 0.03),
                Row(
                  children: [
                    Text("Select DOB",
                        style: KConstantTextStyles.MediumText(fontSize: 14)),
                    hSizedBox2,
                    optionButton(
                        context: context,
                        onTap: () {
                          utilityNotifier.selectUserDOB(context);
                        },
                        title: "DOB"),
                    hSizedBox1,
                    Text(
                      Provider.of<UtilityNotifier>(context, listen: true)
                          .pickedUserDOB!
                          .toLocal()
                          .toString()
                          .split(" ")[0],
                      style: KConstantTextStyles.MediumText(fontSize: 16),
                    )
                  ],
                ),
                SizeConfig.verticalSizedBox(context: context, factor: 0.03),
                CustomButton(
                    iconData: FontAwesomeIcons.fire,
                    tag: "Get Started",
                    buttonColor: Colors.red,
                    height:
                        SizeConfig.setHeight(context: context, factor: 0.05),
                    onPressed: () async {
                      String userBio = userBioController.text;
                      String userphonenumber = userPhoneNumberController.text;
                      if (userBio.isNotEmpty && userphonenumber.isNotEmpty) {
                        await profileSetupNotifier(false)
                            .uploadProfilePicture(context: context)
                            .whenComplete(() async {
                          var userData = await _authenticationNotifier
                              .getCurrentUserSession(context: context);
                          String username = userData['name'];
                          String userid = userData['\$id'];
                          String useremail = userData['email'];
                          String userbio = userBioController.text;
                          bool isOAuth = false;
                          String userImageId =
                              profileSetupNotifier(false).uploadedImageId;
                          String userdob = utilityNotifier.pickedUserDOB!
                              .toLocal()
                              .toString()
                              .split(" ")[0];
                          String useraddress = addressController.text;
                          String userprofession = professionController.text;
                          String userGender =
                              profileSetupNotifier(false).userGender;
                          String userorigin = originController.text;
                          await _databaseNotifier.submitUserData(
                              context: context,
                              signedUser: SignedUser(
                                  userid,
                                  username,
                                  useremail,
                                  isOAuth,
                                  useraddress,
                                  userphonenumber,
                                  userbio,
                                  userprofession,
                                  userImageId,
                                  userdob,
                                  userGender,
                                  userorigin));
                        });
                      } else {
                        SnackbarUtility.showSnackbar(
                            context: context,
                            message: "Fill required details(*)");
                      }
                    },
                    width: SizeConfig.setWidth(context: context, factor: 0.4)),
              ],
            ),
          )),
        ),
      ),
    );

    // Widget emailProfileSetup() {
    //   return
    // }

    // Widget facebookProfileSetup() {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.1),
    //         Container(
    //             child: Text("Finish setting profile",
    //                 style: KConstantTextStyles.BHeading1(fontSize: 20))),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.05),
    //         CustomTextField.stylishTextField(
    //             SizeConfig.setWidth(context: context, factor: 0.6),
    //             context,
    //             "Enter phone number*",
    //             userPhoneNumberController),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.02),
    //         CustomTextField.stylishTextField(
    //             SizeConfig.setWidth(context: context, factor: 0.6),
    //             context,
    //             "Enter Origin",
    //             originController),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.02),
    //         Row(
    //           children: [
    //             optionButton(
    //                 context: context,
    //                 onTap: () {
    //                   _utilityNotifier.selectUserDOB(context);
    //                 },
    //                 title: "DOB"),
    //             SizeConfig.horizontalSizedBox(context: context, factor: 0.05),
    //             Text(
    //               Provider.of<UtilityNotifier>(context, listen: true)
    //                   .pickedUserDOB!
    //                   .toLocal()
    //                   .toString()
    //                   .split(" ")[0]
    //                   .toString(),
    //               style: KConstantTextStyles.MBody1(fontSize: 16),
    //             )
    //           ],
    //         ),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.02),
    //         Row(
    //           children: [
    //             optionButton(
    //                 context: context,
    //                 onTap: () {
    //                   _utilityNotifier.selectUserSex(context: context);
    //                 },
    //                 title: "Sex"),
    //             SizeConfig.horizontalSizedBox(context: context, factor: 0.05),
    //             Text(
    //               Provider.of<UtilityNotifier>(context, listen: true).userSex,
    //               style: KConstantTextStyles.MBody1(fontSize: 16),
    //             )
    //           ],
    //         ),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.02),
    //         SizeConfig.verticalSizedBox(context: context, factor: 0.07),
    //         Center(
    //           child: CustomButton(
    //               iconData: Icons.save,
    //               tag: "Save",
    //               buttonColor: KConstantColors.greenColor,
    //               height: SizeConfig.setHeight(context: context, factor: 0.05),
    //               onPressed: () async {
    //                 if (originController.text.isNotEmpty &&
    //                     _utilityNotifier.userSex.isNotEmpty &&
    //                     _utilityNotifier.pickedUserDOB.toString().isNotEmpty) {
    //                   bool isOAuth;
    //                   var authType = _authenticationNotifier.userLoggedType;
    //                   if (authType == UserLoggedType.EmailUser) {
    //                     isOAuth = false;
    //                   } else {
    //                     isOAuth = true;
    //                   }
    //                   await _databaseNotifier.updateData(
    //                       collectionId: DatabaseCredentials.UserCollectionID,
    //                       documentId:
    //                           _authenticationNotifier.currentUserDocumentId!,
    //                       data: {
    //                         "isOAuth": isOAuth,
    //                         "userphonenumber": userPhoneNumberController.text,
    //                         "userimage":
    //                             _authenticationNotifier.currentUserImage,
    //                         "userDOB": _utilityNotifier.pickedUserDOB!
    //                             .toLocal()
    //                             .toString()
    //                             .split(" ")[0],
    //                         "usersex": _utilityNotifier.userSex,
    //                         "userorigin": originController.text
    //                       },
    //                       context: context);
    //                 } else {
    //                   print("originController is empty");
    //                 }
    //               },
    //               width: SizeConfig.setWidth(context: context, factor: 0.4)),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // setup() {
    //   final userType = _authenticationNotifier.userLoggedType;
    //   switch (userType) {
    //     // case UserLoggedType.OAuthUser:
    //     //   return facebookProfileSetup();
    //     default:
    //       return emailProfileSetup();
    //   }
    // }
  }

  showProgressIndicator({required BuildContext context}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: KConstantColors.bgColor),
              child: Column(
                children: [
                  vSizedBox1,
                  Text("Saving data",
                      style: KConstantTextStyles.BoldText(fontSize: 22)),
                  vSizedBox1,
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: KConstantColors.bgColor),
                      width: 300,
                      child: CustomProgressIndicator(seconds: 10)),
                ],
              ));
        });
  }
}
