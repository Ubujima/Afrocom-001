import 'package:flutter/cupertino.dart';

class NavigationUtility {
  navigateTo(BuildContext context, dynamic route, [dynamic args]) {
    return Navigator.of(context).pushNamed(route, arguments: args);
  }

  navigateback(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
