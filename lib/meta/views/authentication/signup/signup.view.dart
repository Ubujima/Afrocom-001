import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/api/appwrite.api.dart';
import 'signup.exports.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    final navigationUtility = new NavigationUtility();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    List<TextEditingController> textEditingController = [
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox5,
                  vSizedBox2,
                  Text("Welcome to Afrocom!",
                      style: KConstantTextStyles.MBody1(fontSize: 30)),
                  Text("Create a new account to get started.",
                      style: KConstantTextStyles.MBody1(fontSize: 20)),
                  vSizedBox3,
                  SignupWidgets.signupSection(
                      textEditingController: textEditingController),
                  vSizedBox3,
                  SignupWidgets.signupButton(
                      context: context,
                      onPressed: () async {
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        if (name.isNotEmpty &&
                            email.isNotEmpty &&
                            password.isNotEmpty) {
                          await AppwriteAPI.createInstance.signUp(
                              name: name, email: email, password: password);
                        } else {
                          SnackbarUtility.showSnackbar(
                              context: context, message: "Fill in the details");
                        }
                      }),
                  vSizedBox3,
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
        ));
  }
}
