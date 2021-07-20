import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/api/appwrite.api.dart';
import 'package:afrocom/core/api/appwrite.authentication.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';
import 'signup.exports.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController usernamenameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    usernamenameController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationNotifier = Provider.of<AuthenticationNotifier>(context);
    final navigationUtility = new NavigationUtility();
    List<TextEditingController> textEditingController = [
      usernamenameController,
      nameController,
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
                    SignupWidgets.appLogo(),
                    vSizedBox2,
                    Text("Create a new account to get started.",
                        style: KConstantTextStyles.MBody1(fontSize: 20)),
                    vSizedBox3,
                    SignupWidgets.signupSection(
                        context: context,
                        textEditingController: textEditingController),
                    vSizedBox3,
                    SignupWidgets.signupButton(
                        context: context,
                        onPressed: () async {
                          String username = usernamenameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;
                          AppwriteAPI.createInstance.signUp(
                              name: username, email: email, password: password);
                          // authenticationNotifier.signUp(
                          //     context: context,
                          //     username: username,
                          //     email: email,
                          //     password: password);
                        }),
                    vSizedBox3,
                    SignupWidgets.loginScreenText(
                        onPressed: () =>
                            navigationUtility.navigateTo(context, LoginRoute)),
                    vSizedBox2,
                    // SignupWidgets.skipAuthentication(context: context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
