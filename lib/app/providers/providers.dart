import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/core/notifier/feed.notifier.dart';
import 'package:afrocom/core/notifier/filter.notifier.dart';
import 'package:afrocom/core/notifier/map.notifier.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/core/notifier/profile_setup.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/campaign_and_project.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/event.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/job.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/market.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/mood_post.notifier.dart';
import 'package:afrocom/core/notifier/subcategories/place.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => DatabaseNotifier()),
    ChangeNotifierProvider(create: (_) => UtilityNotifier()),
    ChangeNotifierProvider(create: (_) => ProfileSetupNotifier()),
    ChangeNotifierProvider(create: (_) => MapNotifier()),
    ChangeNotifierProvider(create: (_) => PostingNotifier()),
    ChangeNotifierProvider(create: (_) => FeedNotifier()),
    ChangeNotifierProvider(create: (_) => FilterNotifier()),
    ...categoryProviders
  ];

  static List<SingleChildWidget> categoryProviders = [
    ChangeNotifierProvider(create: (_) => EventNotifier()),
    ChangeNotifierProvider(create: (_) => MoodPostNotifier()),
    ChangeNotifierProvider(create: (_) => PlaceNotifier()),
    ChangeNotifierProvider(create: (_) => JobNotifier()),
    ChangeNotifierProvider(create: (_) => CampaignAndProjectNotifier()),
    ChangeNotifierProvider(create: (_) => MarketNotifier()),
  ];
}
