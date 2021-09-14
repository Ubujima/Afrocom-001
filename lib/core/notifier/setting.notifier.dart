import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class SettingNotifier extends ChangeNotifier {
  Color _currentColorTheme = Colors.lightBlueAccent;
  Color get currentColorTheme => _currentColorTheme;

  setColorTheme({required Color candidateColor}) {
    _currentColorTheme = candidateColor;
    print("The new theme is $_currentColorTheme");
    notifyListeners();
  }
}
