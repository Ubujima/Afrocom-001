import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class PlaceNotifier extends ChangeNotifier {
  String _eventTime = "Hours";
  String get eventTime => _eventTime;

  TimeOfDay initialTime = TimeOfDay.now();
  Future selectTime(BuildContext context) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    _eventTime = pickedTime!.format(context);
    notifyListeners();
  }
}
