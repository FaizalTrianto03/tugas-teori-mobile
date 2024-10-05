import 'package:get/get.dart';
import '../controllers/browse2_login_controller.dart';

class Browse2LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Browse2LoginController());
  }
}
