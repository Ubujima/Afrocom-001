import 'package:afrocom/meta/utilities/snackbar.utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

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
}
