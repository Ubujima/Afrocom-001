import 'package:afrocom/core/api/appwrite.api.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/splash_view/splash.view.dart';

class SessionDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppwriteAPI.createInstance.getUser(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashView();
        }
        if (snapshot.hasData) {
          return HomeView();
        }
        return LoginView();
      },
    );
  }
}
