import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';
import 'package:provider/provider.dart';

class SessionDecider extends StatefulWidget {
  @override
  _SessionDeciderState createState() => _SessionDeciderState();
}

class _SessionDeciderState extends State<SessionDecider> {
  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: true);
    return FutureBuilder(
      future: authenticationNotifier.getCurrentUserSession(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return OnBoardingView();
        }
        if (snapshot.hasData) {
          return HomeView();
        }
        return LoginView();
      },
    );
  }
}
