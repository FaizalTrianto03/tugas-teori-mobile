import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/profile/controllers/verification_controller.dart';

/// A binding class for the VerificationScreen.
/// This class ensures that the VerificationController is created when the VerificationScreen is first loaded.
class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(() => VerificationController());
  }
}
