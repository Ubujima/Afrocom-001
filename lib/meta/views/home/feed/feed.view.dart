import 'package:afrocom/core/notifier/database.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:provider/provider.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          databaseNotifier.fetchPosts(context: context);
        },
      ),
    );
  }
}
