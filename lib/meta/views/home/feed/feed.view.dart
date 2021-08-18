import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/feed/components/feed.widgets.dart';
import 'package:afrocom/meta/widgets/back_button.dart';
import 'package:provider/provider.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.darkColor,
      body: Container(
        child: Column(
          children: [
            vSizedBox3,
            CustomBackButton(
                backPressed: () => Navigator.of(context).pushNamed(HomeRoute),
                title: "Feed"),
            Container(
              height: 700,
              width: 400,
              child: Consumer<PostingNotifier>(
                builder: (context, notifier, _) {
                  return StreamBuilder(
                      stream: notifier.posts(context: context),
                      builder: (context, snapshot) {
                        var _snapshot = snapshot.data as List;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No posts available!",
                                style:
                                    KConstantTextStyles.BoldText(fontSize: 16)),
                          );
                        }
                        if (_snapshot.length == 0) {
                          return Center(
                            child: Text("No posts available!",
                                style:
                                    KConstantTextStyles.BoldText(fontSize: 16)),
                          );
                        } else {
                          return FeedWidgets.listOfPosts(snapshot: _snapshot);
                        }
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
