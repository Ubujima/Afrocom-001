import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UtilityNotifier extends ChangeNotifier {
  //! User data (Optional)
  DateTime? _pickedUserDOB = DateTime.now();
  DateTime? get pickedUserDOB => _pickedUserDOB;

  String _userSex = "";
  String get userSex => _userSex;

  String _userOrigin = "";
  String get userOrigin => _userOrigin;

  Future<void> selectUserDOB(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    _pickedUserDOB = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (_pickedUserDOB != selectedDate) {
      selectedDate = _pickedUserDOB!;
    }
    notifyListeners();
  }

  selectUserSex({required BuildContext context}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: SizeConfig.setHeight(context: context, factor: 0.1),
            width: SizeConfig.setWidth(context: context, factor: 0.9),
            color: KConstantColors.bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    iconData: null,
                    tag: "Male",
                    buttonColor:
                        Provider.of<UtilityNotifier>(context, listen: true)
                                    .userSex ==
                                "Male"
                            ? KConstantColors.greenColor
                            : KConstantColors.bgColorFaint,
                    height: 100,
                    onPressed: () {
                      _userSex = "Male";
                      notifyListeners();
                      Navigator.pop(context);
                    },
                    width: 100),
                hSizedBox1,
                CustomButton(
                    iconData: null,
                    tag: "Female",
                    buttonColor:
                        Provider.of<UtilityNotifier>(context, listen: true)
                                    .userSex ==
                                "Female"
                            ? KConstantColors.greenColor
                            : KConstantColors.bgColorFaint,
                    height: 100,
                    onPressed: () {
                      _userSex = "Female";
                      notifyListeners();
                      Navigator.pop(context);
                    },
                    width: 100)
              ],
            ),
          );
        });
  }

  selectUserOrigin({required BuildContext context}) {
    final originController = TextEditingController();
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.black,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              height: SizeConfig.setHeight(context: context, factor: 0.55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  vSizedBox1,
                  Center(
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        _userOrigin = value;
                        notifyListeners();
                      },
                      controller: originController,
                      style: KConstantTextStyles.MBody1(fontSize: 18),
                      decoration: new InputDecoration(
                          filled: true,
                          hintText: "Enter your origin",
                          hintStyle: new TextStyle(
                              color: KConstantColors.textColor, fontSize: 16.0),
                          fillColor: KConstantColors.bgColorFaint,
                          border: new OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(5.0)))),
                    ),
                  ),
                  vSizedBox1,
                  CustomButton(
                      iconData: null,
                      tag: "Add origin",
                      buttonColor:
                          Provider.of<UtilityNotifier>(context, listen: true)
                                  .userOrigin
                                  .isNotEmpty
                              ? KConstantColors.greenColor
                              : KConstantColors.bgColorFaint,
                      height: 100,
                      onPressed: () {
                        _userOrigin = originController.text;
                        notifyListeners();
                        Navigator.pop(context);
                      },
                      width: 400)
                ],
              ),
            )));
  }
}
