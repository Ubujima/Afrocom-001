import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String title;
  final dynamic backPressed;
  const CustomBackButton({required this.backPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: backPressed,
            icon: Icon(Icons.arrow_back_ios_new,
                color: KConstantColors.darkColor)),
        Text(title, style: KConstantTextStyles.BoldText(fontSize: 16)),
      ],
    );
  }
}
