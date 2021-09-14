import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:flutter/material.dart';

class FilterNotifier extends ChangeNotifier {
  String _filterPost = DatabaseCredentials.MoodCategoryCollectionID;
  String get filterPost => _filterPost;

  void assignPostToBeFiltered(
      {required BuildContext context, required String candidateValue}) {
    MapNotifier mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    switch (candidateValue) {
      case "Blog":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.BlogCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
        break;
      case "Campaign":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.CampaignCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
        break;
      case "Place":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.PlaceCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
        break;
      case "Market":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.MarketCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
        break;
      case "Event":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.EventCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
        break;
      case "Job":
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.JobCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
          break;
        }
      default:
        {
          mapNotifier.clearMarkers();
          _filterPost = "";
          _filterPost = DatabaseCredentials.MoodCategoryCollectionID;
          notifyListeners();
          Navigator.of(context).pushNamed(HomeRoute);
        }
    }
  }
}
