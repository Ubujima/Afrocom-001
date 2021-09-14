import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/meta/arguments/solo_post.argument.dart';
import 'package:afrocom/meta/views/solo_post/blog_solo_post.dart';
import 'package:afrocom/meta/views/solo_post/campaign_solo_post.dart';
import 'package:afrocom/meta/views/solo_post/event_solo_post.dart';
import 'package:afrocom/meta/views/solo_post/market_solo_post.dart';
import 'package:afrocom/meta/views/solo_post/mood_solo_post.dart';
import 'package:afrocom/meta/views/solo_post/place_solo_post.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class SoloPost extends StatefulWidget {
  final SoloPostArguments soloPostArguments;
  const SoloPost({required this.soloPostArguments});
  @override
  _SoloPostState createState() => _SoloPostState();
}

class _SoloPostState extends State<SoloPost> {
  @override
  Widget build(BuildContext context) {
    String collectionID = widget.soloPostArguments.collectionId;
    switch (collectionID) {
      case (DatabaseCredentials.MoodCategoryCollectionID):
        {
          return MoodSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      case (DatabaseCredentials.BlogCategoryCollectionID):
        {
          return BlogSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      case (DatabaseCredentials.CampaignCategoryCollectionID):
        {
          return CampaignSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      case (DatabaseCredentials.PlaceCategoryCollectionID):
        {
          return PlaceSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      case (DatabaseCredentials.MarketCategoryCollectionID):
        {
          return MarketSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      case (DatabaseCredentials.EventCategoryCollectionID):
        {
          return EventSoloPost(soloPostArguments: widget.soloPostArguments);
        }
      default:
        {
          return BlogSoloPost(soloPostArguments: widget.soloPostArguments);
        }
    }
  }
}
