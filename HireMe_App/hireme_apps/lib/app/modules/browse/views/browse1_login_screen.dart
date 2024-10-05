// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hireme_apps/app/modules/browse/models/jobcategorieslist_item_model.dart';
// import 'package:hireme_apps/app/modules/browse/models/selection_popup_model.dart';
// import '../controllers/browse1_login_controller.dart';

// class Browse1LoginScreen extends GetWidget<Browse1LoginController> {
//   const Browse1LoginScreen({Key? key}) : super(key: key);

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
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       "HireMe.id",
//                       style: TextStyle(
//                         color: Color(0XFF25324B),
//                         fontSize: 24,
//                         fontFamily: 'Red Hat Display',
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   _buildSearchSection(),
//                   const SizedBox(height: 28),
//                   _buildJobCategoryList(),
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

//   /// Section for Search Input
//   Widget _buildSearchSection() {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0XFFFFFFFF),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Column(
//         children: [
//           TextFormField(
//             controller: controller.searchController,
//             style: const TextStyle(
//               color: Color(0X6625324B),
//               fontSize: 20,
//               fontFamily: 'Red Hat Display',
//               fontWeight: FontWeight.w700,
//             ),
//             decoration: InputDecoration(
//               hintText: "Job title or keyword",
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SvgPicture.asset(
//                   "assets/images/img_icon.svg",
//                   height: 22,
//                   width: 22,
//                 ),
//               ),
//               suffixIcon: IconButton(
//                 onPressed: () => controller.searchController.clear(),
//                 icon: const Icon(Icons.clear, color: Color(0xff757575)),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Obx(
//             () => DropdownButtonFormField<SelectionPopupModel>(
//               value: controller.selectedDropDownValue,
//               onChanged: (value) => controller.onSelected(value),
//               items:
//                   controller.browse1LoginModelObj.value.dropdownItemList.value
//                       .map((item) => DropdownMenuItem<SelectionPopupModel>(
//                             value: item,
//                             child: Text(item.title),
//                           ))
//                       .toList(),
//               decoration: InputDecoration(
//                 hintText: "Malang, Indonesia",
//                 prefixIcon: SvgPicture.asset(
//                   "assets/images/img_icon_24x34.svg",
//                   height: 24,
//                   width: 34,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section for Job Categories
//   Widget _buildJobCategoryList() {
//     return Obx(
//       () => ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: controller
//             .browse1LoginModelObj.value.jobcategorylistItemList.value.length,
//         itemBuilder: (context, index) {
//           final model = controller
//               .browse1LoginModelObj.value.jobcategorylistItemList.value[index];
//           return JobcategorylistItemWidget(model);
//         },
//       ),
//     );
//   }

//   /// Button to show all jobs
//   Widget _buildShowAllJobsButton() {
//     return Row(
//       children: const [
//         Text(
//           "Show all jobs",
//           style: TextStyle(
//             color: Color(0XFF4640DE),
//             fontSize: 16,
//             fontFamily: 'Epilogue',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(width: 16),
//         Icon(Icons.arrow_forward, color: Color(0XFF4640DE)),
//       ],
//     );
//   }
// }

// /// Job Category List Item Widget
// class JobcategorylistItemWidget extends StatelessWidget {
//   final JobcategorieslistItemModel jobcategorylistItemModelObj;

//   const JobcategorylistItemWidget(this.jobcategorylistItemModelObj, {Key? key})
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
//         children: [
//           SvgPicture.asset(jobcategorylistItemModelObj.designOne!.value),
//           const SizedBox(width: 16),
//           Text(
//             jobcategorylistItemModelObj.designTwo!.value,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }
