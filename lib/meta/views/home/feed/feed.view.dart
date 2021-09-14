import 'package:afrocom/core/notifier/feed.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
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
              style: KConstantTextStyles.BoldText(fontSize: 16)),
          backgroundColor: Colors.lightBlue),
      endDrawer: Container(
          width: 150,
          child: Drawer(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                              onPressed: () {
                                feedNotifier(false).setCategory(
                                    candidateCategory: _categories[index]);
                                Navigator.pop(context);
                              },
                              child: Text(_categories[index]));
                        }),
                  )
                ],
              ),
              decoration: BoxDecoration(color: KConstantColors.bgColorFaint),
            ),
          )),
      body: feedNotifier(false).categoryView(),
    );
  }
}
