import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/front_end_configs.dart';

class AppButtonGreenShort extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppButtonGreenShort({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
              color: Color(0xff51C686)
          ),
          child: Booster.paddedWidget(
              top: 10,
              bottom: 10,
              right: 28,
              left: 28,
              child: Booster.dynamicFontSize(
                  label: text,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        );
  }
}
