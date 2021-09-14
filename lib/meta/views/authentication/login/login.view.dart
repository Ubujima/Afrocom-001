import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:provider/provider.dart';
import 'login.exports.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizeConfig.verticalSizedBox(context: context, factor: 0.1),
                  LoginWidgets.appLogo(),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.15),
                  CommonWidgets.customTextField(
                      minLines: 1,
                      hintText: "Enter email address",
                      descriptionController: emailController),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                  CommonWidgets.customTextField(
                      minLines: 1,
                      hintText: "Enter password",
                      descriptionController: passwordController),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.03),
                  LoginWidgets.loginButton(
                      context: context,
                      onPressed: () async {
                        String useremail = emailController.text;
                        String userpassword = passwordController.text;
                        if (useremail.isNotEmpty && userpassword.isNotEmpty) {
                          if (userpassword.length > 6) {
                            await authenticationNotifier.login(
                                context: context,
                                useremail: useremail,
                                userpassword: userpassword);
                          } else {
                            return SnackbarUtility.showSnackbar(
                                context: context,
                                message:
                                    "Enter password greater than 6 letters");
                          }
                        } else {
                          return SnackbarUtility.showSnackbar(
                              context: context,
                              message: "Enter the credentials");
                        }
                      }),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          SnackbarUtility.featureYetToCome(context: context);
                        },
                        child: Text("Forgot password",
                            style: TextStyle(color: KConstantColors.textColor)),
                      ),
                    ],
                  ),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.06),
                  LoginWidgets.thirdPartyLogin(context: context),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.03),
                  LoginWidgets.signUpButton(
                      context: context,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupRoute);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
