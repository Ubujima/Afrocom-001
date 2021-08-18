import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/core/models/fetch_posts.dart';
import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'database.notifier.dart';

class MapNotifier extends ChangeNotifier {
  LatLng? _currentLocation = LatLng(0.0, 0.0);
  LatLng? get currentLocation => _currentLocation;

  final MapController mapController = new MapController();

  Future animateToCurrentLocation({required BuildContext context}) async {
    SnackbarUtility.showLoadingSnackbar(
        time: 3, title: "Scanning location...", context: context);
    Location location = new Location();
    var _locationCords = await location.getLocation();
    _currentLocation =
        LatLng(_locationCords.latitude!, _locationCords.longitude!);
    notifyListeners();
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      mapController.move(
          LatLng(_locationCords.latitude!, _locationCords.longitude!), 18);
    });
    notifyListeners();
  }

  //! Find location
  Future findLocation(
      {required BuildContext context, required LatLng latLng}) async {
    final List<GeoCoding.Placemark> placemark =
        await GeoCoding.placemarkFromCoordinates(
            latLng.latitude, latLng.longitude);
    print(placemark);
    SnackbarUtility.showSnackbar(
        context: context,
        message:
            "Address : ${placemark.first.administrativeArea}, ${placemark.first.subAdministrativeArea}, ${placemark.first.subLocality}, ${placemark.first.country}, ${placemark.first.isoCountryCode}");
  }

  //! Fetch current location
  Future getCurrentLocation(
      {required bool showBar,
      required bool showCords,
      required BuildContext context}) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _currentLocation =
        LatLng(_locationData.latitude!, _locationData.longitude!);
    notifyListeners();
    if (_locationData.toString().isNotEmpty) {
      List<GeoCoding.Placemark> placemark =
          await GeoCoding.placemarkFromCoordinates(
              _locationData.latitude!, _locationData.longitude!);
      notifyListeners();
      if (showBar) {
        if (showCords) {
          SnackbarUtility.showLoadingSnackbar(
              time: 3, title: "Fetching location cords...", context: context);
          SnackbarUtility.showSnackbar(
              context: context,
              message:
                  "Current Location : Latitude = ${_locationData.latitude} Longitude = ${_locationData.longitude}");
        } else {
          SnackbarUtility.showLoadingSnackbar(
              time: 3, title: "Fetching location...", context: context);
          SnackbarUtility.showSnackbar(
              context: context,
              message:
                  "Current Location : ${placemark.first.administrativeArea}, ${placemark.first.subAdministrativeArea}, ${placemark.first.subLocality}, ${placemark.first.country}, ${placemark.first.isoCountryCode}");
        }
      }
    }
  }

  //! UI SECTION
  bool? _showTaskBar = false;
  bool? get showTaskBar => _showTaskBar;

  bool? _showSubTaskBar = false;
  bool? get showSubTaskBar => _showSubTaskBar;
  toggleShowTaskBar() {
    _showTaskBar = !_showTaskBar!;
    notifyListeners();
  }

  toggleShowSubTaskBar() {
    _showSubTaskBar = !_showSubTaskBar!;
    notifyListeners();
  }

  //! ADD POST SERVICES
  String? _selectedLocation = "";
  String? get selectedLocation => _selectedLocation;

  LatLng? _selectedLocationCords = LatLng(0, 0);
  LatLng? get selectedLocationCords => _selectedLocationCords;

  Future renderTappedLocation(
      {required BuildContext context, required LatLng latLng}) async {
    final List<GeoCoding.Placemark> placemark =
        await GeoCoding.placemarkFromCoordinates(
            latLng.latitude, latLng.longitude);
    _selectedLocationCords = null;
    _selectedLocationCords = latLng;
    String _userLocation =
        "${placemark.first.subAdministrativeArea},${placemark.first.street},${placemark.first.subLocality},${placemark.first.country}";
    _selectedLocation = _userLocation;
    notifyListeners();
    SnackbarUtility.showSnackbar(context: context, message: _userLocation);
  }

  double _initialZoomLevel = 6;
  double get initialZoomLevel => _initialZoomLevel;
  slideZoomLevel({required double candidateValue}) {
    _initialZoomLevel = candidateValue;
    print(_initialZoomLevel);
    notifyListeners();
  }

  //!<---------------------------------------INITIATE MARKERS---------------------------------------------->
  List<Marker> _markers = [];
  List<Marker> get markers => _markers;

  initiateMarkers({required BuildContext context}) async {
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

    final databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    var data =
        await databaseNotifier.fetchCoordinates(context: context) as List;
    var _snapshot = data;
    _snapshot.forEach((postData) {
      FetchPostsData fetchPostsData = postData;
      String markerImage = ImageTags.AngryFace;
      var userMood = fetchPostsData.postusermood;
      switch (userMood) {
        case "Happy":
          {
            markerImage = ImageTags.HappyFace;
          }
          break;
        case "Arrogant":
          {
            markerImage = ImageTags.ArrogantFace;
          }
          break;
        case "Angry":
          {
            markerImage = ImageTags.AngryFace;
          }
          break;
        case "Shock":
          {
            markerImage = ImageTags.ShockFace;
          }
          notifyListeners();
      }
      double addLatitude =
          postlatitude(candidateString: fetchPostsData.postuserlocationcords);
      double addLongitude =
          postlongitude(candidateString: fetchPostsData.postuserlocationcords);
      Marker marker = Marker(
          point: LatLng(addLatitude, addLongitude),
          builder: (context) => new CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(markerImage),
                backgroundColor: Colors.transparent,
              ));
      _markers.add(marker);
      notifyListeners();
    });
  }
}
