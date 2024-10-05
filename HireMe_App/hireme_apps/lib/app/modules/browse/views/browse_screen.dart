// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hireme_apps/app/modules/browse/models/jobcategorieslist_item_model.dart';
// import '../controllers/browse_controller.dart';
// import '../models/selection_popup_model.dart';

// class BrowseScreen extends GetWidget<BrowseController> {
//   const BrowseScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color(0XFFD6C5FF),
//         body: SizedBox(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Container(
//               width: double.maxFinite,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildHeader(),
//                   const SizedBox(height: 28),
//                   _buildSearchSection(),
//                   const SizedBox(height: 28),
//                   _buildJobCategoriesList(),
//                   const SizedBox(height: 26),
//                   _buildShowAllJobsButton(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Header Widget
//   Widget _buildHeader() {
//     return const Padding(
//       padding: EdgeInsets.only(left: 4),
//       child: Text(
//         "HireMe.id",
//         style: TextStyle(
//           color: Color(0XFF25324B),
//           fontSize: 24,
//           fontFamily: 'Red Hat Display',
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }

//   /// Search Section Widget
//   Widget _buildSearchSection() {
//     return Container(
//       width: double.maxFinite,
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: const Color(0XFFFFFFFF),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SizedBox(height: 4),
//           _buildSearchTextField(),
//           const SizedBox(height: 12),
//           _buildLocationDropdown(),
//           const SizedBox(height: 12),
//           _buildSearchButton(),
//         ],
//       ),
//     );
//   }

//   /// Search Text Field
//   Widget _buildSearchTextField() {
//     return SizedBox(
//       width: 350,
//       child: TextFormField(
//         controller: controller.searchController,
//         style: const TextStyle(
//           color: Color(0X6625324B),
//           fontSize: 20,
//           fontFamily: 'Red Hat Display',
//           fontWeight: FontWeight.w700,
//         ),
//         decoration: InputDecoration(
//           hintText: "Job title or keyword",
//           hintStyle: const TextStyle(
//             color: Color(0X6625324B),
//             fontSize: 20,
//             fontFamily: 'Red Hat Display',
//             fontWeight: FontWeight.w700,
//           ),
//           prefixIcon: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 12, 28, 12),
//             child: SvgPicture.asset(
//               "assets/images/img_icon.svg",
//               height: 22,
//               width: 22,
//               fit: BoxFit.contain,
//             ),
//           ),
//           suffixIcon: IconButton(
//             onPressed: () {
//               controller.searchController.clear();
//             },
//             icon: const Icon(
//               Icons.clear,
//               color: Color(0xff757575),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Location Dropdown Widget
//   Widget _buildLocationDropdown() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Obx(
//         () => Container(
//           width: 256,
//           margin: const EdgeInsets.only(left: 18),
//           child: DropdownButtonFormField<SelectionPopupModel>(
//             icon: Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: SvgPicture.asset(
//                 "assets/images/img_arrowdown_24x16.svg",
//                 height: 24,
//                 width: 16,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             style: const TextStyle(
//               color: Color(0X6625324B),
//               fontSize: 20,
//               fontFamily: 'Red Hat Display',
//               fontWeight: FontWeight.w700,
//             ),
//             onChanged: (value) {
//               controller.onSelected(value);
//             },
//             items: controller.browseModelObj.value.dropdownItemList.value
//                 .map((SelectionPopupModel item) {
//               return DropdownMenuItem<SelectionPopupModel>(
//                 value: item,
//                 child: Text(item.title),
//               );
//             }).toList(),
//             decoration: const InputDecoration(
//               hintText: "Malang, Indonesia",
//               hintStyle: TextStyle(
//                 color: Color(0X6625324B),
//                 fontSize: 20,
//                 fontFamily: 'Red Hat Display',
//                 fontWeight: FontWeight.w700,
//               ),
//               border: InputBorder.none,
//               isDense: true,
//               contentPadding: EdgeInsets.symmetric(vertical: 2),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Search Button Widget
//   Widget _buildSearchButton() {
//     return Container(
//       width: double.maxFinite,
//       height: 56,
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: const Color(0XFF4640DE),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
//         ),
//         onPressed: () {
//           // Handle search action
//         },
//         child: const Text(
//           "Search my job",
//           style: TextStyle(
//             color: Color(0XFFFFFFFF),
//             fontSize: 18,
//             fontFamily: 'Epilogue',
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }

//   /// Job Categories List Widget
//   Widget _buildJobCategoriesList() {
//     return Obx(
//       () => ListView.separated(
//         padding: EdgeInsets.zero,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         separatorBuilder: (context, index) {
//           return const SizedBox(height: 16);
//         },
//         itemCount: controller
//             .browseModelObj.value.jobcategorieslistItemList.value.length,
//         itemBuilder: (context, index) {
//           final model = controller
//               .browseModelObj.value.jobcategorieslistItemList.value[index];
//           return JobcategorieslistItemWidget(model);
//         },
//       ),
//     );
//   }

//   /// Show All Jobs Button Widget
//   Widget _buildShowAllJobsButton() {
//     return SizedBox(
//       width: double.maxFinite,
//       child: Row(
//         children: [
//           const Text(
//             "Show all jobs",
//             style: TextStyle(
//               color: Color(0XFF4640DE),
//               fontSize: 16,
//               fontFamily: 'Epilogue',
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: SizedBox(
//               height: 24,
//               width: 24,
//               child: SvgPicture.asset(
//                 "assets/images/img_icon_8.svg",
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// /// Job Categories List Item Widget
// class JobcategorieslistItemWidget extends StatelessWidget {
//   final JobcategorieslistItemModel jobcategorieslistItemModelObj;

//   const JobcategorieslistItemWidget(this.jobcategorieslistItemModelObj, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0XFFFFFFFF),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: const Color(0XFFD6DDEB), width: 1),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Obx(
//             () => SizedBox(
//               height: 40,
//               width: 40,
//               child: SvgPicture.asset(
//                 jobcategorieslistItemModelObj.designOne!.value,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 254,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Obx(
//                   () => Text(
//                     jobcategorieslistItemModelObj.designTwo!.value,
//                     style: const TextStyle(
//                       color: Color(0XFF25324B),
//                       fontSize: 20,
//                       fontFamily: 'Clash Display',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Obx(
//                       () => Text(
//                         jobcategorieslistItemModelObj.jobs!.value,
//                         style: const TextStyle(
//                           color: Color(0XFF7C8493),
//                           fontSize: 16,
//                           fontFamily: 'Epilogue',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 24,
//                       width: 24,
//                       child: SvgPicture.asset(
//                         "assets/images/img_icon_24x24.svg",
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
