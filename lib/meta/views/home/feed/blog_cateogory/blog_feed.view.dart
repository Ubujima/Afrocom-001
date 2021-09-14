import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/core/notifier/feed.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/home/feed/blog_cateogory/blog_post_block.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class BlogfeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FeedNotifier feedNotifier =
        Provider.of<FeedNotifier>(context, listen: false);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: feedNotifier.fetchCategoryPosts(
                    collectionID: DatabaseCredentials.BlogCategoryCollectionID,
                    context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List posts = snapshot.data as List;
                    if (posts.length == 0) {
                      return Center(
                        child: Text("No posts available!",
                            style: KConstantTextStyles.BoldText(fontSize: 16)),
                      );
                    }
                    return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlogPostBlock(post: posts[index]),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
