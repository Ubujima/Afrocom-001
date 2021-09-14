import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';
import 'campaign_and_projecy_common_widgets.dart';

class ShowProjectPostView extends StatefulWidget {
  @override
  _ShowProjectPostViewState createState() => _ShowProjectPostViewState();
}

class _ShowProjectPostViewState extends State<ShowProjectPostView> {
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController requiredFundsAmountController = TextEditingController();
  TextEditingController raisedFundsAmountController = TextEditingController();

  @override
  void initState() {
    projectTitleController = TextEditingController();
    projectDescriptionController = TextEditingController();
    requiredFundsAmountController = TextEditingController();
    raisedFundsAmountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 1,
                  hintText: "Project Title",
                  descriptionController: projectTitleController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 4,
                  hintText: "Project Description",
                  descriptionController: projectDescriptionController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 1,
                  hintText: "Enter Required Funds",
                  descriptionController: requiredFundsAmountController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 1,
                  hintText: "Enter Raised Funds",
                  descriptionController: raisedFundsAmountController),
              vSizedBox2,
              Text("Choose a category",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              vSizedBox1,
              ProjectAndCampaignCommonWidgets.renderProjectCategory(),
              vSizedBox2,
              Text("Add media",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              CommonWidgets.assetSelection(context: context),
              vSizedBox2,
              CommonWidgets.selectLocation(context: context),
              vSizedBox1,
              ProjectAndCampaignCommonWidgets.uploadProjectPost(
                  projectTitleController: projectTitleController,
                  projectDescriptionController: projectDescriptionController,
                  requiredFundsAmountController: requiredFundsAmountController,
                  raisedFundsControllerController: raisedFundsAmountController,
                  context: context),
              vSizedBox3
            ],
          ),
        ),
      ),
    );
  }
}
