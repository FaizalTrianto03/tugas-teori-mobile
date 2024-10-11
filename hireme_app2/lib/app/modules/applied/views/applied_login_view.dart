import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/job_data.dart'; // Import data pekerjaan
import '../views/progress_bar_widget.dart'; // Widget progress bar di bawah card
import '../../../widgets/custom_bottom_navbar.dart';
import 'package:hireme_app2/app/modules/home/controllers/home_controller.dart'; // Import your HomeController

class AppliedLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil hanya pekerjaan yang telah dilamar
    List<Job> appliedJobs = jobList.where((job) => job.isApplied).toList();
    // Ambil hanya pekerjaan yang disimpan
    List<Job> savedJobs = jobList.where((job) => job.isSaved).toList();

    return DefaultTabController(
      length: 2, // Menambahkan dua tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jobs'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Ikon back
            onPressed: () {
              Get.back(); // Menggunakan Get.back() untuk kembali ke halaman sebelumnya
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Applied Jobs'), // Tab untuk pekerjaan yang dilamar
              Tab(text: 'Saved Jobs'),   // Tab untuk pekerjaan yang disimpan
            ],
            indicatorColor: Color(0xFF1230AE), // Tab indicator color
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Applied Jobs
            _buildAppliedJobsList(appliedJobs),

            // Tab Saved Jobs
            _buildSavedJobsList(savedJobs),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(), // Menambahkan custom bottom nav bar
      ),
    );
  }

  // Fungsi untuk membangun card Applied Jobs
  Widget _buildAppliedJobsList(List<Job> appliedJobs) {
    if (appliedJobs.isEmpty) {
      return Center(
        child: Text(
          'No Applied Jobs',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: appliedJobs.length,
      itemBuilder: (context, index) {
        final job = appliedJobs[index];
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail Applied Jobs
            Get.toNamed('/applied-detail', arguments: job);
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded card corners
            ),
            elevation: 5, // Adding some shadow to the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(job.companyLogoPath),
                  ),
                  title: Text(job.position),
                  subtitle: Text(job.companyName),
                ),
                const SizedBox(height: 10),

                // Progress bar untuk pekerjaan yang telah dilamar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ProgressBarWidget(status: job.applyStatus),
                ),

                // Full-width Chat button with no icon, just text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman chat
                      Get.toNamed('/applied-chat', arguments: job);
                    },
                    child: Text('Chat', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1230AE), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Rounded button
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      elevation: 3, // Slight shadow to give depth
                      minimumSize: Size(double.infinity, 48), // Make button full-width
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  // Fungsi untuk membangun card Saved Jobs
  Widget _buildSavedJobsList(List<Job> savedJobs) {
    if (savedJobs.isEmpty) {
      return Center(
        child: Text(
          'No Saved Jobs',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: savedJobs.length,
      itemBuilder: (context, index) {
        final job = savedJobs[index];
        return GestureDetector(
          onTap: () {
            // Update currentIndex to 2 for bottom navbar using HomeController
            final HomeController homeController = Get.find<HomeController>();
            homeController.changeTabIndex(1); // Set the index to 2

            // Navigasi ke halaman Browse3LoginView untuk Saved Jobs
            Get.toNamed('/browse-3-login', arguments: job);
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(job.companyLogoPath),
                  ),
                  title: Text(job.position),
                  subtitle: Text(job.companyName),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
