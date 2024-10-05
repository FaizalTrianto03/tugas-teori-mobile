import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/browse/controllers/company_controller.dart';

/// A binding class for the CompanyScreen.
/// This class ensures that the CompanyController is created when the
/// CompanyScreen is first loaded.
class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyController>(() => CompanyController());
  }
}
