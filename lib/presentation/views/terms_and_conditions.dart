import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Booster.verticalSpace(59),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Booster.dynamicFontSize(
                        label:
                        'Terms and conditions',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff010101)
                    ),
                  ],
                ),
              ),
              Booster.verticalSpace(44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Booster.dynamicFontSize(
                    label:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nibh sit platea nisl venenatis sollicitudin vivamus consequat vitae fringilla. Egestas potenti nunc morbi vulputate aliquet eu sem. Augue nibh ullamcorper ultricies est. Sagittis faucibus elementum nibh id et risus egestas consectetur quis. Aliquam quisque arcu mauris scelerisque enim eget amet. At felis enim viverra tempus, in faucibus. Posuere nullam lectus neque commodo iaculis. Tortor nunc sem ut sed felis lacus. Vel ullamcorper eget et, risus, metus sed erat ac id. Feugiat sed ut ut amet, et. Nisl urna, mauris commodo tellus netus faucibus. Purus sed elit, in pulvinar suspendisse nisl fermentum, magna. Nibh vitae, euismod in purus malesuada eros. Porta aliquam tellus dui, ut enim vestibulum at. Quis consectetur orci risus netus.',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff8C8C8C),
                  isAlignCenter: false,
                  lineHeight: 1.3
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
