import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/core/notifier/filter.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/meta/views/home/map_view/components/task_bar.component.dart';
import 'package:afrocom/meta/widgets/filter_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    mapNotifier.initiateMarkers(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FilterNotifier _filterNotifier(
            {required BuildContext context, required bool renderUI}) =>
        Provider.of<FilterNotifier>(context, listen: renderUI);
    MapNotifier mapNotifier({required bool renderUI}) =>
        Provider.of<MapNotifier>(context, listen: renderUI);

    renderMap() => Container(
          child: FlutterMap(
            mapController: mapNotifier(renderUI: false).mapController,
            options: MapOptions(
              onLongPress: (latlng) {
                mapNotifier(renderUI: false)
                    .findLocation(context: context, latLng: latlng);
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
              if (!mapNotifier(renderUI: false).isMarkerFiltered)
                MarkerLayerOptions(
                    markers: mapNotifier(renderUI: true).markers),
              if (mapNotifier(renderUI: false).isMarkerFiltered)
                MarkerLayerOptions(
                    markers: mapNotifier(renderUI: true).filteredMarkers),
            ],
          ),
        );

    return Scaffold(
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (mapNotifier(renderUI: false).isMarkerFiltered)
              FloatingActionButton(
                  backgroundColor: KConstantColors.bgColorFaint,
                  child: Icon(FontAwesomeIcons.trashAlt,
                      color: KConstantColors.greenColor),
                  onPressed: () {
                    _filterNotifier(context: context, renderUI: false)
                        .removeAllFilters(context: context);
                  }),
            vSizedBox1,
            FloatingActionButton(
                backgroundColor: KConstantColors.bgColorFaint,
                child: Icon(FontAwesomeIcons.filter,
                    color: KConstantColors.greenColor),
                onPressed: () {
                  showParentFilterTypes(context: context);
                }),
            vSizedBox1,
            FloatingActionButton(
                backgroundColor: KConstantColors.bgColorFaint,
                child: Icon(
                    mapNotifier(renderUI: true).showTaskBar == true
                        ? Icons.remove
                        : Icons.add,
                    color: mapNotifier(renderUI: true).showTaskBar == true
                        ? Colors.red
                        : KConstantColors.greenColor),
                onPressed: () {
                  mapNotifier(renderUI: false).toggleShowSubTaskBar();
                }),
          ],
        ),
      ),
      body: Container(
          child: Stack(
        children: [
          renderMap(),
          mapNotifier(renderUI: true).showSubTaskBar == true
              ? SubTaskBar()
              : vSizedBox0,
          if (_filterNotifier(context: context, renderUI: true)
                  .currentSelectedFilteredPosts ==
              "Mood")
            showMoodSubFilters(context: context)
        ],
      )),
    );
  }
}
