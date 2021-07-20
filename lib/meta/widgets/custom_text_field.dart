import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  static stylishTextField(
      String hintText, TextEditingController textEditingController) {
    return Container(
      width: 400,
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: KConstantTextStyles.MBody1(fontSize: 18),
          decoration: new InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: new TextStyle(
                  color: KConstantColors.textColor, fontSize: 16.0),
              fillColor: KConstantColors.darkColor,
              border: new OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)))),
        ),
      ),
    );
  }
}
