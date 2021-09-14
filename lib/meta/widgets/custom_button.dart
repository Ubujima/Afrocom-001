import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final IconData? iconData;
  final String tag;
  final double height;
  final dynamic onPressed;
  final Color buttonColor;
  CustomButton(
      {required this.iconData,
      required this.tag,
      required this.buttonColor,
      required this.height,
      required this.onPressed,
      required this.width});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconData != null
                  ? SizedBox(
                      child: Icon(iconData, color: KConstantColors.whiteColor),
                    )
                  : Container(
                      width: 0,
                    ),
              hSizedBox1,
              Text(tag, style: KConstantTextStyles.MBody1(fontSize: 14)),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
