import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/front_end_configs.dart';

class AppButtonRedRound1 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppButtonRedRound1({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Color(0xffEB4132),
          ),
          child: Booster.paddedWidget(
              top: 17,
              bottom: 15,
              left: 62.5,
              right: 62.5,
              child: Booster.dynamicFontSize(
                  label: text,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        );
  }
}
