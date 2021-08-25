import 'package:afrocom/app/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final int seconds;
  const CustomProgressIndicator({required this.seconds});
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: widget.seconds), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    if (controller.isCompleted) {
      print(controller.isCompleted);
      controller.stop();
    }
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Container(
      child: LinearProgressIndicator(
        minHeight: 20,
        backgroundColor: KConstantColors.whiteColor,
        color: KConstantColors.greenColor,
        value: animation.value,
      ),
    ));
  }
}
