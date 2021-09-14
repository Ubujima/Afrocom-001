import 'package:afrocom/core/services/database.service.dart';
import 'package:afrocom/meta/views/home/feed/blog_cateogory/blog_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/event_category/event_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/job_category/job_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/market_category/market_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/mood_category/mood_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/place_category/place_feed.view.dart';
import 'package:afrocom/meta/views/home/feed/project_category/project_feed.view.dart';
import 'package:flutter/cupertino.dart';

class FeedNotifier extends ChangeNotifier {
  bool _showLocation = false;
  bool get showLocation => _showLocation;

  toggleShowLocation() {
    _showLocation = !_showLocation;
    notifyListeners();
  }

  String _currentCategory = "Mood";
  String get currentCategory => _currentCategory;

  setCategory({required String candidateCategory}) {
    _currentCategory = candidateCategory;
    print(_currentCategory);
    notifyListeners();
  }

  Widget categoryView() {
    switch (_currentCategory) {
      case "Blog":
        {
          return BlogfeedView();
        }
      case "Project":
        {
          return ProjectfeedView();
        }
      case "Place":
        {
          return PlacefeedView();
        }
      case "Event":
        {
          return EventfeedView();
        }
      case "Job":
        {
          return JobfeedView();
        }
      case "Market":
        {
          return MarketfeedView();
        }
      default:
        {
          return MoodfeedView();
        }
    }
  }

  //! Mood posts
  Future fetchCategoryPosts(
      {required String collectionID, required BuildContext context}) async {
    try {
      dynamic response = await DatabaseService.createInstance
          .fetchPosts(collectionId: collectionID, context: context);
      List posts = response['documents'];
      return posts;
    } catch (e) {
      print(e);
    }
  }
}
