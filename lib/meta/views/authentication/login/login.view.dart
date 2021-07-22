import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
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
    final databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    final navigationUtility = new NavigationUtility();
    List<TextEditingController> textEditingController = [
      emailController,
      passwordController
    ];
    return Scaffold(
      floatingActionButton: Container(
        width: 200,
        child: Row(
          children: [
            FloatingActionButton(
              heroTag: "add data",
              child: Icon(Icons.add),
              onPressed: () {
                // databaseNotifier.submitUserData(context: context);
              },
            ),
            // FloatingActionButton(
            //   heroTag: "avav",
            //   child: Icon(Icons.remove),
            //   onPressed: () {
            //     authenticationNotifier.logOut(context: context);
            //   },
            // ),
          ],
        ),
      ),
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
                        await authenticationNotifier.login(
                            context: context,
                            useremail: email,
                            userpassword: password);
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
