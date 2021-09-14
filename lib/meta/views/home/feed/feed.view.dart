import 'package:afrocom/core/notifier/feed.notifier.dart';
import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);
    FeedNotifier feedNotifier(bool renderUI) =>
        Provider.of<FeedNotifier>(context, listen: renderUI);
    List<String> _categories = [
      "Mood",
      "Blog",
      "Project",
      "Place",
      "Market",
      "Event",
      "Job"
    ];
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushNamed(HomeRoute);
            },
          ),
          title: Text("${feedNotifier(true).currentCategory} Feed",
              style: KConstantTextStyles.BoldText(fontSize: 16))),
      endDrawer: Container(
          width: 150,
          child: Drawer(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Filter posts",
                      style: KConstantTextStyles.MediumText(fontSize: 16)),
                  vSizedBox1,
                  Icon(FontAwesomeIcons.filter),
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return MaterialButton(
                              child: Text(_categories[index]),
                              color: settingNotifier(true).currentColorTheme,
                              onPressed: () {
                                feedNotifier(false).setCategory(
                                    candidateCategory: _categories[index]);
                                Navigator.pop(context);
                              });
                        }),
                  )
                ],
              ),
              decoration: BoxDecoration(color: KConstantColors.whiteColor),
            ),
          )),
      body: feedNotifier(false).categoryView(),
    );
  }
}
