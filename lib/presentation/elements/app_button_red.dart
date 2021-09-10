import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppButtonRed extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppButtonRed({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Color(0xffEB4132)),
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
