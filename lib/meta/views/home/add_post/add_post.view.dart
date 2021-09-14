import 'package:afrocom/meta/arguments/add_post.argument.dart';
import 'package:afrocom/meta/utilities/sub_category.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.exports.dart';

class AddPostView extends StatefulWidget {
  final AddPostArgument addPostArgument;
  const AddPostView({required this.addPostArgument});
  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowSubCategories(
          parentCategory: widget.addPostArgument.parentCategory),
    );
  }
}
