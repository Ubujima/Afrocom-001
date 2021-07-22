import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UtilityNotifier extends ChangeNotifier {
  final _logger = Logger();
  DateTime? _pickedUserDOB;
  DateTime? get pickedUserDOB => _pickedUserDOB;
  Future<void> selectUserDOB(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    _pickedUserDOB = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (_pickedUserDOB != selectedDate) {
      selectedDate = _pickedUserDOB!;
    }
    _logger.i(_pickedUserDOB!.toLocal().toString().split(" ")[0]);
    notifyListeners();
  }
}
