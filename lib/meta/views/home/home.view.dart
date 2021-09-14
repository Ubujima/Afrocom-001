import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'map_view/map_view.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(ImageTags.AppLogo),
        ),
        backgroundColor: Colors.lightBlueAccent,
        title: Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Search afrocom"),
          ),
        ),
      ),
      endDrawer: Container(
          width: 80,
          child: Drawer(
            child: Container(
                color: KConstantColors.bgColorFaint,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    vSizedBox4,
                    FutureBuilder(
                        future: databaseNotifier.searchUserDocumentId(
                            context: context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return IconButton(
                              onPressed: () {
                                if (snapshot.hasData) {
                                  Navigator.of(context).pushNamed(ProfileRoute);
                                } else {
                                  Navigator.of(context)
                                      .pushNamed(ProfileSetupRoute);
                                }
                              },
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: KConstantColors.whiteColor,
                              ));
                        }),
                    vSizedBox1,
                    IconButton(
                        onPressed: () {
                          databaseNotifier.searchUserDocumentId(
                              context: context);
                        },
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          color: KConstantColors.whiteColor,
                        )),
                    vSizedBox1,
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          EvaIcons.messageCircle,
                          color: KConstantColors.whiteColor,
                        )),
                    vSizedBox1,
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(FeedRoute);
                        },
                        icon: Icon(
                          FontAwesomeIcons.wifi,
                          color: KConstantColors.whiteColor,
                        )),
                    vSizedBox1,
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.peopleArrows,
                          color: KConstantColors.whiteColor,
                        )),
                    Divider(thickness: 4, color: KConstantColors.whiteColor),
                    IconButton(
                        onPressed: () {
                          authenticationNotifier.logOut(context: context);
                        },
                        icon: Icon(
                          Icons.logout,
                          color: KConstantColors.whiteColor,
                        )),
                  ],
                )),
          )),
      body: MapView(),
      backgroundColor: KConstantColors.bgColor,
    );
  }
}
