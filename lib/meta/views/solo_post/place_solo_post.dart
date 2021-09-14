import 'dart:typed_data';
import 'package:afrocom/meta/arguments/solo_post.argument.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:better_player/better_player.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceSoloPost extends StatefulWidget {
  final SoloPostArguments soloPostArguments;
  const PlaceSoloPost({required this.soloPostArguments});
  @override
  _PlaceSoloPostState createState() => _PlaceSoloPostState();
}

class _PlaceSoloPostState extends State<PlaceSoloPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder(
          future: DatabaseService.createInstance.searchPostData(
              collectionId: widget.soloPostArguments.collectionId,
              context: context,
              query: widget.soloPostArguments.query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              Map post = snapshot.data as Map;
              List postAssets = post['postasset'];
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FutureBuilder(
                            future: DatabaseService.createInstance
                                .searchUserData(
                                    context: context,
                                    query: post['postuserid']),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Map<String, dynamic> userData =
                                    Map<String, dynamic>.from(
                                        snapshot.data as Map<Object?, Object?>);
                                dynamic image = userData['userimage'];
                                return FutureBuilder(
                                    future: StorageService.createInstance
                                        .fetchPostAsset(
                                            isVideo: false,
                                            context: context,
                                            fileId: image),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasData) {
                                        return CircleAvatar(
                                            backgroundImage: MemoryImage(
                                                snapshot.data as Uint8List),
                                            radius: 22,
                                            backgroundColor:
                                                Colors.transparent);
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    });
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                        hSizedBox1,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(post['postusername'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: KConstantFonts.Poppins,
                                    color: KConstantColors.darkColor,
                                    fontSize: 16)),
                            Container(
                              width: 200,
                              child: Text(post['postuseraddress'],
                                  overflow: TextOverflow.ellipsis,
                                  style: KConstantTextStyles.MediumText(
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.bookmark)),
                        IconButton(
                            onPressed: () {}, icon: Icon(EvaIcons.moreVertical))
                      ],
                    ),
                    vSizedBox1,
                    Container(
                      child: Text(
                          "${post['postcategory']} - ${post['postsubcategory']}",
                          style: KConstantTextStyles.BoldText(fontSize: 14)),
                    ),
                    Container(
                      child: Text("Place hours - ${post['placeHours']}",
                          style: KConstantTextStyles.MediumText(fontSize: 14)),
                    ),
                    Container(
                      child: Text("Place address - ${post['placeHours']}",
                          style: KConstantTextStyles.MediumText(fontSize: 14)),
                    ),
                    Container(
                      child: Text(post['posttitle'],
                          style: KConstantTextStyles.RegularText(fontSize: 14)),
                    ),
                    Container(
                      child: Text(post['postDescription'],
                          style: KConstantTextStyles.RegularText(fontSize: 14)),
                    ),
                    vSizedBox1,
                    post['isvideo']
                        ? Container(
                            child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: BetterPlayer.network(postAssets[0],
                                    betterPlayerConfiguration:
                                        BetterPlayerConfiguration(
                                      aspectRatio: 16 / 9,
                                    ))))
                        : Container(
                            height: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: postAssets.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: FutureBuilder(
                                      future: StorageService.createInstance
                                          .fetchPostAsset(
                                              isVideo: false,
                                              context: context,
                                              fileId: postAssets[0]),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (snapshot.hasData) {
                                          return Container(
                                            width: 420,
                                            child: Image.memory(
                                              snapshot.data as Uint8List,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  );
                                }),
                            color: KConstantColors.bgColorFaint),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.heart,
                                    size: 22,
                                    color: post['postsubcategory'] == "Angry"
                                        ? Colors.red
                                        : KConstantColors.darkColor,
                                  )),
                              Text("0",
                                  style: KConstantTextStyles.RegularText(
                                      fontSize: 14))
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    var data = await DatabaseService
                                        .createInstance
                                        .searchUserData(
                                            context: context,
                                            query: post['postuserid']);
                                    Map<String, dynamic> userData =
                                        Map<String, dynamic>.from(
                                            data as Map<Object?, Object?>);
                                    dynamic image = userData['userimage'];
                                    print(image);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.comment,
                                    size: 22,
                                    color: post['postsubcategory'] == "Angry"
                                        ? Colors.red
                                        : KConstantColors.darkColor,
                                  )),
                              Text("0",
                                  style: KConstantTextStyles.RegularText(
                                      fontSize: 14))
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesomeIcons.heart,
                                      color: KConstantColors.darkColor,
                                      size: 22)),
                              Text("0",
                                  style: KConstantTextStyles.RegularText(
                                      fontSize: 14))
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.mapPin,
                              color: post['postsubcategory'] == "Angry"
                                  ? Colors.red
                                  : KConstantColors.darkColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.shareAlt,
                              color: post['postsubcategory'] == "Angry"
                                  ? Colors.red
                                  : KConstantColors.darkColor,
                            ))
                      ],
                    ),
                    Text(timeago.format(DateTime.parse(post['posttime']))),
                    vSizedBox1
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
