import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hireme_app2/app/data/job_data.dart';
import '../../../widgets/custom_bottom_navbar.dart'; // Import custom bottom navbar
import 'package:hireme_app2/app/modules/home/controllers/auth_controller.dart';
import 'package:hireme_app2/app/routes/app_routes.dart';

class Browse3LoginView extends StatefulWidget {
  final Job job; // Data pekerjaan yang diterima dari Browse 2

  Browse3LoginView({required this.job});

  @override
  _Browse3LoginViewState createState() => _Browse3LoginViewState();
}

class _Browse3LoginViewState extends State<Browse3LoginView> {
  bool showDescription = true; // Default for showing job description
  bool _isSaved = false; // To manage save status for the job

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.job.position, // Title of the appbar is the job position
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.white, // AppBar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Company logo at the top
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.job.companyLogoPath),
                  radius: 50,
                ),
              ),
              const SizedBox(height: 16),

              // Card displaying job details
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.white.withOpacity(0.5), // Card transparency
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.job.position,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          '${widget.job.companyName}, ${widget.job.location}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: const Text(
                          'Salary: \$1000/month',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Job Type: ${widget.job.jobType}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // "Description" and "Company" buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showDescription = true; // Show job description
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showDescription
                          ? const Color(0xFF1230AE) // Background color when active
                          : Colors.grey.shade300, // Background color when inactive
                      foregroundColor: showDescription
                          ? Colors.white // Text color when active
                          : Colors.black, // Text color when inactive
                      minimumSize: Size(150, 50), // Button size
                    ),
                    child: const Text('Description'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showDescription = false; // Show company details
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showDescription
                          ? const Color(0xFF1230AE) // Background color when active
                          : Colors.grey.shade300, // Background color when inactive
                      foregroundColor: !showDescription
                          ? Colors.white // Text color when active
                          : Colors.black, // Text color when inactive
                      minimumSize: Size(150, 50), // Button size
                    ),
                    child: const Text('Company'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Content based on which button is clicked (Description or Company)
              showDescription
                  ? _buildJobDescription(widget.job.jobDetails)
                  : _buildCompanyDetails(widget.job.jobDetails.companyDetails),

              const SizedBox(height: 16),

             // Tombol Apply Job dan Save
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Save button with an icon and rectangular border
                  Container(
                    width: 50, // Set the width of the button
                    height: 50, // Set the height of the button
                    decoration: BoxDecoration(
                      color: _isSaved
                          ? Colors.orange.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.2), // Background color
                      borderRadius: BorderRadius.circular(
                          8), // Rectangular border with slight rounding
                      border: Border.all(
                        color: _isSaved
                            ? Colors.orange
                            : Colors.grey, // Border color based on save state
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: _isSaved ? Colors.orange : Colors.grey,
                      ),
                      iconSize: 24, // Control the size of the icon
                      onPressed: () {
                        setState(() {
                          _isSaved = !_isSaved; // Toggle save state
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                      width:
                          16), // Add some spacing between the save and apply buttons
                  // Apply button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Cek apakah user sudah login
                        if (Get.find<AuthController>().isLoggedIn.value) {
                          // Jika login, arahkan ke Browse4View untuk apply job
                          Get.toNamed(Routes.BROWSE_4_LOGIN, arguments: widget.job);
                        } else {
                          // Jika belum login, tampilkan dialog untuk create account
                          _showCreateAccountDialog();
                        }
                      },
                      child: const Text('Apply This Job'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xFF1230AE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Using custom bottom nav bar
    );
  }

  // Dialog if not logged in
  void _showCreateAccountDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Create Account Required'),
        content: Text('You need to create an account to apply for this job.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
              Get.toNamed(Routes.CREATE_ACCOUNT); // Navigate to create account page
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }

  // Widget to display job description
  Widget _buildJobDescription(JobDetails jobDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Same padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job Description:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(jobDetails.jobDescription),
          const SizedBox(height: 16),
          Text(
            'Requirements:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...jobDetails.requirements.map((req) => Text('- $req')).toList(),
          const SizedBox(height: 16),
          Text(
            'Location:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(jobDetails.location),
          const SizedBox(height: 16),
          Text(
            'Facilities:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...jobDetails.facilities.map((facility) => Text('- $facility')).toList(),
        ],
      ),
    );
  }

  // Widget to display company details
  Widget _buildCompanyDetails(CompanyDetails companyDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Same padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Company:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(companyDetails.aboutCompany),
          const SizedBox(height: 16),
          Text(
            'Website:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(companyDetails.website),
          const SizedBox(height: 16),
          Text(
            'Industry:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(companyDetails.industry),
          const SizedBox(height: 16),
          Text(
            'Company Gallery:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Horizontal scrolling company gallery
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Horizontal scroll
            child: Row(
              children: companyDetails.companyGalleryPaths.map((url) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Space between images
                  child: Container(
                    width: 240, // Width for 16:9 ratio
                    height: 135, // Height for 16:9 ratio
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 2, // Border thickness
                      ),
                      borderRadius: BorderRadius.circular(12), // Rounded border
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Image radius
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover, // Image covers entire area
                        width: 240, // 16:9 width
                        height: 135, // 16:9 height
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
