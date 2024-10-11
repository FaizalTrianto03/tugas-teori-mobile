import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/custom_bottom_navbar.dart'; // Import Custom BottomNavigationBar

class HomeViewLogin extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

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
                text: 'Welcome Back\n',
                style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Explore More Jobs',
                    style: TextStyle(fontSize: 40, color: Color(0xFF1230AE), fontWeight: FontWeight.bold),
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
                        hintText: "Search for jobs...",
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
              "Discover job offers that match your profile",
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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Pemanggilan Custom Bottom Navigation Bar
    );
  }
}
