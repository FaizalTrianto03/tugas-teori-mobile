// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../models/browse_model.dart';
// import '../models/selection_popup_model.dart';

// /// Controller class for the BrowseScreen and BrowsetwoScreen.
// class BrowseController extends GetxController {
//   // Text field controller for search input
//   TextEditingController searchController = TextEditingController();

//   // Reactive model object
//   Rx<BrowseModel> browseModelObj = BrowseModel().obs;

//   // Dropdown selection handling
//   SelectionPopupModel? selectedDropDownValue;

//   @override
//   void onClose() {
//     super.onClose();
//     // Dispose the searchController to prevent memory leaks
//     searchController.dispose();
//   }

//   // Method to handle dropdown item selection
//   void onSelected(dynamic value) {
//     for (var element in browseModelObj.value.dropdownItemList.value) {
//       element.isSelected = false;
//       if (element.id == value.id) {
//         element.isSelected = true;
//       }
//     }
//     browseModelObj.value.dropdownItemList.refresh();
//   }
// }
