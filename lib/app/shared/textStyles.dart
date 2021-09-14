import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:flutter/cupertino.dart';

class KConstantTextStyles {
  // ignore: non_constant_identifier_names
  static TextStyle BHeading1({required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      color: KConstantColors.whiteColor,
      fontFamily: KConstantFonts.MonteserratB,
    );
  }

  // ignore: non_constant_identifier_names
  static TextStyle MBody1({required double fontSize}) {
    return TextStyle(
        fontFamily: KConstantFonts.Monteserrat,
        color: KConstantColors.whiteColor,
        fontWeight: FontWeight.w800,
        fontSize: fontSize);
  }

  // ignore: non_constant_identifier_names
  static TextStyle BoldText({required double fontSize}) {
    return TextStyle(
        fontFamily: KConstantFonts.PoppinsBold,
        color: KConstantColors.darkColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize);
  }

  // ignore: non_constant_identifier_names
  static TextStyle RegularText({required double fontSize}) {
    return TextStyle(
        fontFamily: KConstantFonts.Poppins,
        color: KConstantColors.darkColor,
        fontSize: fontSize);
  }

  // ignore: non_constant_identifier_names
  static TextStyle MediumText({required double fontSize}) {
    return TextStyle(
        fontFamily: KConstantFonts.PoppinsMedium,
        color: KConstantColors.darkColor,
        fontSize: fontSize);
  }

  static TextStyle MediumColoredText(
      {required Color textColor, required double fontSize}) {
    return TextStyle(
        fontFamily: KConstantFonts.PoppinsMedium,
        color: textColor,
        fontSize: fontSize);
  }
}
