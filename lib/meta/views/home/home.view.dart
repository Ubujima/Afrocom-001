import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/map_view/map_view.view.dart';
import 'map_view/components/home_appbar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewWidgets.homeAppBar(context: context),
      body: MapView(),
      backgroundColor: KConstantColors.bgColor,
    );
  }
}
