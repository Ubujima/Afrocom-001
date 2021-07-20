import 'package:afrocom/app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapController mapController = new MapController();

    return Container(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          onLongPress: (latLng) {
            print(latLng);
          },
          maxZoom: 10,
          zoom: 4,
          center: LatLng(8.7832, 34.5085),
        ),
        layers: [
          TileLayerOptions(
              backgroundColor: KConstantColors.bgColor,
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              // Marker(
              //   width: 80.0,
              //   height: 80.0,
              //   point: LatLng(51.5, -0.09),
              //   builder: (ctx) => Container(
              //     child: FlutterLogo(),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
