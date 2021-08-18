import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:provider/provider.dart';

PostingNotifier _postingNotifier(
        {required BuildContext context, required bool renderUI}) =>
    Provider.of<PostingNotifier>(context, listen: renderUI);

showPostingOptions({required BuildContext context}) {
  var _postCategory = [
    "Campaigns",
    "Blog",
    "Project",
    "Product",
    "Job offering",
    "Services"
  ];

  _postCategoryBlock({required String postType}) {
    return GestureDetector(
      onTap: () {
        _postingNotifier(context: context, renderUI: false)
            .assignSelectedPostTyle(candidatePostType: postType);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Provider.of<PostingNotifier>(context, listen: true)
                          .selectedPostType ==
                      postType
                  ? KConstantColors.blueColor
                  : KConstantColors.textColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(postType,
                  style: KConstantTextStyles.MediumText(fontSize: 18)),
              vSizedBox1,
              CircleAvatar(radius: 20, child: Icon(Icons.add))
            ],
          )),
        ),
      ),
    );
  }

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              vSizedBox1,
              Text("Select post category",
                  style: KConstantTextStyles.BoldText(fontSize: 20)),
              vSizedBox1,
              Container(
                height: 300,
                width: 400,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _postCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _postCategoryBlock(postType: _postCategory[index]);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(AddPostRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: KConstantColors.blueColor,
                      borderRadius: BorderRadius.circular(15)),
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                        "Post as ${_postingNotifier(context: context, renderUI: true).selectedPostType}",
                        style: KConstantTextStyles.BoldText(fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
          height: 410,
          decoration: BoxDecoration(
              color: KConstantColors.bgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        );
      });
}
