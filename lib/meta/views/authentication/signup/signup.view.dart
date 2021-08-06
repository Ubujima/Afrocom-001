import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:provider/provider.dart';
import 'signup.exports.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController userfirstnameController = TextEditingController();
  TextEditingController userlastnameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userconfirmpasswordController = TextEditingController();

  @override
  void initState() {
    userfirstnameController = TextEditingController();
    userlastnameController = TextEditingController();
    useremailController = TextEditingController();
    usernameController = TextEditingController();
    userpasswordController = TextEditingController();
    userconfirmpasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    Map<String, TextEditingController> textEditingController = {
      "userfirstname": userfirstnameController,
      "userlastname": userlastnameController,
      "useremail": useremailController,
      "username": usernameController,
      "userpassword": userpasswordController,
      "userconfirmpasswordController": userconfirmpasswordController
    };
    return Scaffold(
        backgroundColor: KConstantColors.darkColor,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizeConfig.verticalSizedBox(context: context, factor: 0.07),
                    SignupWidgets.appLogo(context: context),
                    vSizedBox2,
                    SignupWidgets.signupSection(
                        context: context,
                        textEditingController: textEditingController),
                    vSizedBox2,
                    SignupWidgets.termsAndConditions(context: context),
                    vSizedBox2,
                    SignupWidgets.signupButton(
                        context: context,
                        onPressed: () async {
                          String userfirstname = userfirstnameController.text;
                          String userlastname = userlastnameController.text;
                          String useremail = useremailController.text;
                          String username = usernameController.text;
                          String userpassword = userpasswordController.text;
                          String confirmedpassword =
                              userconfirmpasswordController.text;
                          dynamic userDOB = Provider.of<UtilityNotifier>(
                                  context,
                                  listen: false)
                              .pickedUserDOB!
                              .toLocal()
                              .toString()
                              .split(" ")[0];
                          String usersex = Provider.of<UtilityNotifier>(context,
                                  listen: false)
                              .userSex;
                          String userorigin = Provider.of<UtilityNotifier>(
                                  context,
                                  listen: false)
                              .userOrigin;
                          String userfullname =
                              userfirstname + " " + userlastname;
                          if (userpassword == confirmedpassword) {
                            await authenticationNotifier.signUp(
                                signedUser: SignedUser(
                                  username,
                                  useremail,
                                  userfirstname,
                                  userlastname,
                                  userDOB,
                                  usersex,
                                  userorigin,
                                ),
                                context: context,
                                userfullname: userfullname,
                                username: username,
                                useremail: useremail,
                                userpassword: userpassword);
                          } else {
                            SnackbarUtility.showSnackbar(
                                context: context,
                                message: "Passwords do not match");
                          }
                        }),
                    vSizedBox3,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
