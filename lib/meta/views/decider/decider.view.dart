import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/cache.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';
import 'package:afrocom/meta/views/splash_view/splash.view.dart';
import 'package:provider/provider.dart';

class SessionDecider extends StatefulWidget {
  @override
  _SessionDeciderState createState() => _SessionDeciderState();
}

class _SessionDeciderState extends State<SessionDecider> {
  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    final cacheNotifier = Provider.of<CacheNotifier>(context, listen: false);
    Future readAllCache() async {
      var cache;
      var _facebookCache = await cacheNotifier.readCache(key: "facebookuser");
      print("👽Facebook Cache => $_facebookCache");
      if (_facebookCache != null) {
        cache = _facebookCache;
      }
      var _googleCache = await cacheNotifier.readCache(key: "googleuser");
      print("Google Cache => $_googleCache");
      if (_googleCache != null) {
        cache = _googleCache;
      }
      var _emailCache =
          await authenticationNotifier.getCurrentUserSession(context: context);
      print("Email Cache => $_emailCache");
      if (_emailCache != null) {
        cache = _emailCache;
      }
      return cache;
    }

    return FutureBuilder(
      future: readAllCache(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashView();
        }
        if (!snapshot.hasData) {
          return OnBoardingView();
        } else {
          return HomeView();
        }
      },
    );
  }
}
