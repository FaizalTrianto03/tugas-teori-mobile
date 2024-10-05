import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/browse/controllers/description_controller.dart';

/// A binding class for the DescriptionScreen.
/// This class ensures that the DescriptionController is created when the DescriptionScreen is first loaded.
class DescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DescriptionController>(() => DescriptionController());
  }
}
