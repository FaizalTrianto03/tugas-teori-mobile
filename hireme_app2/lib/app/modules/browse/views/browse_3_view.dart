import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hireme_app2/app/data/job_data.dart';
import '../../../widgets/custom_bottom_navbar.dart'; // Import custom bottom navbar
import 'package:hireme_app2/app/modules/home/controllers/auth_controller.dart';
import 'package:hireme_app2/app/routes/app_routes.dart';

class Browse3View extends StatefulWidget {
  final Job job; // Data pekerjaan yang diterima dari Browse 2

  Browse3View({required this.job});

  @override
  _Browse3ViewState createState() => _Browse3ViewState();
}

class _Browse3ViewState extends State<Browse3View> {
  bool showDescription = true; // Default untuk menampilkan "Description"
  bool _isSaved = false; // Track if the job is saved

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.job.position, // Judul appbar adalah posisi pekerjaan
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Mengatur title agar berada di tengah
        backgroundColor: Colors.white, // Warna app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali ke Browse 2
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logo Perusahaan di bagian atas
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.job.companyLogoPath),
                  radius: 50,
                ),
              ),
              const SizedBox(height: 16),

              // Card menarik untuk menampilkan posisi, nama perusahaan, lokasi, dll.
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.white.withOpacity(0.5), // Atur transparansi card
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

              // Tombol "Description" dan "Company"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showDescription = true; // Tampilkan deskripsi pekerjaan
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showDescription
                          ? const Color(
                              0xFF1230AE) // Warna latar belakang saat tombol aktif
                          : Colors.grey
                              .shade300, // Warna latar belakang saat tombol tidak aktif
                      foregroundColor: showDescription
                          ? Colors.white // Warna teks saat tombol aktif
                          : Colors.black, // Warna teks saat tombol tidak aktif
                      minimumSize: Size(150, 50), // Ukuran tombol
                    ),
                    child: const Text('Description'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showDescription = false; // Tampilkan detail perusahaan
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showDescription
                          ? const Color(
                              0xFF1230AE) // Warna latar belakang saat tombol aktif
                          : Colors.grey
                              .shade300, // Warna latar belakang saat tombol tidak aktif
                      foregroundColor: !showDescription
                          ? Colors.white // Warna teks saat tombol aktif
                          : Colors.black, // Warna teks saat tombol tidak aktif
                      minimumSize: Size(150, 50), // Ukuran tombol
                    ),
                    child: const Text('Company'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Konten yang ditampilkan berdasarkan tombol yang diklik
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
      bottomNavigationBar:
          CustomBottomNavBar(), // Menggunakan custom bottom nav bar
    );
  }

  // Dialog jika belum login
  void _showCreateAccountDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Create Account Required'),
        content: Text('You need to create an account to apply for this job.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
              Get.toNamed(
                  Routes.CREATE_ACCOUNT); // Arahkan ke halaman create account
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan deskripsi pekerjaan
  Widget _buildJobDescription(JobDetails jobDetails) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // Padding yang sama
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
          ...jobDetails.facilities
              .map((facility) => Text('- $facility'))
              .toList(),
        ],
      ),
    );
  }

  // Widget untuk menampilkan detail perusahaan
  Widget _buildCompanyDetails(CompanyDetails companyDetails) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // Padding yang sama
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

          // Membuat galeri perusahaan yang bisa di-scroll ke kanan kiri
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Scroll ke arah horizontal
            child: Row(
              children: companyDetails.companyGalleryPaths.map((url) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0), // Spasi antar gambar
                  child: Container(
                    width: 240, // Lebar sesuai rasio 16:9
                    height: 135, // Tinggi sesuai rasio 16:9
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Warna border
                        width: 2, // Ketebalan border
                      ),
                      borderRadius:
                          BorderRadius.circular(12), // Border melengkung
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Radius gambar
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover, // Gambar menutupi seluruh area
                        width: 240, // Lebar 16:9
                        height: 135, // Tinggi 16:9
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
