import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart'; // Import file_picker
import '../../../data/job_data.dart'; // Import Job data
import '../../../routes/app_routes.dart'; // Import your routes
import 'package:dotted_border/dotted_border.dart';

class Browse4LoginView extends StatefulWidget {
  final Job job; // Job data diterima dari halaman sebelumnya

  Browse4LoginView({required this.job});

  @override
  _Browse4LoginViewState createState() => _Browse4LoginViewState();
}

class _Browse4LoginViewState extends State<Browse4LoginView> {
  List<PlatformFile> _uploadedFiles = []; // Untuk menyimpan file yang diupload
  final TextEditingController _informationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[100], // Background color to make content stand out
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
            _buildJobInfoCard(),
            const SizedBox(height: 24),
            _buildUploadSection(),
            const SizedBox(height: 20),
            _buildAdditionalInformation(),
            const SizedBox(height: 30),
            _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  // Card untuk informasi job
  Widget _buildJobInfoCard() {
    return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.job.position,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1230AE),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.job.companyName}, ${widget.job.location}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Salary: \$1000/month',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Job Type: ${widget.job.jobType}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section untuk upload CV/Resume
  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload CV/Resume (${_uploadedFiles.length}/3)', // Menampilkan jumlah file yang diupload
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1230AE)),
        ),
        const SizedBox(height: 10),
        Text(
          'Add your CV/Resume to apply for the job',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        _buildUploadBox(), // Tampilkan kotak upload yang berubah jika sudah ada file
        const SizedBox(height: 10),
        _buildFileList(), // Tampilkan daftar file yang diupload
      ],
    );
  }

  // Kotak untuk upload file
  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: () async {
        if (_uploadedFiles.length < 3) {
          // Pilih file menggunakan file_picker
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf', 'doc', 'docx'],
          );

          if (result != null) {
            setState(() {
              _uploadedFiles
                  .addAll(result.files); // Tambahkan file yang diupload
            });
          }
        }
      },
      child: DottedBorder(
        color: _uploadedFiles.length >= 3 ? Colors.grey.shade400 : Colors.grey,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        dashPattern: [8, 4],
        radius: Radius.circular(12),
        child: Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _uploadedFiles.length >= 3
                    ? Icons.check_circle_outline
                    : Icons.cloud_upload,
                size: 50,
                color: _uploadedFiles.length >= 3
                    ? Colors.green
                    : Color(0xFF1230AE),
              ),
              const SizedBox(height: 10),
              Text(
                _uploadedFiles.length >= 3
                    ? 'Maximum 3 files uploaded'
                    : 'Upload CV/Resume (pdf/docx)',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Daftar file yang diupload
  Widget _buildFileList() {
    if (_uploadedFiles.isEmpty) {
      return Container(); // Tidak menampilkan apa-apa jika tidak ada file
    }

    return Column(
      children: _uploadedFiles.map((file) {
        return ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.grey),
          title: Text(
            file.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                _uploadedFiles.remove(file); // Hapus file dari daftar
              });
            },
          ),
        );
      }).toList(),
    );
  }

  // Informasi tambahan
  Widget _buildAdditionalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1230AE)),
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
      ],
    );
  }

  // Tombol Apply Now
  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_uploadedFiles.isNotEmpty) {
            _showSuccessDialog(); // Menampilkan dialog sukses
          } else {
            _showErrorDialog(); // Menampilkan dialog kesalahan
          }
        },
        child: Text(
          'Apply Now',
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
          elevation: 5, // Memberikan efek shadow pada tombol
        ),
      ),
    );
  }

  /// Dialog jika berhasil apply
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
              Get.offAllNamed(
                Routes.BROWSE_5_LOGIN,
                arguments: {
                  'job': widget.job,
                  'uploadedFiles': _uploadedFiles
                      .map((file) => {
                            'name': file.name,
                            'size': file.size,
                            'date': DateTime.now().toString().split(' ')[0],
                            'time': TimeOfDay.now().format(context),
                          })
                      .toList(),
                },
              );
            },
            child: Text('OK'),
          ),
        ],
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
}
