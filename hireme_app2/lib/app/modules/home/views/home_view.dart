import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/custom_bottom_navbar.dart'; // Import Custom BottomNavigationBar
import '../controllers/auth_controller.dart';  // Import AuthController

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());  // Inisialisasi AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HireMe.id',
          style: TextStyle(
            fontFamily: 'RedHatDisplay',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFD6C5FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Find Your\n',
                style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dream Job',
                    style: TextStyle(fontSize: 40, color: Color(0xFF1230AE), fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '\nHere!',
                    style: TextStyle(fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5))],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.search, size: 30, color: Colors.grey),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Start your career...",
                        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(child: Image.asset('assets/images/homepage-image.png', fit: BoxFit.fill)),
            const SizedBox(height: 20),
            const Text(
              "Find job offers from the most popular job listing sites",
              style: TextStyle(
                fontFamily: 'RedHatDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(child: Image.asset('assets/images/most-popular-job.png', fit: BoxFit.fill)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Mengatur status login menjadi true dan navigasi ke halaman HomeViewLogin
                    authController.loginWithGoogle();
                    Get.offAllNamed('/create-account');  // Navigasi ke Home setelah login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1230AE),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("Create Account", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    // Mengatur status login menjadi true dan navigasi ke halaman HomeViewLogin
                    authController.loginWithGoogle();
                    Get.offAllNamed('/home-login');  // Navigasi ke Home setelah login
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    side: BorderSide(color: Colors.grey),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Center(child: Image.asset('assets/images/google.png')),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Pemanggilan Custom Bottom Navigation Bar
    );
  }
}
