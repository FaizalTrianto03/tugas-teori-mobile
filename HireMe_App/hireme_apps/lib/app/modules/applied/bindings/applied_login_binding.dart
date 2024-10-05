import 'package:get/get.dart';
import '../controllers/applied_login_controller.dart';

class AppliedLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppliedLoginController());
  }
}
