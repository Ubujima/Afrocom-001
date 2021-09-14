import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/views/sub_categories/market/product.view.dart';
import 'package:afrocom/meta/views/sub_categories/market/service_category.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMarketCategoryView extends StatefulWidget {
  @override
  _ShowMarketCategoryViewState createState() => _ShowMarketCategoryViewState();
}

class _ShowMarketCategoryViewState extends State<ShowMarketCategoryView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Post in Market Place",
                style: KConstantTextStyles.BoldText(fontSize: 14)),
            backgroundColor: KConstantColors.whiteColor.withOpacity(0.4),
            bottom: TabBar(
              labelColor: KConstantColors.whiteColor,
              tabs: [Tab(text: "Service"), Tab(text: "Product")],
            ),
          ),
          body: TabBarView(
            children: [ServiceCategory(), ProductCategory()],
          ),
        ));
  }
}
