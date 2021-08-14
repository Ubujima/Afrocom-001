import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/utilities/font_size_config.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ShareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<AuthenticationNotifier>(context, listen: true)
            .currentUserDocumentId
            .toString()),
      ),
      backgroundColor: KConstantColors.darkColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                  iconData: null,
                  tag: "Invite contacts",
                  buttonColor: KConstantColors.bgColorFaint,
                  height: SizeConfig.setHeight(context: context, factor: 0.05),
                  onPressed: () {},
                  width: SizeConfig.setWidth(context: context, factor: 0.5)),
              SizeConfig.verticalSizedBox(context: context, factor: 0.010),
              CustomButton(
                  iconData: null,
                  tag: "No thanks",
                  buttonColor: KConstantColors.bgColorFaint,
                  height: SizeConfig.setHeight(context: context, factor: 0.05),
                  onPressed: () {
                    NavigationUtility().navigateTo(context, ProfileSetupRoute);
                  },
                  width: SizeConfig.setWidth(context: context, factor: 0.5))
            ],
          ),
        ),
      ),
    );
  }
}
