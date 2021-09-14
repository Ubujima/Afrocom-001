import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/core/notifier/posting.notifier.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/event/event.widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShowEventCategoryView extends StatefulWidget {
  @override
  _ShowEventCategoryViewState createState() => _ShowEventCategoryViewState();
}

class _ShowEventCategoryViewState extends State<ShowEventCategoryView> {
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventAddressController = TextEditingController();

  @override
  void initState() {
    eventTitleController = TextEditingController();
    eventDescriptionController = TextEditingController();
    eventAddressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostingNotifier _postingNotifier({required bool renderUI}) =>
        Provider.of<PostingNotifier>(context, listen: renderUI);
    _serviceSubCategoryTile({required String subCategoryTitle}) {
      return GestureDetector(
        onTap: () {
          _postingNotifier(renderUI: false)
              .assignSubcategory(candidateSubCategory: subCategoryTitle);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(subCategoryTitle,
                        style: KConstantTextStyles.MediumText(fontSize: 16)))),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _postingNotifier(renderUI: true).subCategory ==
                        subCategoryTitle
                    ? KConstantColors.yellowColor
                    : KConstantColors.textColor.withOpacity(0.4)),
          ),
        ),
      );
    }

    List<String> _subCategory = [
      "Agriculture",
      "Politics",
      "Religion",
      "History",
      "Business",
      "Health",
      "Entertainment",
      "Lifestyle"
    ];

    _renderSubCategory() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _subCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return _serviceSubCategoryTile(
                  subCategoryTitle: _subCategory[index]);
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox2,
                CommonWidgets.backButton(context, "Event"),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Event Title",
                    descriptionController: eventTitleController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 4,
                    hintText: "Event Description",
                    descriptionController: eventDescriptionController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Add address",
                    descriptionController: eventAddressController),
                vSizedBox1,
                EventWidgets.chooseDateTime(context: context),
                vSizedBox1,
                Text("Choose a category",
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                vSizedBox1,
                _renderSubCategory(),
                CommonWidgets.assetSelection(context: context),
                vSizedBox2,
                CommonWidgets.selectLocation(context: context),
                vSizedBox1,
                EventWidgets.uploadEventPost(
                    eventTitleController: eventTitleController,
                    eventDescriptionController: eventDescriptionController,
                    eventAddressController: eventAddressController,
                    context: context),
                vSizedBox3
              ],
            ),
          ),
        ),
      ),
    );
  }
}
