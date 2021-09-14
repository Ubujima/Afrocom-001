import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class JobNotifier extends ChangeNotifier {
  String _jobLevel = "";
  String get jobLevel => _jobLevel;

  String _jobContractType = "";
  String get jobContractType => _jobContractType;

  setJobLevel({required String candidateJob}) {
    _jobLevel = candidateJob;
    notifyListeners();
  }

  setJobContractType({required String candidateContract}) {
    _jobContractType = candidateContract;
    notifyListeners();
  }
}
