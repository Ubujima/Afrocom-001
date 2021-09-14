import 'package:afrocom/app/shared/dimensions.dart';
import 'package:afrocom/app/shared/textStyles.dart';
import 'package:afrocom/meta/views/sub_categories/common_widgets/common_widgets.dart';
import 'package:afrocom/meta/views/sub_categories/job/job.widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowJobCategoryView extends StatefulWidget {
  @override
  _ShowJobCategoryViewState createState() => _ShowJobCategoryViewState();
}

class _ShowJobCategoryViewState extends State<ShowJobCategoryView> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobAddressController = TextEditingController();

  @override
  void initState() {
    jobTitleController = TextEditingController();
    jobDescriptionController = TextEditingController();
    jobAddressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                CommonWidgets.backButton(context, "Job"),
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Job Title",
                    descriptionController: jobTitleController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 4,
                    hintText: "Job Description",
                    descriptionController: jobDescriptionController),
                vSizedBox1,
                CommonWidgets.customTextField(
                    minLines: 1,
                    hintText: "Job Address",
                    descriptionController: jobAddressController),
                vSizedBox1,
                Text("Contract type",
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                vSizedBox1,
                JobWidgets.renderContractType(context: context),
                vSizedBox2,
                Text("Experience level",
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                vSizedBox1,
                JobWidgets.renderjobExperienceLevel(context: context),
                vSizedBox2,
                Text("Choose a category",
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                JobWidgets.renderSubCategory(),
                vSizedBox2,
                Text("Post Media",
                    style: KConstantTextStyles.MediumText(fontSize: 14)),
                CommonWidgets.assetSelection(context: context),
                vSizedBox2,
                CommonWidgets.selectLocation(context: context),
                vSizedBox1,
                JobWidgets.uploadJobPost(
                    jobTitleController: jobTitleController,
                    jobDescriptionController: jobDescriptionController,
                    jobAddressController: jobAddressController,
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



// class ShowJobsCategoryView extends StatefulWidget {
//   @override
//   _ShowJobsCategoryViewState createState() => _ShowJobsCategoryViewState();
// }

// class _ShowJobsCategoryViewState extends State<ShowJobsCategoryView> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Post in Jobs",
//                 style: KConstantTextStyles.BoldText(fontSize: 16)),
//             backgroundColor: KConstantColors.bgColorFaint,
//             bottom: TabBar(
//               labelColor: KConstantColors.whiteColor,
//               tabs: [
//                 Tab(text: "Looking for"),
//                 Tab(text: "Offering for"),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [JobOfferingView(), JobLookingForView()],
//           ),
//         ));
//   }
// }

// class JobLookingForView extends StatefulWidget {
//   @override
//   _JobLookingForViewState createState() => _JobLookingForViewState();
// }

// class _JobLookingForViewState extends State<JobLookingForView> {
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController titleController = TextEditingController();

//   @override
//   void initState() {
//     descriptionController = TextEditingController();
//     titleController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     PostingNotifier _postingNotifier({required bool renderUI}) =>
//         Provider.of<PostingNotifier>(context, listen: renderUI);

//     _customTextField(
//         {required int minLines,
//         required String hintText,
//         required TextEditingController textEditingController}) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         child: Container(
//             child: Center(
//           child: TextField(
//             minLines: minLines,
//             maxLines: 6,
//             style: TextStyle(color: KConstantColors.whiteColor, fontSize: 16.0),
//             controller: textEditingController,
//             decoration: new InputDecoration(
//                 filled: true,
//                 hintText: hintText,
//                 hintStyle: new TextStyle(
//                     color: KConstantColors.textColor, fontSize: 16.0),
//                 fillColor: KConstantColors.bgColorFaint,
//                 border: new OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius:
//                         BorderRadius.all(const Radius.circular(5.0)))),
//           ),
//         )),
//       );
//     }

//     _serviceSubCategoryTile({required String subCategoryTitle}) {
//       return GestureDetector(
//         onTap: () {
//           _postingNotifier(renderUI: false)
//               .assignSubcategory(candidateSubCategory: subCategoryTitle);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Container(
//             child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                     child: Text(subCategoryTitle,
//                         style: KConstantTextStyles.MediumText(fontSize: 16)))),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: _postingNotifier(renderUI: true).subCategory ==
//                         subCategoryTitle
//                     ? KConstantColors.greenColor
//                     : KConstantColors.bgColorFaint),
//           ),
//         ),
//       );
//     }

//     List<String> _subCategory = [
//       "Admin/Office",
//       "Accounting/Finance",
//       "Education/Teaching,",
//       "General Labor",
//       "Customer Service",
//       "Art/Media/Design",
//       "Security",
//       "Systems/Networking"
//     ];

//     _renderSubCategory() {
//       return GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 60,
//           width: 400,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: _subCategory.length,
//             itemBuilder: (BuildContext context, int index) {
//               return _serviceSubCategoryTile(
//                   subCategoryTitle: _subCategory[index]);
//             },
//           ),
//         ),
//       );
//     }

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [
//               KConstantColors.darkColor,
//               KConstantColors.bgColor,
//             ],
//             begin: const FractionalOffset(0.0, 0.1),
//             end: const FractionalOffset(0.9, 0.0),
//             stops: [0.5, 1.0]),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             vSizedBox1,
//             _customTextField(
//                 minLines: 1,
//                 hintText: "Enter Looking For title",
//                 textEditingController: titleController),
//             vSizedBox1,
//             _customTextField(
//                 minLines: 4,
//                 hintText: "Enter Looking For Description",
//                 textEditingController: descriptionController),
//             vSizedBox1,
//             Text(" Select job type",
//                 style: KConstantTextStyles.MediumText(fontSize: 16)),
//             _renderSubCategory(),
//             AddPostComponents.selectImageSection(
//                 isVideoNeeded: false, context: context),
//             vSizedBox2,
//             AddPostComponents.addLocation(context: context),
//             vSizedBox2,
//             uploadPostButton(
//                 parentCategory:
//                     _postingNotifier(renderUI: false).selectedPostType!,
//                 textEditingController: descriptionController,
//                 context: context),
//             vSizedBox3
//           ],
//         ),
//       ),
//     );
//   }
// }

// class JobOfferingView extends StatefulWidget {
//   @override
//   _JobOfferingViewState createState() => _JobOfferingViewState();
// }

// class _JobOfferingViewState extends State<JobOfferingView> {
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController titleController = TextEditingController();

//   @override
//   void initState() {
//     descriptionController = TextEditingController();
//     titleController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     PostingNotifier _postingNotifier({required bool renderUI}) =>
//         Provider.of<PostingNotifier>(context, listen: renderUI);

//     _customTextField(
//         {required int minLines,
//         required String hintText,
//         required TextEditingController textEditingController}) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         child: Container(
//             child: Center(
//           child: TextField(
//             minLines: minLines,
//             maxLines: 6,
//             style: TextStyle(color: KConstantColors.whiteColor, fontSize: 16.0),
//             controller: textEditingController,
//             decoration: new InputDecoration(
//                 filled: true,
//                 hintText: hintText,
//                 hintStyle: new TextStyle(
//                     color: KConstantColors.textColor, fontSize: 16.0),
//                 fillColor: KConstantColors.bgColorFaint,
//                 border: new OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius:
//                         BorderRadius.all(const Radius.circular(5.0)))),
//           ),
//         )),
//       );
//     }

//     _serviceSubCategoryTile({required String subCategoryTitle}) {
//       return GestureDetector(
//         onTap: () {
//           _postingNotifier(renderUI: false)
//               .assignSubcategory(candidateSubCategory: subCategoryTitle);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Container(
//             child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                     child: Text(subCategoryTitle,
//                         style: KConstantTextStyles.MediumText(fontSize: 16)))),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: _postingNotifier(renderUI: true).subCategory ==
//                         subCategoryTitle
//                     ? KConstantColors.greenColor
//                     : KConstantColors.bgColorFaint),
//           ),
//         ),
//       );
//     }

//     List<String> _subCategory = [
//       "Admin/Office",
//       "Accounting/Finance",
//       "Education/Teaching,",
//       "General Labor",
//       "Customer Service",
//       "Art/Media/Design",
//       "Security",
//       "Systems/Networking"
//     ];

//     _renderSubCategory() {
//       return GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 60,
//           width: 400,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: _subCategory.length,
//             itemBuilder: (BuildContext context, int index) {
//               return _serviceSubCategoryTile(
//                   subCategoryTitle: _subCategory[index]);
//             },
//           ),
//         ),
//       );
//     }

//     return Container(
//       height: 800,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [
//               KConstantColors.darkColor,
//               KConstantColors.bgColor,
//             ],
//             begin: const FractionalOffset(0.0, 0.1),
//             end: const FractionalOffset(0.9, 0.0),
//             stops: [0.5, 1.0]),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             vSizedBox1,
//             _customTextField(
//                 minLines: 1,
//                 hintText: "Enter Offering For title",
//                 textEditingController: titleController),
//             vSizedBox1,
//             _customTextField(
//                 minLines: 4,
//                 hintText: "Enter Offering For Description",
//                 textEditingController: descriptionController),
//             vSizedBox1,
//             Text("Select Job type",
//                 style: KConstantTextStyles.MediumText(fontSize: 16)),
//             _renderSubCategory(),
//             AddPostComponents.selectImageSection(
//                 isVideoNeeded: false, context: context),
//             vSizedBox2,
//             AddPostComponents.addLocation(context: context),
//             vSizedBox2,
//             uploadPostButton(
//                 parentCategory:
//                     _postingNotifier(renderUI: false).selectedPostType!,
//                 textEditingController: descriptionController,
//                 context: context),
//             vSizedBox3
//           ],
//         ),
//       ),
//     );
//   }
// }
