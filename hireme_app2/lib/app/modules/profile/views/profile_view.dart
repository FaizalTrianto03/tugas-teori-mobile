import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../../widgets/custom_bottom_navbar.dart'; // Import custom bottom navbar
import 'package:hireme_app2/app/modules/home/controllers/auth_controller.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.put(ProfileController());

  bool _obscureText = true; // Untuk mengatur hide/show password
  final TextEditingController _emailController =
      TextEditingController(); // Controller untuk email
  final TextEditingController _passwordController =
      TextEditingController(); // Controller untuk password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Mengatasi overflow dengan scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              // Bagian "Join HireMe.id"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore now',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Join HireMe.id',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Bagian Login
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input Email Address (TextField)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextField(
                      controller:
                          _emailController, // Gunakan controller untuk email
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder
                            .none, // Menghilangkan border default TextField
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Input Password (TextField)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextField(
                      controller:
                          _passwordController, // Gunakan controller untuk password
                      obscureText:
                          _obscureText, // Tampilkan atau sembunyikan password
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder
                            .none, // Menghilangkan border default TextField
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Toggle hide/show password
                            });
                          },
                        ),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Text "Forgot Password?"
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Aksi untuk lupa password
                        print("Forgot Password clicked");
                      },
                      child: const Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: Color(0xFF1230AE), fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tombol Sign In
                  ElevatedButton(
                    onPressed: () {
                      // Logika untuk cek apakah field email dan password tidak kosong
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        // Mengubah status login menjadi true
                        final AuthController authController =
                            Get.find<AuthController>();
                        authController.isLoggedIn.value = true;

                        // Arahkan ke halaman profile login
                        Get.toNamed('/profile-login');
                      } else {
                        // Jika salah satu field kosong, tampilkan pesan error
                        Get.snackbar(
                          'Error',
                          'Please fill in both email and password',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Warna tombol
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Color(0xFF1230AE), // Warna border biru
                          width: 2, // Ketebalan border
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1230AE), // Warna teks biru
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  // Tombol Create Account, disamakan formatnya dengan Sign In
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                          '/create-account'); // Arahkan ke halaman Create Account
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1230AE),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Bagian Pembatas (or)
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 40),
              // Tombol Sign Up dengan Google
              GestureDetector(
                onTap: () {
                  final AuthController authController =
                      Get.find<AuthController>();
                  authController.isLoggedIn.value =
                      true; // Set isLoggedIn menjadi true
                  Get.toNamed(
                      '/profile-login'); // Arahkan ke halaman profile-login
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(244.19),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Menempatkan konten di tengah
                      children: [
                        Image.asset('assets/images/google.png', height: 24),
                        const SizedBox(width: 16),
                        const Text(
                          'Sign up with Google',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavBar(), // Menggunakan custom bottom nav bar
    );
  }
}
