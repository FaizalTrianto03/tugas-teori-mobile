import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/job_data.dart'; // Import Job data
import '../../../modules/home/controllers/home_controller.dart';

class Browse5LoginView extends StatefulWidget {
  final Job job; // Job data diterima dari halaman sebelumnya
  final List<Map<String, dynamic>> uploadedFiles; // Data file yang diupload (untuk formalitas)

  Browse5LoginView({required this.job, required this.uploadedFiles});

  @override
  _Browse5LoginViewState createState() => _Browse5LoginViewState();
}

class _Browse5LoginViewState extends State<Browse5LoginView> {
  final TextEditingController _additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background color to make content stand out
      appBar: AppBar(
        title: Text(
          widget.job.position,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0, // Flat appbar for clean look
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCongratulationSection(),
            const SizedBox(height: 20),
            _buildUploadedFilesCard(),
            const SizedBox(height: 20),
            _buildAdditionalInformationField(),
            const SizedBox(height: 30),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  // Section for Congratulations message
  Widget _buildCongratulationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '🎉 Congratulations!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1230AE),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Your application has been sent.',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Image.asset(
          'assets/images/illustration_success.png', // Replace with your illustration image
          height: 180,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  // Card for displaying fake uploaded file information
  Widget _buildUploadedFilesCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uploaded Files',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1230AE),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: widget.uploadedFiles.map((file) {
                return ListTile(
                  leading: Icon(Icons.insert_drive_file, color: Colors.grey),
                  title: Text(
                    file['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Size: ${file['size']} • Uploaded on ${file['date']} at ${file['time']}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Section for additional information (Text Field)
  Widget _buildAdditionalInformationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1230AE)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _additionalInfoController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Write any additional information here...',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  // Two Buttons (Back to Home and Find a Similar Job)
  Widget _buildButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Update currentIndex to 3 for bottom navbar using HomeController
                final HomeController homeController = Get.find<HomeController>();
                homeController.changeTabIndex(0); // Set the index to 3
              // Navigate to home page
              Get.offAllNamed('/home-login');
            },
            child: Text(
              'Back to Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.white, // Gray-blue color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Show similar jobs based on the category
              Get.toNamed('/browse-login', arguments: widget.job.categories);
            },
            child: Text(
              'Find a Similar Job',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xFF1230AE), // Primary color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
