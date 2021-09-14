import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class MoodPostNotifier extends ChangeNotifier {
  Color _moodPostColor = Colors.transparent;
  Color get moodPostColor => _moodPostColor;

  Color? setMoodPostColor({required String postMoodType}) {
    switch (postMoodType) {
      case "Happy":
        {
          _moodPostColor = Colors.greenAccent;
          return _moodPostColor;
        }
      case "Arrogant":
        {
          _moodPostColor = Colors.blue;
          return _moodPostColor;
        }
      case "Shock":
        {
          _moodPostColor = Colors.yellow;
          return _moodPostColor;
        }
      case "Angry":
        {
          _moodPostColor = Colors.red;
          return _moodPostColor;
        }
    }
  }
}
