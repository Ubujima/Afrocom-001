import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
            icon: Icon(EvaIcons.arrowCircleLeft,
                color: KConstantColors.greenColor)),
        Text(title, style: KConstantTextStyles.BoldText(fontSize: 18)),
      ],
    );
  }
}
