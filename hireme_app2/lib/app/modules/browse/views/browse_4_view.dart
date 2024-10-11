import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/job_data.dart'; // Import Job data
import 'package:dotted_border/dotted_border.dart';

class Browse4View extends StatefulWidget {
  final Job job; // Job data diterima dari halaman sebelumnya

  Browse4View({required this.job});

  @override
  _Browse4LoginViewState createState() => _Browse4LoginViewState();
}

class _Browse4LoginViewState extends State<Browse4View> {
  bool _isFileUploaded = false; // Untuk mengecek apakah file sudah diupload
  final TextEditingController _informationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.job.position}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card informasi perusahaan
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.job.position,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1230AE),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.job.companyName}, ${widget.job.location}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Salary: \$1000/month',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Job Type: ${widget.job.jobType}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Section untuk upload CV/Resume
            Text(
              'Upload CV/Resume',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Add your CV/Resume to apply for the job',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Logika upload CV/Resume (kosongkan jika tidak perlu logika upload)
                setState(() {
                  _isFileUploaded = !_isFileUploaded; // Mengubah status upload
                });
              },
              child: DottedBorder(
                color: Colors.grey,
                strokeWidth: 2,
                borderType: BorderType.RRect,
                dashPattern: [8, 4],
                radius: Radius.circular(12),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: _isFileUploaded
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.folder_open,
                              size: 40,
                              color: Colors.grey,
                            ),
                            Positioned(
                              bottom: 20,
                              child: Text(
                                'File uploaded (pdf/docx)',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _isFileUploaded = false; // Hapus file
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              size: 50,
                              color: Color(0xFF1230AE),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Upload CV/Resume (pdf/docx)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Informasi tambahan
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Explain why you are the right person for this job',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _informationController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write your application here...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Apply Now
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_isFileUploaded) {
                    _showSuccessDialog(); // Menampilkan dialog sukses
                  } else {
                    _showErrorDialog(); // Menampilkan dialog kesalahan
                  }
                },
                child: Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF1230AE), // Warna biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Memberikan efek shadow pada tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog jika file belum diupload
  void _showErrorDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: [
            Icon(Icons.error, color: Colors.red),
            SizedBox(width: 8),
            Text('Error'),
          ],
        ),
        content: Text('Please upload at least one file to apply for this job.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Dialog jika berhasil apply
  void _showSuccessDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Application Successful'),
          ],
        ),
        content: Text('Your job application has been submitted successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
              Get.offAllNamed('/applied-login'); // Arahkan ke halaman applied login
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
