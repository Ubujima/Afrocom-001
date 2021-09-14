import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/core/notifier/filter.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/meta/views/home/add_post/components/posting_options.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'components/task_bar.component.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Future initiateMarker() async {
    MapNotifier mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    FilterNotifier filterNotifier =
        Provider.of<FilterNotifier>(context, listen: false);
    await mapNotifier.initiateMarkers(
        collectionId: filterNotifier.filterPost, context: context);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      initiateMarker();
    });
  }

  @override
  Widget build(BuildContext context) {
    MapNotifier mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    MapNotifier mapNotifierTrue =
        Provider.of<MapNotifier>(context, listen: true);
    return Scaffold(
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: "aaaaaa",
                backgroundColor: KConstantColors.bgColorFaint,
                child: Icon(FontAwesomeIcons.filter,
                    color: KConstantColors.greenColor),
                onPressed: () {
                  showFilterOptions(context: context);
                }),
            vSizedBox1,
            FloatingActionButton(
                heroTag: "a",
                backgroundColor: KConstantColors.whiteColor,
                child: Icon(
                    mapNotifierTrue.showTaskBar == true
                        ? Icons.remove
                        : Icons.add,
                    color: KConstantColors.darkColor),
                onPressed: () {
                  mapNotifier.toggleShowSubTaskBar();
                }),
          ],
        ),
      ),
      drawer: Drawer(),
      body: Container(
          child: Stack(
        children: [
          Container(
            child: FlutterMap(
              options: MapOptions(
                zoom: 3,
                center: LatLng(4.7832, 16.5085),
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: mapNotifier.markers)
              ],
            ),
          ),
          mapNotifierTrue.showSubTaskBar == true ? SubTaskBar() : vSizedBox0,
        ],
      )),
    );
  }
}
