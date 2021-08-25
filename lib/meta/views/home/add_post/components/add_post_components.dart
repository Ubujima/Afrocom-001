import 'dart:io';

import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/models/post.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/core/services/video.service.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AddPostComponents {
//! <-----------------------------------------SELECT IMAGE SECTION ------------------------------------------------>
  static selectImageSection({required BuildContext context}) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _selectImage(
            {required double width,
            required IconData iconData,
            required String title,
            required dynamic onTap}) =>
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 15, child: Icon(iconData)),
                hSizedBox1,
                Text(title, style: KConstantTextStyles.BoldText(fontSize: 16)),
              ],
            )),
          ),
        );

    var _postNotifierTrue = _postingNotifier(renderUI: true);
    var _postNotifierFalse = _postingNotifier(renderUI: false);
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vSizedBox1,
        if (_postNotifierTrue.selectedImage != null)
          Container(
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Center(
                    child: Image.file(_postNotifierFalse.selectedImage!),
                  ),
                ),
                vSizedBox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _selectImage(
                        width: 150,
                        iconData: Icons.remove,
                        onTap: () {
                          _postNotifierFalse.clearImages();
                        },
                        title: "Remove"),
                    hSizedBox1,
                    _selectImage(
                        width: 150,
                        iconData: EvaIcons.imageOutline,
                        onTap: () {
                          _postNotifierFalse.pickImages(
                              source: ImageSource.gallery);
                        },
                        title: "Reselect"),
                  ],
                )
              ],
            ),
          ),
        if (_postNotifierTrue.pickedVideoPath != null)
          Container(
            child: Column(
              children: [
                Container(
                    height: 450,
                    child: CustomVideoPlayer(
                      looping: false,
                      videoPlayerController: VideoPlayerController.file(
                          File(_postNotifierTrue.pickedVideoPath!)),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _selectImage(
                        width: 150,
                        iconData: Icons.remove,
                        onTap: () {
                          _postNotifierFalse.clearVideo();
                        },
                        title: "Remove"),
                    hSizedBox1,
                    _selectImage(
                        width: 150,
                        iconData: EvaIcons.imageOutline,
                        onTap: () {
                          _postNotifierFalse.pickVideos();
                        },
                        title: "Reselect"),
                  ],
                )
              ],
            ),
          ),
        vSizedBox1,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _selectImage(
                width: 180,
                iconData: EvaIcons.imageOutline,
                onTap: () {
                  _postNotifierFalse.pickImages(source: ImageSource.gallery);
                },
                title: "Image"),
            _selectImage(
                width: 180,
                iconData: Icons.camera,
                onTap: () async {
                  await _postNotifierFalse.pickVideos();
                },
                title: "Video")
          ],
        ),
        vSizedBox1,
        Center(
          child: _selectImage(
              width: 350,
              iconData: EvaIcons.imageOutline,
              onTap: () {},
              title: "Attach documents"),
        ),
      ],
    ));
  }

//! <-----------------------------------------ADD LOCATION------------------------------------------------>
  static addLocation({required BuildContext context}) {
    MapNotifier _mapNotifier({required bool renderUI}) =>
        Provider.of<MapNotifier>(context, listen: renderUI);
    renderMap() => Container(
          height: 400,
          width: 400,
          child: FlutterMap(
            options: MapOptions(
              onTap: (latlng) {
                _mapNotifier(renderUI: false)
                    .renderTappedLocation(context: context, latLng: latlng);
              },
              zoom: _mapNotifier(renderUI: false).initialZoomLevel,
              center: LatLng(4.7832, 16.5085),
            ),
            layers: [
              TileLayerOptions(
                  backgroundColor: KConstantColors.bgColor,
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  new Marker(
                      point:
                          _mapNotifier(renderUI: true).selectedLocationCords!,
                      builder: (context) {
                        return Icon(
                          EvaIcons.pin,
                          color: KConstantColors.blueColor,
                          size: 40,
                        );
                      })
                ],
              ),
            ],
          ),
        );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select location",
              style: KConstantTextStyles.MediumText(fontSize: 16)),
          vSizedBox1,
          renderMap(),
          vSizedBox1,
          Center(
            child: Text(_mapNotifier(renderUI: true).selectedLocation!,
                style: KConstantTextStyles.BoldText(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  //! <-----------------------------------------UPLOAD POST BUTTON------------------------------------------------>
  static uploadPostButton(
      {required TextEditingController textEditingController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        var userData = await authenticationNotifier.getCurrentUserSession(
            context: context);
        var postuserid = userData['\$id'];
        var postusername = userData['name'];
        var postusercaption = textEditingController.text;
        var postuseraddress = mapNotifier.selectedLocation;
        var postuserlocationcords =
            "${mapNotifier.selectedLocationCords!.latitude.toString()},${mapNotifier.selectedLocationCords!.longitude.toString()}";
        var posttime = DateTime.now().toLocal().toString();
        var postcategory = _postingNotifier(renderUI: false).selectedPostType;
        var postusermood = _postingNotifier(renderUI: false).moodLogoValue;
        var postasset = await StorageService.createInstance.uploadPostAsset(
            assetPath: _postingNotifier(renderUI: false).pickedVideoPath ??
                _postingNotifier(renderUI: false).selectedImage!.path,
            context: context);
        if (postusercaption.isNotEmpty) {
          bool isVideo = false;
          if (_postingNotifier(renderUI: false).pickedVideoFile != null) {
            isVideo = true;
          }
          await DatabaseService.createInstance.uploadPost(
              post: Post(
                  postcategory!,
                  postusername,
                  postusermood!,
                  [postasset],
                  postusercaption,
                  postuseraddress!,
                  postuserlocationcords,
                  posttime,
                  postuserid,
                  isVideo),
              context: context);
        } else {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter caption");
        }
      },
      child: Center(
        child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Text("Upload Post",
                    style: KConstantTextStyles.BoldText(fontSize: 16)))),
      ),
    );
  }
}
