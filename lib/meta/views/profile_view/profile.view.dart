import 'package:afrocom/core/models/profile_user.model.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var userDocid;

  initiateUserDocumentId() async {
    DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    var userDocumentId =
        await databaseNotifier.searchUserDocumentId(context: context);
    setState(() {
      userDocid = userDocumentId;
    });
  }

  @override
  void initState() {
    initiateUserDocumentId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    pBlock({required int stats, required String title}) => Container(
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(stats.toString(),
                    style: KConstantTextStyles.BoldText(fontSize: 22)),
                Text(title, style: KConstantTextStyles.MediumText(fontSize: 16))
              ],
            )),
          ),
          decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(5)),
        );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
      backgroundColor: KConstantColors.bgColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              vSizedBox3,
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: KConstantColors.whiteColor),
                  ),
                ],
              ),
              Container(
                child: Center(
                    child: FutureBuilder(
                  future: databaseNotifier.findUserData(
                      context: context, documentId: userDocid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var _snapshot = snapshot.data;
                      ProfileUser profileUser = _snapshot as ProfileUser;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 80),
                          vSizedBox1,
                          Text(profileUser.username,
                              style:
                                  KConstantTextStyles.BoldText(fontSize: 32)),
                          Text(profileUser.useremail,
                              style:
                                  KConstantTextStyles.MediumText(fontSize: 18)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.mapPin,
                                  color: KConstantColors.greenColor),
                              Text(profileUser.userorigin,
                                  style: KConstantTextStyles.MediumText(
                                      fontSize: 18))
                            ],
                          ),
                          vSizedBox2,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              pBlock(stats: 00, title: "Posts"),
                              pBlock(stats: 00, title: "Followers"),
                              pBlock(stats: 00, title: "Following")
                            ],
                          )
                        ],
                      );
                    }
                  },
                )),
              ),
              vSizedBox1,
              Container(height: 350, color: KConstantColors.blueColor)
            ],
          ),
        ),
      ),
    );
  }
}
