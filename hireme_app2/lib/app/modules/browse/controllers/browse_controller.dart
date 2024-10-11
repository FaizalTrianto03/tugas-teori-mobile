import 'package:get/get.dart';
import '../../../data/job_categories.dart'; // Mengimpor data dummy

class BrowseController extends GetxController {
  // Menyimpan daftar kategori pekerjaan
  var jobCategories = <JobCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Menginisialisasi daftar kategori pekerjaan dengan data dummy dari job_categories.dart
    loadJobCategories();
  }

  // Memuat data kategori pekerjaan
  void loadJobCategories() {
    // Mengisi variabel jobCategories dengan data dummy dari job_categories.dart
    jobCategories.assignAll(jobCategoriesData);  // PERBAIKAN: Menggunakan jobCategoriesData dari job_categories.dart
  }
}
