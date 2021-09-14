import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/market/market_common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class ServiceCategory extends StatefulWidget {
  @override
  _ServiceCategoryState createState() => _ServiceCategoryState();
}

class _ServiceCategoryState extends State<ServiceCategory> {
  TextEditingController serviceTitleController = TextEditingController();
  TextEditingController serviceDescriptionController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();

  @override
  void initState() {
    serviceTitleController = TextEditingController();
    serviceDescriptionController = TextEditingController();
    servicePriceController = TextEditingController();
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
                  hintText: "Service Title",
                  descriptionController: serviceTitleController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 4,
                  hintText: "Service Description",
                  descriptionController: serviceDescriptionController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 1,
                  hintText: "Enter price",
                  descriptionController: servicePriceController),
              vSizedBox2,
              Text("Choose a category",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              vSizedBox1,
              MarketCommonWidgets.renderServiceCategory(),
              vSizedBox2,
              Text("Add Media",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              CommonWidgets.assetSelection(context: context),
              vSizedBox2,
              CommonWidgets.selectLocation(context: context),
              vSizedBox1,
              MarketCommonWidgets.uploadMarketServicePost(
                  serviceTitleController: serviceTitleController,
                  serviceDescriptionController: serviceDescriptionController,
                  servicePriceController: servicePriceController,
                  context: context),
              vSizedBox3
            ],
          ),
        ),
      ),
    );
  }
}
