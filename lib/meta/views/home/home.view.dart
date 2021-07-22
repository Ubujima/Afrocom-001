import 'package:afrocom/core/api/appwrite.api.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/add_post/add_post.view.dart';
import 'package:afrocom/meta/views/home/map_view/map_view.view.dart';
import 'package:provider/provider.dart';
import 'map_view/components/home_appbar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    int homeIndex = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authenticationNotifier.logOut(context: context);
        },
      ),
      appBar: HomeViewWidgets.homeAppBar,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            homeIndex = index;
          });
        },
        children: [MapView(), AddPost()],
      ),
      backgroundColor: KConstantColors.bgColor,
      bottomNavigationBar:
          HomeViewWidgets.customNavigationBar(kIndex: homeIndex),
    );
  }
}
