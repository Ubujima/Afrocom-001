import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

showPostOnMap({required BuildContext context, required LatLng latLng}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 650,
          child: FlutterMap(
            options:
                MapOptions(onLongPress: (latlng) {}, zoom: 15, center: latLng),
            layers: [
              TileLayerOptions(
                  backgroundColor: KConstantColors.bgColor,
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  new Marker(
                      point: latLng,
                      builder: (context) {
                        return CircleAvatar(
                          radius: 40,
                          child: Icon(FontAwesomeIcons.mapPin),
                          backgroundColor: KConstantColors.bgColor,
                        );
                      })
                ],
              ),
            ],
          ),
        );
      });
}
