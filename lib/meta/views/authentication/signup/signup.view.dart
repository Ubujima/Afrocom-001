import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/models/signeduser.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:provider/provider.dart';
import 'signup.exports.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController userfullnameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  @override
  void initState() {
    userfullnameController = TextEditingController();
    useremailController = TextEditingController();
    usernameController = TextEditingController();
    userpasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    final utilityNotifier =
        Provider.of<UtilityNotifier>(context, listen: false);
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    final navigationUtility = new NavigationUtility();
    List<TextEditingController> textEditingController = [
      userfullnameController,
      usernameController,
      useremailController,
      userpasswordController
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
                          String userfullname = userfullnameController.text;
                          String useremail = useremailController.text;
                          String username = usernameController.text;
                          String userpassword = userpasswordController.text;
                          await authenticationNotifier.signUp(
                              context: context,
                              userfullname: userfullname,
                              username: username,
                              useremail: useremail,
                              userpassword: userpassword);
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
