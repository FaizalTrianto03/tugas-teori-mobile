import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool _isEmailFilled = false;
  bool _isNameFilled = false;
  bool _isPhoneFilled = false;
  bool _isPasswordFilled = false;
  bool _isConfirmPasswordFilled = false;

  // Controllers untuk TextField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _validateAndSubmit() {
    // Cek jika semua field terisi
    if (emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // Tampilkan error menggunakan Get.snackbar jika ada field yang kosong
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
    } else if (passwordController.text != confirmPasswordController.text) {
      // Cek jika password dan confirm password tidak sama
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
    } else {
      // Jika semua validasi terpenuhi, navigasi ke halaman sukses
      Get.toNamed('/create-account-success');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali ke halaman profile
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up to get started!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1230AE),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please fill in the information below to create an account.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Email Address Field
              _buildTextField(
                'Email Address',
                Icons.email,
                _isEmailFilled,
                (value) {
                  setState(() {
                    _isEmailFilled = value.isNotEmpty;
                  });
                },
                emailController,
              ),

              const SizedBox(height: 16),

              // Full Name Field
              _buildTextField(
                'Full Name',
                Icons.person,
                _isNameFilled,
                (value) {
                  setState(() {
                    _isNameFilled = value.isNotEmpty;
                  });
                },
                nameController,
              ),

              const SizedBox(height: 16),

              // Phone Number Field
              _buildPhoneNumberField(),

              const SizedBox(height: 16),

              // Password Field
              _buildPasswordField(
                'Password',
                _obscurePassword,
                _isPasswordFilled,
                (value) {
                  setState(() {
                    _isPasswordFilled = value.isNotEmpty;
                  });
                },
                () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                passwordController,
              ),

              const SizedBox(height: 16),

              // Confirm Password Field
              _buildPasswordField(
                'Confirm Password',
                _obscureConfirmPassword,
                _isConfirmPasswordFilled,
                (value) {
                  setState(() {
                    _isConfirmPasswordFilled = value.isNotEmpty;
                  });
                },
                () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                confirmPasswordController,
              ),

              const SizedBox(height: 32),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validateAndSubmit, // Tambahkan validasi saat tombol diklik
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF1230AE), // Warna biru yang sama
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, bool isFilled, Function(String) onChanged, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isFilled
            ? Border.all(color: Color(0xFF1230AE), width: 2)
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: isFilled ? null : label, // Hapus placeholder saat field diisi
          prefixIcon: Icon(icon, color: Color(0xFF1230AE)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          fontSize: 16,
          color: isFilled ? Color(0xFF1230AE) : Colors.black,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: _isPhoneFilled
            ? Border.all(color: Color(0xFF1230AE), width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {
            _isPhoneFilled = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          labelText: _isPhoneFilled ? null : 'Phone Number',
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: '+62', // Default value
              underline: SizedBox(), // Menghilangkan garis bawah dropdown
              items: ['+62', '+1', '+44', '+91'].map((String code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          fontSize: 16,
          color: _isPhoneFilled ? Color(0xFF1230AE) : Colors.black,
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      String label, bool obscureText, bool isFilled, Function(String) onChanged, VoidCallback onIconPressed, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isFilled
            ? Border.all(color: Color(0xFF1230AE), width: 2)
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: isFilled ? null : label,
          prefixIcon: Icon(Icons.lock, color: Color(0xFF1230AE)),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: onIconPressed,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          fontSize: 16,
          color: isFilled ? Color(0xFF1230AE) : Colors.black,
        ),
      ),
    );
  }
}
