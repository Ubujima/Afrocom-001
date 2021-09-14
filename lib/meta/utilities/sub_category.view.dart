import 'package:afrocom/meta/views/sub_categories/blog/blog_category.view.dart';
import 'package:afrocom/meta/views/sub_categories/campaign/project_and_campaign.view.dart';
import 'package:afrocom/meta/views/sub_categories/event/event_category.view.dart';
import 'package:afrocom/meta/views/sub_categories/job/jobs_category.view.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood_category.view.dart';
import 'package:afrocom/meta/views/sub_categories/market/marketplace_category.view.dart';
import 'package:afrocom/meta/views/sub_categories/places/place_category.view.dart';
import 'package:flutter/material.dart';

class ShowSubCategories extends StatelessWidget {
  final String parentCategory;
  const ShowSubCategories({required this.parentCategory});

  @override
  Widget build(BuildContext context) {
    switch (parentCategory) {
      case "Blog":
        {
          return ShowBlogCategoryView();
        }
      case "Market":
        {
          return ShowMarketCategoryView();
        }
      case "Job":
        {
          return ShowJobCategoryView();
        }
      case "Place":
        {
          return ShowPlaceCategoryView();
        }
      case "Event":
        {
          return ShowEventCategoryView();
        }
      case "Campaign":
        {
          return ShowProjectAndCampaignView();
        }
      default:
        {
          return ShowMoodCategoryView();
        }
    }
  }
}
