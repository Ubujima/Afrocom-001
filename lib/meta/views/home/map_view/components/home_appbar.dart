import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class HomeViewWidgets {
  static AppBar homeAppBar = AppBar(
    backgroundColor: KConstantColors.bgColor,
    title: Text(
      "Afrocom",
      style: KConstantTextStyles.BHeading1(fontSize: 20),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: KConstantColors.whiteColor)),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.message, color: KConstantColors.whiteColor)),
      IconButton(
          onPressed: () {},
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
        CustomNavigationBarItem(icon: Icon(Icons.add_circle_outline)),
        CustomNavigationBarItem(icon: Icon(Icons.map))
      ],
    );
  }
}
