import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/controllers/auth_controller.dart'; // Pastikan AuthController digunakan

class CustomBottomNavBar extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Jika user belum login, navigasi ke halaman yang belum login
      if (!authController.isLoggedIn.value) {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTabIndex(index);
            switch (index) {
              case 0:
                Get.offAllNamed('/home');
                break;
              case 1:
                Get.offAllNamed('/browse');
                break;
              case 2:
                Get.offAllNamed('/applied');  // Halaman belum login
                break;
              case 3:
                Get.offAllNamed('/profile');  // Halaman belum login
                break;
            }
          },
          selectedItemColor: const Color(0xFF1230AE),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
            BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Applied'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      } else {
        // Jika user sudah login, navigasi ke halaman yang sudah login
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTabIndex(index);
            switch (index) {
              case 0:
                Get.offAllNamed('/home-login');  // Halaman sudah login
                break;
              case 1:
                Get.offAllNamed('/browse-login');
                break;
              case 2:
                Get.offAllNamed('/applied-login');
                break;
              case 3:
                Get.offAllNamed('/profile-login');
                break;
            }
          },
          selectedItemColor: const Color(0xFF1230AE),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
            BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Applied'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }
    });
  }
}
