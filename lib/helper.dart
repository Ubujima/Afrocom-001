import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/colorProvider.dart';
import 'package:provider/provider.dart';

class ColorsConfig {
  static Widget getLogo(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Image.asset(
        'assets/images/cLogo1.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "Y") {
      return Image.asset(
        'assets/images/cLogo9.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "BL") {
      return Image.asset(
        'assets/images/cLogo2.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "R") {
      return Image.asset(
        'assets/images/cLogo6.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "O") {
      return Image.asset(
        'assets/images/cLogo5.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "W") {
      return Image.asset(
        'assets/images/cLogo8.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "G") {
      return Image.asset(
        'assets/images/cLogo3.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PN") {
      return Image.asset(
        'assets/images/cLogo7.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PU") {
      return Image.asset(
        'assets/images/cLogo4.png',
        height: 39,
        width: 39,
      );
    } else {
      return Image.asset(
        'assets/images/cLogo9.png',
        height: 39,
        width: 39,
      );
    }
  }

  static Widget getDpMark(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Image.asset(
        'assets/images/DpMark1.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "Y") {
      return Image.asset(
        'assets/images/DpMark9.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "BL") {
      return Image.asset(
        'assets/images/DpMark2.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "R") {
      return Image.asset(
        'assets/images/DpMark7.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "O") {
      return Image.asset(
        'assets/images/DpMark4.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "W") {
      return Image.asset(
        'assets/images/DpMark8.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "G") {
      return Image.asset(
        'assets/images/DpMark3.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PN") {
      return Image.asset(
        'assets/images/DpMark5.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PU") {
      return Image.asset(
        'assets/images/DpMark6.png',
        height: 39,
        width: 39,
      );
    } else {
      return Image.asset(
        'assets/images/cLogo9.png',
        height: 39,
        width: 39,
      );
    }
  }

  static Widget getFilter(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Image.asset(
        'assets/images/Filter1.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "Y") {
      return Image.asset(
        'assets/images/Filter9.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "BL") {
      return Image.asset(
        'assets/images/Filter2.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "R") {
      return Image.asset(
        'assets/images/Filter7.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "O") {
      return Image.asset(
        'assets/images/Filter4.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "W") {
      return Image.asset(
        'assets/images/Filter8.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "G") {
      return Image.asset(
        'assets/images/Filter3.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PN") {
      return Image.asset(
        'assets/images/Filter5.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PU") {
      return Image.asset(
        'assets/images/Filter6.png',
        height: 39,
        width: 39,
      );
    } else {
      return Image.asset(
        'assets/images/cLogo9.png',
        height: 39,
        width: 39,
      );
    }
  }

  static Widget getFab(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Image.asset(
        'assets/images/Fab1.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "Y") {
      return Image.asset(
        'assets/images/Fab9.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "BL") {
      return Image.asset(
        'assets/images/Fab2.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "R") {
      return Image.asset(
        'assets/images/Fab7.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "O") {
      return Image.asset(
        'assets/images/Fab4.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "W") {
      return Image.asset(
        'assets/images/Fab8.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "G") {
      return Image.asset(
        'assets/images/Fab3.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PN") {
      return Image.asset(
        'assets/images/Fab5.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PU") {
      return Image.asset(
        'assets/images/Fab6.png',
        height: 39,
        width: 39,
      );
    } else {
      return Image.asset(
        'assets/images/cLogo9.png',
        height: 39,
        width: 39,
      );
    }
  }

  static Widget getWifi(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Image.asset(
        'assets/images/cWifi1.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "Y") {
      return Image.asset(
        'assets/images/cWifi5.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "BL") {
      return Image.asset(
        'assets/images/cWifi6.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "R") {
      return Image.asset(
        'assets/images/cWifi3.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "O") {
      return Image.asset(
        'assets/images/cWifi9.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "W") {
      return Image.asset(
        'assets/images/cWifi4.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "G") {
      return Image.asset(
        'assets/images/cWifi8.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PN") {
      return Image.asset(
        'assets/images/cWifi7.png',
        height: 39,
        width: 39,
      );
    } else if (color.getColor() == "PU") {
      return Image.asset(
        'assets/images/cWifi2.png',
        height: 39,
        width: 39,
      );
    } else {
      return Image.asset(
        'assets/images/cWifi.png',
        height: 39,
        width: 39,
      );
    }
  }

  static Color getColor(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);
    if (color.getColor() == "B") {
      return Color(0xff000000);
    } else if (color.getColor() == "Y") {
      return Color(0xffF4FC14);
    } else if (color.getColor() == "BL") {
      return Color(0xff0000FF);
    } else if (color.getColor() == "R") {
      return Color(0xffFF1C1C);
    } else if (color.getColor() == "O") {
      return Color(0xffFF8C00);
    } else if (color.getColor() == "W") {
      return Color(0xff0CA00C);
    } else if (color.getColor() == "G") {
      return Color(0xff0CA00C);
    } else if (color.getColor() == "PN") {
      return Color(0xffEE82EE);
    } else if (color.getColor() == "PU") {
      return Color(0xffA92DDB);
    } else {
      return Color(0xff123456);
    }
  }
}
