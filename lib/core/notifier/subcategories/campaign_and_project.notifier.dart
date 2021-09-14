import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class CampaignAndProjectNotifier extends ChangeNotifier {
  String _projectSubCateogory = "";
  String get projectSubCateogory => _projectSubCateogory;

  setProjectType({required String candidateSubCategory}) {
    _projectSubCateogory = candidateSubCategory;
    notifyListeners();
  }
}
