import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? height;
  static double? width;
  static double? titleSize;
  static double? sfontSize;
  static double? mFontSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    titleSize = _mediaQueryData!.size.width * 0.08;
    sfontSize = _mediaQueryData!.size.width * 0.04;
    mFontSize = _mediaQueryData!.size.width * 0.06;
  }

  static double setWidth(
          {required BuildContext context, required double factor}) =>
      MediaQuery.of(context).size.width * factor;
  static double setHeight(
          {required BuildContext context, required double factor}) =>
      MediaQuery.of(context).size.height * factor;
}
