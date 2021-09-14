import 'dart:io';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/core/services/video.service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AddPostComponents {
//! <-----------------------------------------SELECT IMAGE SECTION ------------------------------------------------>
  static selectImageSection(
      {required bool isVideoNeeded, required BuildContext context}) {
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
            if (isVideoNeeded)
              _selectImage(
                  width: 180,
                  iconData: Icons.camera,
                  onTap: () async {
                    await _postNotifierFalse.pickVideos();
                  },
                  title: "Video")
          ],
        ),
        if (isVideoNeeded) vSizedBox1,
        if (isVideoNeeded)
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
              zoom: 3,
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
}
