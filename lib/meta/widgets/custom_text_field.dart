import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  static stylishTextField(double widthFactor, BuildContext context,
      String hintText, TextEditingController textEditingController) {
    return Container(
      width: SizeConfig.setWidth(context: context, factor: widthFactor),
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: KConstantTextStyles.MBody1(fontSize: 18),
          decoration: new InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: new TextStyle(
                  color: KConstantColors.textColor, fontSize: 16.0),
              fillColor: KConstantColors.bgColorFaint,
              border: new OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(const Radius.circular(5.0)))),
        ),
      ),
    );
  }
}
