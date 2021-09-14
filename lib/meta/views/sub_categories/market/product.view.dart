import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/market/market_common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class ProductCategory extends StatefulWidget {
  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  @override
  void initState() {
    productTitleController = TextEditingController();
    productDescriptionController = TextEditingController();
    productPriceController = TextEditingController();
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
                  hintText: "Product Title",
                  descriptionController: productTitleController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 4,
                  hintText: "Product Description",
                  descriptionController: productDescriptionController),
              vSizedBox1,
              CommonWidgets.customTextField(
                  minLines: 1,
                  hintText: "Enter price",
                  descriptionController: productPriceController),
              vSizedBox2,
              Text("Choose a category",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              vSizedBox1,
              MarketCommonWidgets.renderProductCategory(),
              vSizedBox2,
              Text("Add Media",
                  style: KConstantTextStyles.MediumText(fontSize: 14)),
              CommonWidgets.assetSelection(context: context),
              vSizedBox2,
              CommonWidgets.selectLocation(context: context),
              vSizedBox1,
              MarketCommonWidgets.uploadMarketProductPost(
                  productTitleController: productTitleController,
                  productDescriptionController: productDescriptionController,
                  marketPriceController: productPriceController,
                  context: context),
              vSizedBox3
            ],
          ),
        ),
      ),
    );
  }
}
