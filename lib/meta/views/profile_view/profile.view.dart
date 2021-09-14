import 'dart:typed_data';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final DatabaseNotifier databaseNotifier =
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
              color: KConstantColors.whiteColor,
              borderRadius: BorderRadius.circular(5)),
        );

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: FutureBuilder(
          future: databaseNotifier.searchUserDocumentId(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              Map<String, dynamic> userData = Map<String, dynamic>.from(
                  snapshot.data as Map<Object?, Object?>);
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Stack(children: [
                        Container(height: 400),
                        Container(
                            child: FutureBuilder(
                                future: StorageService.createInstance
                                    .fetchPostAsset(
                                        isVideo: false,
                                        context: context,
                                        fileId: userData['userimage']),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshot.hasData) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              stops: [0.4, 0.8, 0.9],
                                              begin: Alignment.center,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                KConstantColors.darkColor
                                                    .withOpacity(0.2),
                                                KConstantColors.darkColor,
                                                KConstantColors.darkColor
                                              ]),
                                          image: DecorationImage(
                                              image: MemoryImage(
                                                  snapshot.data as Uint8List))),
                                      height: 350,
                                      width: 500,
                                    );
                                  }
                                  return Center(
                                      child: CircularProgressIndicator());
                                })),
                        Positioned(
                          top: 320,
                          child: Container(
                            width: 450,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  pBlock(stats: 00, title: "Posts"),
                                  pBlock(stats: 00, title: "Followers"),
                                  pBlock(stats: 00, title: "Following")
                                ]),
                          ),
                        ),
                        Positioned(
                          top: 240,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              width: 400,
                              child: Row(
                                children: [
                                  Container(
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(userData['username'],
                                            style: TextStyle(
                                                fontFamily:
                                                    KConstantFonts.PoppinsBold,
                                                color:
                                                    KConstantColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22)),
                                        Text(userData['userprofession'],
                                            style: TextStyle(
                                                fontFamily:
                                                    KConstantFonts.PoppinsBold,
                                                color:
                                                    KConstantColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        Text(userData['useraddress'],
                                            style: TextStyle(
                                                fontFamily:
                                                    KConstantFonts.PoppinsBold,
                                                color:
                                                    KConstantColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  )),
                  Divider(thickness: 0.5),
                  Container(
                    height: 400,
                    child: ListView(
                      children: [
                        Text("Shared",
                            style:
                                KConstantTextStyles.MediumText(fontSize: 12)),
                        Column(
                          children: [
                            Text("Moments",
                                style: KConstantTextStyles.MediumText(
                                    fontSize: 12)),
                            Container(
                              height: 200,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                          color: KConstantColors.yellowColor),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Mood",
                                style: KConstantTextStyles.MediumText(
                                    fontSize: 12)),
                            Container(
                              height: 200,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                          color: KConstantColors.yellowColor),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Events",
                                style: KConstantTextStyles.MediumText(
                                    fontSize: 12)),
                            Container(
                              height: 200,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                          color: KConstantColors.yellowColor),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        )),
      ),
    );
  }
}
