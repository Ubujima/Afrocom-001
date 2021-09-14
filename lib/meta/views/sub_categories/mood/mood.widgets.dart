import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:afrocom/core/models/post.model.dart';
import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/core/services/storage.service.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:latlong2/latlong.dart';

class MoodWidgets {
  static customTextField({required TextEditingController moodPostTitle}) {
    return Container(
        child: Center(
      child: TextField(
        minLines: 2,
        maxLines: 6,
        style: TextStyle(color: KConstantColors.darkColor, fontSize: 16.0),
        controller: moodPostTitle,
        decoration: new InputDecoration(
            filled: true,
            hintText: "Post title",
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

  static selectImageSection({required BuildContext context}) {
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
        if (_postNotifierTrue.pickedVideoPath == null &&
            _postNotifierTrue.selectedImage == null)
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

  static moodSection({required BuildContext context}) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _moods({required String image}) => GestureDetector(
          onTap: () {
            _postingNotifier(renderUI: false)
                .assignSubcategory(candidateSubCategory: image);
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius:
                _postingNotifier(renderUI: true).subCategory == image ? 25 : 15,
            backgroundImage: AssetImage(image),
          ),
        );
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _moods(image: ImageTags.HappyFace),
          _moods(image: ImageTags.AngryFace),
          _moods(image: ImageTags.ArrogantFace),
          _moods(image: ImageTags.ShockFace)
        ],
      ),
    );
  }

  static addLocation({required BuildContext context}) {
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

  static uploadMoodPost(
      {required String parentCategory,
      required TextEditingController moodTitleController,
      required BuildContext context}) {
    var mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    return GestureDetector(
      onTap: () async {
        if (moodTitleController.text.isEmpty) {
          SnackbarUtility.showSnackbar(
              context: context, message: "Enter title");
        } else {
          dynamic userData = await authenticationNotifier.getCurrentUserSession(
              context: context);
          String _postUserId = userData['\$id'];
          String _postUsername = userData['name'];
          String _postTime = DateTime.now().toString();
          String _postCategory = parentCategory;
          String postTitle = moodTitleController.text;
          String _postSubCategory =
              _postingNotifier(renderUI: false).subCategory;
          String _postUserAddress = mapNotifier.selectedLocation!;
          String _postUserLocationCoordinates =
              "${mapNotifier.selectedLocationCords!.latitude.toString()},${mapNotifier.selectedLocationCords!.longitude.toString()}";
          if (_postingNotifier(renderUI: false).pickedVideoFile == null) {
            dynamic _postAsset = await StorageService.createInstance
                .uploadPostAsset(
                    assetPath:
                        _postingNotifier(renderUI: false).selectedImage!.path,
                    context: context);
            await DatabaseService.createInstance.uploadPost(
                collectionId: DatabaseCredentials.MoodCategoryCollectionID,
                data: Post(
                        _postCategory,
                        _postUsername,
                        _postSubCategory,
                        [_postAsset],
                        postTitle,
                        _postUserAddress,
                        _postUserLocationCoordinates,
                        _postTime,
                        _postUserId,
                        false)
                    .toJson(),
                context: context);
          }
          if (_postingNotifier(renderUI: false).pickedVideoFile != null) {
            print("Uploading video post");
            await _postingNotifier(renderUI: false)
                .uploadPostVideo(context: context)
                .whenComplete(() async {
              String _postAsset =
                  _postingNotifier(renderUI: false).uploadedVideoURL;
              await DatabaseService.createInstance.uploadPost(
                  collectionId: DatabaseCredentials.MoodCategoryCollectionID,
                  data: Post(
                          _postCategory,
                          _postUsername,
                          _postSubCategory,
                          [_postAsset],
                          postTitle,
                          _postUserAddress,
                          _postUserLocationCoordinates,
                          _postTime,
                          _postUserId,
                          true)
                      .toJson(),
                  context: context);
            });
          }
        }
      },
      child: Center(
        child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: KConstantColors.blueColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Text("Upload Post",
                    style: TextStyle(
                        fontFamily: KConstantFonts.PoppinsBold,
                        color: KConstantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))),
      ),
    );
  }
}
