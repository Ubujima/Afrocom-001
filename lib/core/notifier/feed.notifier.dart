import 'package:flutter/cupertino.dart';

class FeedNotifier extends ChangeNotifier {
  bool _showLocation = false;
  bool get showLocation => _showLocation;

  toggleShowLocation() {
    _showLocation = !_showLocation;
    notifyListeners();
  }
}
