import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'map.notifier.dart';

class FilterNotifier extends ChangeNotifier {
  String _currentSelectedFilteredPosts = "";
  String get currentSelectedFilteredPosts => _currentSelectedFilteredPosts;

  bool _showParentFilter = false;
  bool get showParentFilter => _showParentFilter;

  bool _showChildFilter = false;
  bool get showChildFilter => _showChildFilter;

  assignPostToBeFiltered({required String canditateValue}) {
    _currentSelectedFilteredPosts = canditateValue;
    notifyListeners();
  }

  toggleShowChildFilter() {
    _showChildFilter = !_showChildFilter;
    notifyListeners();
  }

  toggleShowParentFilter() {
    _showParentFilter = !_showParentFilter;
    notifyListeners();
  }

  removeAllFilters({required BuildContext context}) {
    MapNotifier mapNotifier({required bool renderUI}) =>
        Provider.of<MapNotifier>(context, listen: renderUI);
    _currentSelectedFilteredPosts = "";
    mapNotifier(renderUI: false).removeMarkerFilter();
    notifyListeners();
  }
}
