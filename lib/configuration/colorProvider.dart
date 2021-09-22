import 'package:flutter/cupertino.dart';

class ColorProvider extends ChangeNotifier {
  String _color = "B";

  void saveColor(String color) {
    _color = color;
    notifyListeners();
  }

  String getColor() => _color;
}
