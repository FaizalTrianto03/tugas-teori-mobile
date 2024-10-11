import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Untuk navigasi
import '../../../data/profile_dummy.dart'; // Import dummy profile data

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _firstNameController =
      TextEditingController(text: profileData['firstName']);
  final TextEditingController _lastNameController =
      TextEditingController(text: profileData['lastName']);
  final TextEditingController _emailController =
      TextEditingController(text: profileData['email']);
  final TextEditingController _phoneController =
      TextEditingController(text: profileData['phoneNumber']);
  final TextEditingController _addressController =
      TextEditingController(text: profileData['address']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Bagian Gambar Profil dengan Icon Edit
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/profile.jpg'), // Menampilkan gambar dari AssetImage
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: Color(0xFF1230AE),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Field First Name dan Last Name dengan judul di atas
              _buildProfileFieldTitle('First Name'),
              _buildProfileField(_firstNameController),
              const SizedBox(height: 16),
              _buildProfileFieldTitle('Last Name'),
              _buildProfileField(_lastNameController),
              const SizedBox(height: 16),
              _buildProfileFieldTitle('Email Address'),
              _buildProfileField(_emailController),
              const SizedBox(height: 16),
              _buildProfileFieldTitle('Phone Number'),
              _buildProfileField(_phoneController),
              const SizedBox(height: 16),
              _buildProfileFieldTitle('Address'),
              _buildProfileField(_addressController),
              const SizedBox(height: 30),

              // Tombol Update formalitas, tidak melakukan perubahan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Arahkan kembali ke halaman profile login
                    Get.offAllNamed('/profile-login');
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF1230AE), // Warna biru
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

  // Membuat field judul
  Widget _buildProfileFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Membuat field input dengan controller
  Widget _buildProfileField(TextEditingController controller) {
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
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
}
