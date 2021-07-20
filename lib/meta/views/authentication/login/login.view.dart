import 'package:afrocom/core/api/appwrite.api.dart';
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
    final navigationUtility = new NavigationUtility();
    List<TextEditingController> textEditingController = [
      emailController,
      passwordController
    ];
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vSizedBox4,
                  vSizedBox3,
                  LoginWidgets.appLogo(),
                  vSizedBox3,
                  LoginWidgets.loginSection(
                      textEditingController: textEditingController),
                  vSizedBox3,
                  LoginWidgets.loginButton(
                      context: context,
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;
                        await AppwriteAPI.createInstance
                            .login(email: email, password: password)
                            .whenComplete(() {
                          navigationUtility.navigateTo(context, HomeRoute);
                        });
                      }),
                  vSizedBox3,
                  LoginWidgets.thirdPartyLogin(),
                  vSizedBox3,
                  LoginWidgets.signupScreenText(
                      onPressed: () =>
                          navigationUtility.navigateTo(context, SignupRoute)),
                  vSizedBox3,
                  LoginWidgets.skipAuthentication(context: context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
