import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final String buttonTitle;
  final dynamic onPressed;
  const OnBoardingButton({required this.buttonTitle, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9;
    double buttonHeight = MediaQuery.of(context).size.height * 0.06;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: KConstantColors.bgColorFaint,
            borderRadius: BorderRadius.circular(5)),
        height: buttonHeight,
        width: buttonWidth,
        child: Center(
          child: Text(buttonTitle,
              style:
                  KConstantTextStyles.MBody1(fontSize: SizeConfig.sfontSize!)),
        ),
      ),
    );
  }
}
