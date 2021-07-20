import 'package:afrocom/core/api/appwrite.api.dart';
import 'login.exports.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationUtility = new NavigationUtility();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    List<TextEditingController> textEditingController = [
      emailController,
      passwordController
    ];
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     AppwriteAPI.createInstance.getUser();
      //   },
      // ),
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
                Text("Hey There.",
                    style: KConstantTextStyles.BHeading1(fontSize: 40)),
                vSizedBox2,
                Text("Welcome back.",
                    style: KConstantTextStyles.MBody1(fontSize: 30)),
                Text("You've been missed!",
                    style: KConstantTextStyles.MBody1(fontSize: 24)),
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
                vSizedBox3,
                LoginWidgets.signupScreenText(
                    onPressed: () =>
                        navigationUtility.navigateTo(context, SignupRoute)),
                vSizedBox2,
                LoginWidgets.skipAuthentication()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
