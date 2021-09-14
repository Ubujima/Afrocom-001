import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 500,
      child: Image.asset(
        ImageTags.SplashScreen,
        fit: BoxFit.cover,
      ),
    ));
  }
}
