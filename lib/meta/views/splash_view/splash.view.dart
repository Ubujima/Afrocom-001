import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Afrocom",
                  style: KConstantTextStyles.BHeading1(fontSize: 30)),
              vSizedBox3,
              SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                      color: KConstantColors.textColor))
            ],
          ),
        ),
      ),
    );
  }
}
