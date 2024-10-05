import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/profile/controllers/otp_email_number_controller.dart';

class OtpEmailNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpEmailNumberController>(() => OtpEmailNumberController());
  }
}
