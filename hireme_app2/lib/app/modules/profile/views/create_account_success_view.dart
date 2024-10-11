import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hireme_app2/app/modules/home/controllers/auth_controller.dart'; // Import AuthController
import 'package:hireme_app2/app/modules/home/controllers/home_controller.dart'; // Import HomeController for managing currentIndex

class CreateAccountSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Created'),
        automaticallyImplyLeading: false, // Disable back button on success page
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/success.png'), // Replace this with your own image path
            const SizedBox(height: 32),
            Text(
              'Account Created Successfully!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Your account has been created successfully. You can now use the app with your new account.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Mengubah status login menjadi true
                final AuthController authController =
                    Get.find<AuthController>();
                authController.isLoggedIn.value = true;

                // Update currentIndex to 3 for bottom navbar using HomeController
                final HomeController homeController = Get.find<HomeController>();
                homeController.changeTabIndex(3); // Set the index to 3

                // Navigasi ke halaman profile login
                Get.offAllNamed('/profile-login');
              },
              child: Text('OK'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
