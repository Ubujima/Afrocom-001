import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.darkColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Afrocom", style: KConstantTextStyles.BHeading1(fontSize: 32)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          )
        ],
      )),
    );
  }
}
