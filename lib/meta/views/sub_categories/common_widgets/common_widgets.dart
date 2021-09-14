import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:latlong2/latlong.dart';

class CommonWidgets {
  static backButton(BuildContext context, String title) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,
                color: settingNotifier(true).currentColorTheme, size: 16)),
        Text("Post as $title",
            style: KConstantTextStyles.BoldText(fontSize: 16)),
      ],
    );
  }

  static customTextField(
      {required int minLines,
      required String hintText,
      required TextEditingController descriptionController}) {
    return Container(
        child: Center(
      child: TextField(
        minLines: minLines,
        maxLines: 6,
        style: TextStyle(color: KConstantColors.darkColor, fontSize: 16.0),
        controller: descriptionController,
        decoration: new InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: new TextStyle(
                color: KConstantColors.darkColor.withOpacity(0.4),
                fontSize: 16.0),
            fillColor: KConstantColors.textColor.withOpacity(0.2),
            border: new OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(const Radius.circular(5.0)))),
      ),
    ));
  }

  static assetSelection({required BuildContext context}) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _selectImage(
            {required double width,
            required IconData iconData,
            required Color iconColor,
            required String title,
            required dynamic onTap}) =>
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              color: KConstantColors.textColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, color: iconColor),
                hSizedBox1,
                Text(title,
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
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
                        iconColor: Colors.red,
                        width: 150,
                        iconData: Icons.remove,
                        onTap: () {
                          _postNotifierFalse.clearImages();
                        },
                        title: "Remove"),
                    hSizedBox1,
                    _selectImage(
                        iconColor: KConstantColors.greenColor,
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
                        iconColor: Colors.red,
                        width: 150,
                        iconData: Icons.remove,
                        onTap: () {
                          _postNotifierFalse.clearVideo();
                        },
                        title: "Remove"),
                    hSizedBox1,
                    _selectImage(
                        iconColor: KConstantColors.greenColor,
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
                iconColor: KConstantColors.greenColor,
                width: 100,
                iconData: EvaIcons.imageOutline,
                onTap: () {
                  _postNotifierFalse.pickImages(source: ImageSource.gallery);
                },
                title: "Image"),
            _selectImage(
                iconColor: Colors.red,
                width: 100,
                iconData: FontAwesomeIcons.video,
                onTap: () async {
                  await _postNotifierFalse.pickVideos();
                },
                title: "Video"),
            _selectImage(
                iconColor: Colors.deepPurpleAccent,
                width: 100,
                iconData: Icons.attach_file,
                onTap: () async {
                  SnackbarUtility.featureYetToCome(context: context);
                },
                title: "File")
          ],
        ),
      ],
    ));
  }

  static selectLocation({required BuildContext context}) {
    MapNotifier _mapNotifier({required bool renderUI}) =>
        Provider.of<MapNotifier>(context, listen: renderUI);
    renderMap() => Container(
          height: 300,
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
          Text("Pin location",
              style: KConstantTextStyles.MediumText(fontSize: 14)),
          vSizedBox1,
          Center(
            child: Text(_mapNotifier(renderUI: true).selectedLocation!,
                style: KConstantTextStyles.BoldText(fontSize: 12)),
          ),
          vSizedBox1,
          renderMap()
        ],
      ),
    );
  }
}
