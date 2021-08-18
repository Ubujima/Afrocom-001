import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:afrocom/meta/views/home/add_post/components/posting_options.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TaskBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    taskBarOptions({required dynamic onTap, required IconData icon}) =>
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            child: Icon(icon, size: 40, color: KConstantColors.darkColor),
            radius: 25,
            backgroundColor: KConstantColors.textColor,
          ),
        );

    return Positioned(
      top: SizeConfig.setHeight(context: context, factor: 0.78),
      left: SizeConfig.setWidth(context: context, factor: 0.02),
      child: AnimatedContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            taskBarOptions(
                icon: EvaIcons.globe,
                onTap: () {
                  final mapNotifier =
                      Provider.of<MapNotifier>(context, listen: false);
                  mapNotifier.toggleShowTaskBar();
                  mapNotifier.toggleShowSubTaskBar()();
                }),
            taskBarOptions(icon: EvaIcons.personOutline, onTap: () {}),
            taskBarOptions(
                icon: Icons.location_searching_rounded,
                onTap: () {
                  showPostingOptions(context: context);
                })
          ],
        ),
        duration: Duration(seconds: 2),
        curve: Curves.easeIn,
        width: 300,
        decoration: BoxDecoration(
            color: KConstantColors.bgColor,
            borderRadius: BorderRadius.circular(15)),
        height: 65,
      ),
    );
  }
}

class SubTaskBar extends StatelessWidget {
  subTaskBarOptions({required dynamic onTap, required IconData icon}) =>
      GestureDetector(
        onTap: onTap,
        child: Icon(icon, size: 30, color: KConstantColors.greenColor),
      );
  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Positioned(
      top: SizeConfig.setHeight(context: context, factor: 0.78),
      left: SizeConfig.setWidth(context: context, factor: 0.02),
      child: GestureDetector(
        // onPanDown: (details) {
        //   MapNotifier mapNotifier({required bool renderUI}) =>
        //       Provider.of<MapNotifier>(context, listen: renderUI);
        //   mapNotifier(renderUI: false).toggleShowSubTaskBar();
        // },
        child: AnimatedContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              subTaskBarOptions(
                  icon: FontAwesomeIcons.globeAfrica,
                  onTap: () {
                    Navigator.of(context).pushNamed(FeedRoute);
                  }),
              subTaskBarOptions(icon: FontAwesomeIcons.mapPin, onTap: () {}),
              subTaskBarOptions(
                  icon: FontAwesomeIcons.edit,
                  onTap: () async {
                    await authenticationNotifier.checkUserIsLogged(
                        context: context);
                    if (authenticationNotifier.isUserLogged) {
                      showPostingOptions(context: context);
                    } else {
                      SnackbarUtility.showSnackbar(
                          context: context, message: "Please login to post!");
                    }
                  }),
              subTaskBarOptions(icon: FontAwesomeIcons.bell, onTap: () {}),
              subTaskBarOptions(icon: FontAwesomeIcons.commentAlt, onTap: () {})
            ],
          ),
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          width: 300,
          decoration: BoxDecoration(
              color: KConstantColors.bgColor,
              borderRadius: BorderRadius.circular(15)),
          height: 65,
        ),
      ),
    );
  }
}
