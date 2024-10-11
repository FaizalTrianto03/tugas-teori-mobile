import 'package:get/get.dart';
import '../controllers/browse_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi BrowseController saat halaman Browse diakses
    Get.lazyPut<BrowseController>(() => BrowseController());
  }
}
