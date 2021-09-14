import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class MarketNotifier extends ChangeNotifier {
  String _serviceCategory = "";
  String get serviceCategory => _serviceCategory;

  String _productCategory = "";
  String get productCategory => _productCategory;

  setServiceCategory({required String candidateServiceCategory}) {
    _serviceCategory = candidateServiceCategory;
    notifyListeners();
  }

  setProductCategory({required String candidateProductCategory}) {
    _productCategory = candidateProductCategory;
    notifyListeners();
  }
}
