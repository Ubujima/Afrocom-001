import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppLightButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AppLightButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: Booster.screenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Color(0xff51C686),
          ),
          child: Booster.paddedWidget(
              top: 17,
              bottom: 15,
              child: Booster.dynamicFontSize(
                  label: text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
