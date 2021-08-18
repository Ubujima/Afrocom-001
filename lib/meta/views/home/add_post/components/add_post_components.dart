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
import 'package:afrocom/meta/utilities/progress_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class AddPostComponents {
//! <-----------------------------------------UPLOAD POST BUTTON------------------------------------------------>
  static uploadPostButton(
      {required TextEditingController textEditingController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier(
            {required BuildContext context, required bool renderUI}) =>
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
        var postcategory = _postingNotifier(context: context, renderUI: false)
            .selectedPostType;
        var postusermood =
            _postingNotifier(context: context, renderUI: false).moodLogoValue;
        var postuserimage = await StorageService.createInstance.uploadPostImage(
            imagePath: _postingNotifier(context: context, renderUI: false)
                .selectedImage!
                .path,
            context: context);
        assert(postuserid != null);
        await DatabaseService.createInstance.uploadPost(
            post: Post(
                postcategory!,
                postusername,
                postusermood!,
                [postuserimage ?? ""],
                postusercaption,
                postuseraddress!,
                postuserlocationcords,
                posttime,
                postuserid),
            context: context);
      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: _postingNotifier(context: context, renderUI: true)
                        .isDescriptionFilled ==
                    true
                ? KConstantColors.greenColor
                : KConstantColors.bgColorFaint,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Upload Post",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ],
          )),
        ),
      ),
    );
  }

  static showProgressIndicator({required BuildContext context}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: KConstantColors.bgColor),
              child: Column(
                children: [
                  vSizedBox1,
                  Text("Uploading Post...",
                      style: KConstantTextStyles.BoldText(fontSize: 22)),
                  vSizedBox1,
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: KConstantColors.bgColor),
                      width: 300,
                      child: CustomProgressIndicator(seconds: 10)),
                ],
              ));
        });
  }

//! <-----------------------------------------SELECT IMAGE SECTION ------------------------------------------------>
  static selectImageSection({required BuildContext context}) {
    PostingNotifier _postingNotifier(
            {required BuildContext context, required bool renderUI}) =>
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

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vSizedBox1,
        _postingNotifier(context: context, renderUI: true).selectedImage == null
            ? vSizedBox1
            : Container(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Center(
                        child: Image.file(
                            _postingNotifier(context: context, renderUI: false)
                                .selectedImage!),
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
                              _postingNotifier(
                                      context: context, renderUI: false)
                                  .clearImages();
                            },
                            title: "Remove"),
                        hSizedBox1,
                        _selectImage(
                            width: 150,
                            iconData: EvaIcons.imageOutline,
                            onTap: () {
                              _postingNotifier(
                                      context: context, renderUI: false)
                                  .pickAndShowImages(
                                      source: ImageSource.gallery);
                            },
                            title: "Reselect"),
                      ],
                    )
                  ],
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _selectImage(
                width: 180,
                iconData: EvaIcons.imageOutline,
                onTap: () {
                  _postingNotifier(context: context, renderUI: false)
                      .pickAndShowImages(source: ImageSource.gallery);
                },
                title: "Image"),
            _selectImage(
                width: 180,
                iconData: Icons.camera,
                onTap: () async {
                  var video =
                      await _postingNotifier(context: context, renderUI: false)
                          .pickAndShowVideos();
                  StorageService.createInstance
                      .uploadPostImage(imagePath: video.path, context: context);
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

//! <-----------------------------------------SELECT MOODS ------------------------------------------------>
  static moodSelection({required BuildContext context}) {
    PostingNotifier _postingNotifier(
            {required BuildContext context, required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _moods({required String image}) => GestureDetector(
          onTap: () {
            _postingNotifier(context: context, renderUI: false)
                .assignMoodLogo(candidateMoodLogo: image);
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius:
                _postingNotifier(context: context, renderUI: true).moodLogo ==
                        image
                    ? 35
                    : 25,
            backgroundImage: AssetImage(image),
          ),
        );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox1,
          Text(
              "Select mood : ${_postingNotifier(context: context, renderUI: true).moodLogoValue}",
              style: KConstantTextStyles.MediumText(fontSize: 16)),
          vSizedBox1,
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: KConstantColors.bgColorFaint,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _moods(image: ImageTags.HappyFace),
                _moods(image: ImageTags.AngryFace),
                _moods(image: ImageTags.ShockFace),
                _moods(image: ImageTags.ArrogantFace),
              ],
            ),
          )
        ],
      ),
    );
  }

//! <-----------------------------------------ADD LOCATION------------------------------------------------>
  static addLocation({required BuildContext context}) {
    MapNotifier _mapNotifier({required bool renderUI}) =>
        Provider.of<MapNotifier>(context, listen: renderUI);

    _zoomLevelSlider() {
      return Container(
        height: 100,
        child: Slider(
          value: _mapNotifier(renderUI: false).initialZoomLevel,
          min: 1,
          max: 15,
          label:
              _mapNotifier(renderUI: false).initialZoomLevel.round().toString(),
          onChanged: (double value) {
            _mapNotifier(renderUI: false).slideZoomLevel(candidateValue: value);
          },
        ),
      );
    }

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
          // _zoomLevelSlider()
        ],
      ),
    );
  }
}
