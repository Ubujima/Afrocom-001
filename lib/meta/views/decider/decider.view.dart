import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/services/cache.service.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';
import 'package:afrocom/meta/views/splash_view/splash.view.dart';
import 'package:provider/provider.dart';

class SessionDecider extends StatefulWidget {
  @override
  _SessionDeciderState createState() => _SessionDeciderState();
}

class _SessionDeciderState extends State<SessionDecider> {
  authenticationNotifier({required BuildContext context}) =>
      Provider.of<AuthenticationNotifier>(context, listen: false);
  Future readAllCache({required BuildContext context}) async {
    var cache;
    var _facebookCache = await CacheService.readCache(key: "facebookuser");
    if (_facebookCache != null) {
      cache = _facebookCache;
    }
    var _googleCache = await CacheService.readCache(key: "googleuser");
    if (_googleCache != null) {
      cache = _googleCache;
    }
    var _emailCache = await authenticationNotifier(context: context)
        .getCurrentUserSession(context: context);
    if (_emailCache != null) {
      cache = _emailCache;
    }
    return cache;
  }

  late Future _readCache;
  @override
  void initState() {
    _readCache = readAllCache(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _readCache,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashView();
        }
        if (!snapshot.hasData) {
          return OnBoardingView();
        }
        if (snapshot.data == null) {
          return LoginView();
        }
        return HomeView();
      },
    );
  }
}
