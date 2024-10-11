import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/home/controllers/home_controller.dart';  // Import HomeController
import 'app/modules/home/controllers/auth_controller.dart';  // Import AuthController

void main() {
  // Inisialisasi HomeController secara global menggunakan Get.put
  Get.put(HomeController());
   Get.put(AuthController(), permanent: true);  // Permanent agar tidak diinisialisasi ulang
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HireMe.id',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Color(0xFF1230AE),
        scaffoldBackgroundColor: Color(0xFFD6C5FF),
      ),
    );
  }
}
