import 'dart:typed_data';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/core/models/fetch_posts.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/feed.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/core/services/video.service.dart';
import 'package:afrocom/meta/utilities/progress_controller.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.exports.dart';
import 'package:afrocom/meta/views/home/feed/components/post_on_map.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:video_player/video_player.dart';

class FeedWidgets {
  static deletePostLoader({required BuildContext context}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                vSizedBox1,
                Text("Deleting Post...",
                    style: KConstantTextStyles.BoldText(fontSize: 16)),
                vSizedBox1,
                Container(
                    width: 300, child: CustomProgressIndicator(seconds: 4))
              ],
            ),
            decoration: BoxDecoration(color: KConstantColors.bgColor),
          );
        });
  }

  static deletePostMenu(
      {required dynamic imageId,
      required dynamic postId,
      required BuildContext context}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: KConstantColors.bgColor),
            child: Column(
              children: [
                vSizedBox1,
                Text("Delete Post?",
                    style: KConstantTextStyles.BoldText(fontSize: 16)),
                vSizedBox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      buttonColor: KConstantColors.bgColorFaint,
                      width: 50,
                      height: 50,
                      onPressed: () {},
                      tag: "No",
                      iconData: null,
                    ),
                    CustomButton(
                      buttonColor: Colors.red,
                      width: 50,
                      height: 50,
                      onPressed: () {
                        DatabaseService.createInstance.deletePost(
                            imageId: imageId, context: context, postId: postId);
                      },
                      tag: "Yes",
                      iconData: null,
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  static postBlock(
      {required BuildContext context, required FetchedPostData post}) {
    FeedNotifier feedNotifier({required bool renderUI}) =>
        Provider.of<FeedNotifier>(context, listen: renderUI);
    postActionBlock(
        {required dynamic onTap,
        required Color color,
        required String title,
        required IconData iconData}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onTap, icon: Icon(iconData, size: 20, color: color)),
        ],
      );
    }

    renderAsset({required bool isVideo, required dynamic fileId}) {
      return FutureBuilder(
          future: StorageService.createInstance.fetchPostAsset(
              isVideo: isVideo, context: context, fileId: fileId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                  child: isVideo
                      ? Container()
                      : Container(
                          height: 400,
                          width: 400,
                          child: Image.memory(snapshot.data as Uint8List),
                        ));
            }
          });
    }

    String calculateTime({required DateTime datetime}) {
      var _renderedTime = timeago.format(datetime);
      return _renderedTime;
    }

    double postlatitude({required dynamic candidateString}) {
      var _data = candidateString.toString().split(",")[0];
      var renderedDouble = double.parse(_data);
      return renderedDouble;
    }

    double postlongitude({required dynamic candidateString}) {
      var _data = candidateString.toString().split(",")[1];
      var renderedDouble = double.parse(_data);
      return renderedDouble;
    }

    Container showMapLocation({required LatLng latLng}) {
      return Container(
        height: 150,
        child: FlutterMap(
          options:
              MapOptions(onLongPress: (latlng) {}, zoom: 15, center: latLng),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                new Marker(
                    point: latLng,
                    builder: (context) {
                      return CircleAvatar(
                        radius: 40,
                        child: Icon(FontAwesomeIcons.mapPin),
                        backgroundColor: KConstantColors.bgColor,
                      );
                    })
              ],
            ),
          ],
        ),
      );
    }

    Widget getUserId({required dynamic candidateUserId}) {
      final authenticationNotifier =
          Provider.of<AuthenticationNotifier>(context, listen: false);
      return FutureBuilder(
          future:
              authenticationNotifier.getCurrentUserSession(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator()));
            } else {
              var _snapshot = snapshot.data as dynamic;
              var userId = _snapshot!['\$id'];
              if (candidateUserId == userId) {
                return IconButton(
                    onPressed: () {
                      deletePostMenu(
                          imageId: post.postasset,
                          postId: post.isVideo,
                          context: context);
                    },
                    icon: Icon(EvaIcons.moreVertical,
                        size: 16, color: KConstantColors.whiteColor));
              } else {
                return vSizedBox0;
              }
            }
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              child: Row(
                children: [
                  hSizedBox1,
                  CircleAvatar(radius: 20, child: Icon(EvaIcons.person)),
                  hSizedBox1,
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.postusername,
                            style: KConstantTextStyles.BoldText(fontSize: 14)),
                        Container(
                            width: 250,
                            child: Text(post.postuseraddress,
                                overflow: TextOverflow.ellipsis,
                                style: KConstantTextStyles.MediumText(
                                    fontSize: 10)))
                      ],
                    ),
                  ),
                  Spacer(),
                  // IconButton(
                  //     onPressed: () {
                  //       deletePostMenu(
                  //           imageId: post.
                  //           postId: post.id,
                  //           context: context);
                  //     },
                  //     icon: Icon(EvaIcons.moreVertical,
                  //         size: 16, color: KConstantColors.whiteColor))
                ],
              ),
            ),
            vSizedBox1,
            renderAsset(isVideo: post.isVideo, fileId: post.postasset[0]),
            vSizedBox1,
            feedNotifier(renderUI: true).showLocation
                ? showMapLocation(
                    latLng: LatLng(
                        postlatitude(
                            candidateString: post.postuserlocationcords),
                        postlongitude(
                            candidateString: post.postuserlocationcords)))
                : vSizedBox0,
            vSizedBox1,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // postActionBlock(
                  //     onTap: () async {
                  //       await StorageService.createInstance.fetchPostImage(
                  //           context: context, fileId: post.postuserimage[0]);
                  //     },
                  //     color: KConstantColors.whiteColor,
                  //     iconData: FontAwesomeIcons.heart,
                  //     title: "0"),
                  postActionBlock(
                      onTap: () {
                        // getUserId();
                      },
                      color: KConstantColors.whiteColor,
                      iconData: FontAwesomeIcons.commentAlt,
                      title: "0"),
                  postActionBlock(
                      onTap: () {
                        feedNotifier(renderUI: false).toggleShowLocation();
                        // showPostOnMap(
                        //     context: context,
                        //     latLng: LatLng(
                        //         postlatitude(
                        //             candidateString: post.postuserlocationcords),
                        //         postlongitude(
                        //             candidateString:
                        //                 post.postuserlocationcords)));
                      },
                      color: KConstantColors.whiteColor,
                      iconData: FontAwesomeIcons.mapPin,
                      title: "0"),
                  feedNotifier(renderUI: true).showLocation
                      ? postActionBlock(
                          onTap: () {
                            showPostOnMap(
                                context: context,
                                latLng: LatLng(
                                    postlatitude(
                                        candidateString:
                                            post.postuserlocationcords),
                                    postlongitude(
                                        candidateString:
                                            post.postuserlocationcords)));
                          },
                          color: KConstantColors.blueColor,
                          iconData: FontAwesomeIcons.eye,
                          title: "0")
                      : hSizedBox0,
                  Spacer(),
                  postActionBlock(
                      onTap: () {},
                      color: KConstantColors.whiteColor,
                      iconData: FontAwesomeIcons.bookmark,
                      title: "0")
                ],
              ),
            ),
            Container(
                child: Row(
              children: [
                hSizedBox1,
                Text(post.postusername,
                    overflow: TextOverflow.ellipsis,
                    style: KConstantTextStyles.BoldText(fontSize: 14)),
                SizedBox(width: 6),
                Container(
                  child: Center(
                    child: Text(post.postusercaption,
                        overflow: TextOverflow.ellipsis,
                        style: KConstantTextStyles.MediumText(fontSize: 14)),
                  ),
                ),
              ],
            )),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("View comments",
                  style: KConstantTextStyles.MediumText(fontSize: 10)),
            ),
            SizedBox(height: 4),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                    calculateTime(datetime: DateTime.parse(post.posttime)),
                    style: KConstantTextStyles.MediumText(fontSize: 10)))
          ],
        ),
        decoration: BoxDecoration(
            color: KConstantColors.darkColor,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  static listOfPosts({required dynamic snapshot}) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: snapshot.length,
      itemBuilder: (BuildContext context, int index) {
        FetchedPostData post = snapshot[index];
        return postBlock(context: context, post: post);
      },
    );
  }
}
