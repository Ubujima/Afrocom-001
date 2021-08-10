import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/cache.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/feed/feed.view.dart';
import 'package:afrocom/meta/views/home/map_view/map_view.view.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'map_view/components/home_appbar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    final cacheNotifier = Provider.of<CacheNotifier>(context, listen: false);
    int homeIndex = 0;
    return Scaffold(
      floatingActionButton: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              iconData: null,
              height: 100,
              buttonColor: KConstantColors.greenColor,
              width: 50,
              tag: "Email user",
              onPressed: () async {
                var _emailCache = await authenticationNotifier
                    .getCurrentUserSession(context: context);
                if (_emailCache != null) {
                  var emailCacheUsername = _emailCache['email'];
                  SnackbarUtility.showSnackbar(
                      context: context,
                      message: "Email user $emailCacheUsername is logged in.");
                } else {
                  SnackbarUtility.showSnackbar(
                      context: context, message: "Email cache is clear");
                }
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              iconData: null,
              height: 100,
              buttonColor: KConstantColors.greenColor,
              width: 50,
              tag: "Facebook user",
              onPressed: () async {
                var _facebookCache =
                    await cacheNotifier.readCache(key: "facebookuser");
                if (_facebookCache != null) {
                  SnackbarUtility.showSnackbar(
                      context: context,
                      message: "Facebook user $_facebookCache is logged in.");
                } else {
                  SnackbarUtility.showSnackbar(
                      context: context, message: "Facebook cache is clear");
                }
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              iconData: null,
              height: 100,
              buttonColor: KConstantColors.greenColor,
              width: 50,
              tag: "Google user",
              onPressed: () async {
                var _googleCache =
                    await cacheNotifier.readCache(key: "googleuser");
                if (_googleCache != null) {
                  SnackbarUtility.showSnackbar(
                      context: context,
                      message: "Facebook user $_googleCache is logged in.");
                } else {
                  SnackbarUtility.showSnackbar(
                      context: context, message: "Google cache is clear");
                }
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              iconData: null,
              height: 100,
              buttonColor: KConstantColors.greenColor,
              width: 50,
              tag: "Logout",
              onPressed: () async {
                //! Check facebook cache
                var _facebookCache =
                    await cacheNotifier.readCache(key: "facebookuser");
                if (_facebookCache != null) {
                  await cacheNotifier.deleteCache(key: "facebookuser");
                  SnackbarUtility.showLoadingSnackbar(
                      time: 4, title: "Logging out", context: context);
                  Future.delayed(Duration(seconds: 5)).whenComplete(() {
                    Navigator.of(context).pushNamed(LoginRoute);
                  });
                }
                //! Check google cache
                var _googleCache =
                    await cacheNotifier.readCache(key: "googleuser");
                if (_googleCache != null) {
                  await cacheNotifier.deleteCache(key: "googleuser");
                  SnackbarUtility.showLoadingSnackbar(
                      time: 4, title: "Logging out", context: context);
                  Future.delayed(Duration(seconds: 5)).whenComplete(() {
                    Navigator.of(context).pushNamed(LoginRoute);
                  });
                }
                //! Check email cache
                var _emailCache = await authenticationNotifier
                    .getCurrentUserSession(context: context);
                var emailCacheUsername = _emailCache['email'];
                if (emailCacheUsername != null) {
                  await authenticationNotifier.logOut(context: context);
                }
              },
            ),
          ],
        ),
      ),
      appBar: HomeViewWidgets.homeAppBar,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            homeIndex = index;
          });
        },
        children: [
          MapView(),
          FeedView(),
        ],
      ),
      backgroundColor: KConstantColors.bgColor,
      bottomNavigationBar:
          HomeViewWidgets.customNavigationBar(kIndex: homeIndex),
    );
  }
}
