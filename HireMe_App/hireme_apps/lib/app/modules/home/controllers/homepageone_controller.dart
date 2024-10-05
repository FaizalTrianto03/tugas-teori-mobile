import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This class defines the variables used in the [HomepageoneScreen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomepageoneModel {
  // You can add fields here to store additional data in the future
}

/// A controller class for the HomepageoneScreen.
///
/// This class manages the state of the HomepageoneScreen, including the
/// current homepageoneModelObj.
class HomepageoneController extends GetxController {
  // Controller for the search input field
  TextEditingController searchController = TextEditingController();

  // Reactive object that holds the state of the HomepageoneModel
  Rx<HomepageoneModel> homepageoneModelObj = HomepageoneModel().obs;

  @override

  void onClose() {
    super.onClose();
    // Dispose the search controller to prevent memory leaks
    searchController.dispose();
  }
}

/// A binding class for the HomepageoneScreen.
///
/// This class ensures that the HomepageoneController is created when the
/// HomepageoneScreen is first loaded.
class HomepageoneBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load the controller when needed
    Get.lazyPut(() => HomepageoneController());
  }
}
