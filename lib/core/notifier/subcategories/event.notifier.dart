import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class EventNotifier extends ChangeNotifier {
  String _eventTime = "Select time";
  String get eventTime => _eventTime;

  String _eventDate = "Select Date";
  String get eventDate => _eventDate;

  TimeOfDay initialTime = TimeOfDay.now();
  Future selectTime(BuildContext context) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    _eventTime = pickedTime!.format(context);
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) selectedDate = picked;
    _eventDate = selectedDate.toLocal().toString().split(' ')[0];
    notifyListeners();
  }
}
