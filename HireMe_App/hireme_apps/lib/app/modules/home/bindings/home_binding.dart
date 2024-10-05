import 'package:get/get.dart';
import '../controllers/homepageone_controller.dart'; // Import controller yang terkait

/// A binding class for the Home module.
///
/// This class ensures that all the necessary controllers are created
/// when the HomeScreen or its related views are loaded.
class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageoneController>(() => HomepageoneController());
  }
}
