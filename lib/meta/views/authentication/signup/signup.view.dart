import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:provider/provider.dart';
import 'signup.exports.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController useremailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userconfirmpasswordController = TextEditingController();

  @override
  void initState() {
    useremailController = TextEditingController();
    usernameController = TextEditingController();
    userpasswordController = TextEditingController();
    userconfirmpasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authenticationNotifier(bool renderUI) =>
        Provider.of<AuthenticationNotifier>(context, listen: renderUI);
    return Scaffold(
        body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
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
                SizeConfig.verticalSizedBox(context: context, factor: 0.1),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter name",
                    descriptionController: usernameController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter email address",
                    descriptionController: useremailController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Enter password",
                    descriptionController: userpasswordController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Confirm password",
                    descriptionController: userconfirmpasswordController),
                vSizedBox1,
                SignupWidgets.termsAndConditions(context: context),
                vSizedBox2,
                SignupWidgets.signupButton(
                    context: context,
                    onPressed: () async {
                      if (authenticationNotifier(false).checkedTandC) {
                        String useremail = useremailController.text;
                        String username = usernameController.text;
                        String userpassword = userpasswordController.text;
                        String confirmedpassword =
                            userconfirmpasswordController.text;
                        if (userpassword == confirmedpassword) {
                          await authenticationNotifier(false).signUp(
                              context: context,
                              username: username,
                              useremail: useremail,
                              userpassword: userpassword);
                        } else {
                          SnackbarUtility.showSnackbar(
                              context: context,
                              message: "Passwords do not match");
                        }
                      } else {
                        SnackbarUtility.showSnackbar(
                            context: context,
                            message: "Read and accept terms and conditions");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
