import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppDarkButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppDarkButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Booster.screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Color(0xff000000)),
      child: Booster.paddedWidget(
          top: 17,
          bottom: 15,
          child: Booster.dynamicFontSize(
              label: text,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
