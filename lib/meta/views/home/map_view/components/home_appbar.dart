import 'package:afrocom/core/services/authentication.service.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class HomeViewWidgets {
  static AppBar homeAppBar({required BuildContext context}) => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KConstantColors.bgColor,
        title: Container(
          child: TextField(
            style: KConstantTextStyles.MBody1(fontSize: 18),
            decoration: InputDecoration.collapsed(
              hintText: "Search afrocom",
              hintStyle:
                  TextStyle(color: KConstantColors.whiteColor, fontSize: 16.0),
            ),
          ),
          width: 300,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.notifications, color: KConstantColors.whiteColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.message, color: KConstantColors.whiteColor)),
          IconButton(
              onPressed: () {
                AppwriteAuthenticationAPI.createInstance
                    .logOut(context: context);
                // final cacheNotifier =
                //     Provider.of<CacheNotifier>(context, listen: false);
                // cacheNotifier.deleteCache(key: "emailuser");
              },
              icon: Icon(Icons.person, color: KConstantColors.whiteColor))
        ],
      );

  static CustomNavigationBar customNavigationBar({required int kIndex}) {
    return CustomNavigationBar(
      backgroundColor: KConstantColors.bgColor,
      onTap: (index) {
        kIndex = index;
      },
      currentIndex: kIndex,
      items: [
        CustomNavigationBarItem(icon: Icon(Icons.map)),
        CustomNavigationBarItem(icon: Icon(Icons.feed)),
        CustomNavigationBarItem(icon: Icon(Icons.add))
      ],
    );
  }
}
