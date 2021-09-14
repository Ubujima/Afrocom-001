import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/meta/arguments/solo_post.argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'database.notifier.dart';

class MapNotifier extends ChangeNotifier {
  LatLng? _currentLocation = LatLng(0.0, 0.0);
  LatLng? get currentLocation => _currentLocation;

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
  }

  //!<---------------------------------------INITIATE MARKERS---------------------------------------------->
  List<Marker> _markers = [];
  List<Marker> get markers => _markers;

  bool _isMarkerFiltered = false;
  bool get isMarkerFiltered => _isMarkerFiltered;

  Future initiateMarkers(
      {required String collectionId, required BuildContext context}) async {
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

    Color? markerColor;
    switch (collectionId) {
      case DatabaseCredentials.BlogCategoryCollectionID:
        {
          markerColor = Colors.pink;
        }
        break;
      case DatabaseCredentials.CampaignCategoryCollectionID:
        {
          markerColor = Colors.green;
        }
        break;
      case DatabaseCredentials.EventCategoryCollectionID:
        {
          markerColor = Colors.orange;
        }
        break;
      case DatabaseCredentials.JobCategoryCollectionID:
        {
          markerColor = Colors.blue;
        }
        break;
      case DatabaseCredentials.MarketCategoryCollectionID:
        {
          markerColor = Colors.yellow;
        }
        break;
      case DatabaseCredentials.PlaceCategoryCollectionID:
        {
          markerColor = Colors.brown;
          break;
        }
      default:
        {
          //!Mood
          markerColor = Colors.deepOrangeAccent;
        }
    }

    final databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    var data = await databaseNotifier.fetchCoordinates(
        collectionId: collectionId, context: context) as List;
    var _snapshot = data;
    _snapshot.forEach((postData) {
      print('Assigning markers');
      String collectionId = postData['\$collection'];
      String query = postData['\$id'];
      double addLatitude =
          postlatitude(candidateString: postData['postuserlocationcords']);
      double addLongitude =
          postlongitude(candidateString: postData['postuserlocationcords']);
      Marker marker = Marker(
          point: LatLng(addLatitude, addLongitude),
          builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SoloPostRoute,
                      arguments: SoloPostArguments(
                          collectionId: collectionId, query: query));
                },
                child: new CircleAvatar(
                  radius: 22.0,
                  backgroundColor: markerColor,
                ),
              ));
      _markers.add(marker);
      notifyListeners();
    });
  }

  //!<------------------------------------------REMOVE FILTERED MARKERS OF POSTS--------------------------------------->
  clearMarkers() {
    _markers = [];
    notifyListeners();
  }
}
