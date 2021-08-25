import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/utilities/progress_controller.dart';
import 'package:flutter/material.dart';

showProgressIndicator({required BuildContext context}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: KConstantColors.bgColor),
            child: Column(
              children: [
                vSizedBox1,
                Text("Uploading Post...",
                    style: KConstantTextStyles.BoldText(fontSize: 22)),
                vSizedBox1,
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: KConstantColors.bgColor),
                    width: 300,
                    child: CustomProgressIndicator(seconds: 10)),
              ],
            ));
      });
}
