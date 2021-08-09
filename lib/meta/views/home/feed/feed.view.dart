import 'package:afrocom/meta/views/authentication/login/login.exports.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // databaseNotifier.fetchPosts(context: context);
        },
      ),
    );
  }
}
