import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
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
    List<TextEditingController> textEditingController = [
      emailController,
      passwordController
    ];
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       authenticationNotifier.getCurrentUserSession(context: context),
      // ),
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
                  SizeConfig.verticalSizedBox(context: context, factor: 0.06),
                  LoginWidgets.appLogo(),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.15),
                  LoginWidgets.loginSection(
                      context: context,
                      textEditingController: textEditingController),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.02),
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
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password",
                        style: KConstantTextStyles.MBody1(
                            fontSize: SizeConfig.sfontSize!)),
                  ),
                  SizeConfig.verticalSizedBox(context: context, factor: 0.05),
                  LoginWidgets.thirdPartyLogin(),
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
