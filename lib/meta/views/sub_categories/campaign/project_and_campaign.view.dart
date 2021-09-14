import 'package:afrocom/meta/views/sub_categories/campaign/campaign.view.dart';
import 'package:afrocom/meta/views/sub_categories/campaign/project.view.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class ShowProjectAndCampaignView extends StatefulWidget {
  @override
  _ShowProjectAndCampaignViewState createState() =>
      _ShowProjectAndCampaignViewState();
}

class _ShowProjectAndCampaignViewState
    extends State<ShowProjectAndCampaignView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title:
                CommonWidgets.backButton(context, "Post in Project & Campaign"),
            backgroundColor: KConstantColors.textColor.withOpacity(0.4),
            bottom: TabBar(
              labelColor: KConstantColors.whiteColor,
              tabs: [Tab(text: "Project"), Tab(text: "Campaign")],
            ),
          ),
          body: TabBarView(
            children: [ShowProjectPostView(), ShowCampaignPostView()],
          ),
        ));
  }
}
