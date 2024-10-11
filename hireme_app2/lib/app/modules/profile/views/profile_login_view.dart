import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/profile_dummy.dart'; // Import profile data dummy
import '../../../widgets/custom_bottom_navbar.dart'; // Import custom bottom navbar
import '../../home/controllers/auth_controller.dart'; // Import AuthController
import '../../../data/notification_data.dart'; // Import data notifikasi dummy

class ProfileLoginView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>(); // Temukan AuthController

  @override
  Widget build(BuildContext context) {
    int unreadNotifications = notificationList.where((notif) => !notif.isRead).length; // Hitung notifikasi belum dibaca

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
  color: Color(0xFF1230AE), // Set background color to blue
  child: ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/images/profile.jpg'), // Gambar profil
    ),
    title: Text(
      '${profileData['firstName']} ${profileData['lastName']}', // Gabungkan firstName dan lastName dengan benar
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Set text color to white
    ),
    subtitle: Text(
      profileData['email'] ?? '', // Email
      style: TextStyle(color: Colors.white70), // Set subtitle text color to a lighter white shade
    ),
    trailing: Icon(
      Icons.edit,
      color: Colors.white, // Set icon color to white
    ),
    onTap: () {
      Get.toNamed('/edit-profile'); // Arahkan ke rute edit profile
    },
  ),
),

            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  // Notifikasi dengan jumlah notifikasi belum dibaca
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    trailing: unreadNotifications > 0
                        ? Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$unreadNotifications',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Get.toNamed('/notifications'); // Navigasi ke halaman Notifikasi
                    },
                  ),
                  // Two-factor Authentication
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Two-factor Authentication'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Get.toNamed('/two-factor-step1'), // Navigasi ke two-factor
                  ),
                  // FAQ
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('FAQ'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Get.toNamed('/faq'), // Navigasi ke halaman FAQ
                  ),
                  // Logout
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showLogoutConfirmationDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Tambahkan bottom nav bar
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Are you sure you want to log out?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              authController.isLoggedIn.value = false; // Set isLoggedIn menjadi false
              Get.offAllNamed('/profile'); // Arahkan ke halaman profile yang belum login
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
