import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/profile_setup.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:afrocom/meta/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ProfileSetupView extends StatefulWidget {
  @override
  _ProfileSetupViewState createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends State<ProfileSetupView> {
  TextEditingController userPhoneNumberController = TextEditingController();
  TextEditingController originController = TextEditingController();
  @override
  void initState() {
    userPhoneNumberController = TextEditingController();
    originController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    final _utilityNotifier =
        Provider.of<UtilityNotifier>(context, listen: false);
    final profileSetupNotifier =
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
          height: SizeConfig.setHeight(context: context, factor: 0.054),
          width: SizeConfig.setWidth(context: context, factor: 0.2),
          child: Center(
            child: Text(
              title,
              style: KConstantTextStyles.MBody1(fontSize: 16),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: KConstantColors.bgColorFaint,
          ),
        ),
      );
    }

    Widget emailProfileSetup() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizeConfig.verticalSizedBox(context: context, factor: 0.1),
          Container(
              child: Text("Finish setting profile",
                  style: KConstantTextStyles.BHeading1(fontSize: 20))),
          SizeConfig.verticalSizedBox(context: context, factor: 0.05),
          Provider.of<ProfileSetupNotifier>(context, listen: true)
                      .userProfilePicture
                      .isEmpty &&
                  Provider.of<ProfileSetupNotifier>(context, listen: true)
                          .imageAsAFile ==
                      null
              ? CircleAvatar(
                  radius: 50,
                  child: IconButton(
                    onPressed: () {
                      profileSetupNotifier.pickUserImage();
                    },
                    icon: Icon(Icons.person),
                  ),
                )
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: KConstantColors.darkColor,
                        radius: 80,
                        backgroundImage:
                            FileImage(profileSetupNotifier.imageAsAFile!),
                      ),
                      SizeConfig.verticalSizedBox(
                          context: context, factor: 0.05),
                      CircleAvatar(
                        radius: 20,
                        child: IconButton(
                            onPressed: () =>
                                profileSetupNotifier.pickUserImage(),
                            icon: Icon(Icons.refresh)),
                      )
                    ],
                  ),
                ),
          SizeConfig.verticalSizedBox(context: context, factor: 0.05),
          CustomTextField.stylishTextField(
              SizeConfig.setWidth(context: context, factor: 0.6),
              context,
              "Enter phone number",
              userPhoneNumberController),
          SizeConfig.verticalSizedBox(context: context, factor: 0.07),
          CustomButton(
              iconData: Icons.save,
              tag: "Save",
              buttonColor: KConstantColors.greenColor,
              height: SizeConfig.setHeight(context: context, factor: 0.05),
              onPressed: () {
                profileSetupNotifier.uploadProfilePicture(context: context);
              },
              width: SizeConfig.setWidth(context: context, factor: 0.4)),
        ],
      );
    }

    Widget facebookProfileSetup() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeConfig.verticalSizedBox(context: context, factor: 0.1),
            Container(
                child: Text("Finish setting profile",
                    style: KConstantTextStyles.BHeading1(fontSize: 20))),
            SizeConfig.verticalSizedBox(context: context, factor: 0.05),
            CustomTextField.stylishTextField(
                SizeConfig.setWidth(context: context, factor: 0.6),
                context,
                "Enter phone number*",
                userPhoneNumberController),
            SizeConfig.verticalSizedBox(context: context, factor: 0.02),
            CustomTextField.stylishTextField(
                SizeConfig.setWidth(context: context, factor: 0.6),
                context,
                "Enter Origin",
                originController),
            SizeConfig.verticalSizedBox(context: context, factor: 0.02),
            Row(
              children: [
                optionButton(
                    context: context,
                    onTap: () {
                      _utilityNotifier.selectUserDOB(context);
                    },
                    title: "DOB"),
                SizeConfig.horizontalSizedBox(context: context, factor: 0.05),
                Text(
                  Provider.of<UtilityNotifier>(context, listen: true)
                      .pickedUserDOB!
                      .toLocal()
                      .toString()
                      .split(" ")[0]
                      .toString(),
                  style: KConstantTextStyles.MBody1(fontSize: 16),
                )
              ],
            ),
            SizeConfig.verticalSizedBox(context: context, factor: 0.02),
            Row(
              children: [
                optionButton(
                    context: context,
                    onTap: () {
                      _utilityNotifier.selectUserSex(context: context);
                    },
                    title: "Sex"),
                SizeConfig.horizontalSizedBox(context: context, factor: 0.05),
                Text(
                  Provider.of<UtilityNotifier>(context, listen: true).userSex,
                  style: KConstantTextStyles.MBody1(fontSize: 16),
                )
              ],
            ),
            SizeConfig.verticalSizedBox(context: context, factor: 0.02),
            SizeConfig.verticalSizedBox(context: context, factor: 0.07),
            Center(
              child: CustomButton(
                  iconData: Icons.save,
                  tag: "Save",
                  buttonColor: KConstantColors.greenColor,
                  height: SizeConfig.setHeight(context: context, factor: 0.05),
                  onPressed: () async {
                    if (originController.text.isNotEmpty &&
                        _utilityNotifier.userSex.isNotEmpty &&
                        _utilityNotifier.pickedUserDOB.toString().isNotEmpty) {
                      bool isOAuth;
                      var authType = _authenticationNotifier.userLoggedType;
                      if (authType == UserLoggedType.EmailUser) {
                        isOAuth = false;
                      } else {
                        isOAuth = true;
                      }
                      await _databaseNotifier.updateData(
                          collectionId: DatabaseCredentials.UserCollectionID,
                          documentId:
                              _authenticationNotifier.currentUserDocumentId!,
                          data: {
                            "isOAuth": isOAuth,
                            "userphonenumber": userPhoneNumberController.text,
                            "userimage":
                                _authenticationNotifier.currentUserImage,
                            "userDOB": _utilityNotifier.pickedUserDOB!
                                .toLocal()
                                .toString()
                                .split(" ")[0],
                            "usersex": _utilityNotifier.userSex,
                            "userorigin": originController.text
                          },
                          context: context);
                    } else {
                      print("originController is empty");
                    }
                  },
                  width: SizeConfig.setWidth(context: context, factor: 0.4)),
            ),
          ],
        ),
      );
    }

    setup() {
      final userType = _authenticationNotifier.userLoggedType;
      switch (userType) {
        case UserLoggedType.OAuthUser:
          return facebookProfileSetup();
        default:
          return emailProfileSetup();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: KConstantColors.darkColor,
      appBar: AppBar(
        title: Text(Provider.of<AuthenticationNotifier>(context, listen: true)
            .currentUserDocumentId
            .toString()),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(child: setup()),
        ),
      ),
    );
  }
}
