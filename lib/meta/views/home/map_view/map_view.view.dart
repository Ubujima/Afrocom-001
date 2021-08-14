import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    final mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    mapNotifier.getCurrentLocation(
        showBar: false, showCords: false, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    return Scaffold(
      floatingActionButton: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await mapNotifier.getCurrentLocation(
                      showBar: true, showCords: true, context: context);
                },
                child: Text("Current location Cords")),
            ElevatedButton(
                onPressed: () async {
                  await mapNotifier.getCurrentLocation(
                      showBar: true, showCords: false, context: context);
                },
                child: Text("Current location")),
            ElevatedButton(
                onPressed: () async {
                  await mapNotifier.animateToCurrentLocation(context: context);
                },
                child: Text("Animate to home"))
          ],
        ),
      ),
      body: Container(
        child: FlutterMap(
          mapController: mapNotifier.mapController,
          options: MapOptions(
            onLongPress: (latlng) {
              mapNotifier.findLocation(context: context, latLng: latlng);
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
                    point: Provider.of<MapNotifier>(context, listen: true)
                        .currentLocation!,
                    builder: (context) {
                      return Provider.of<MapNotifier>(context, listen: true)
                                  .currentLocation! !=
                              LatLng(0.0, .00)
                          ? CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.home),
                              backgroundColor: KConstantColors.bgColor,
                            )
                          : vSizedBox1;
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
