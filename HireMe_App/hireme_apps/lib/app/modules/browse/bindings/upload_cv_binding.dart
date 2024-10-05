import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/browse/controllers/upload_cv_controller.dart';

/// A binding class for the UploadCvScreen.
/// This class ensures that the UploadCvController is created when the
/// UploadCvScreen is first loaded.
class UploadCvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadCvController>(() => UploadCvController());
  }
}
