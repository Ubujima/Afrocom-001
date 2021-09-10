import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/front_end_configs.dart';

class AppButtonBlueShort extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppButtonBlueShort({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color(0xff306AFF)
      ),
      child: Booster.paddedWidget(
          top: 10,
          bottom: 10,
          right: 20,
          left: 20,
          child: Booster.dynamicFontSize(
              label: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white)),
    );
  }
}
