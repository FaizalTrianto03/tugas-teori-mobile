import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/job_data.dart'; // Import data pekerjaan
import '../views/progress_bar_widget.dart'; // Widget progress bar di bawah card

class AppliedDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil data job dari argument
    final Job job = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
        centerTitle: true,
        backgroundColor: Colors.white, // Warna biru untuk AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian header job position dengan card shadow
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.position,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1230AE), // Warna biru teks
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.business, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          '${job.companyName}, ${job.location}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.monetization_on, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          'Salary: \$1000/month',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.work, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(
                          'Job Type: ${job.jobType}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ProgressBarWidget(status: job.applyStatus),
                  ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bagian Job Description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Job Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      job.jobDetails.jobDescription,
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bagian Requirements
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Requirements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...job.jobDetails.requirements.map((req) => Row(
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF1230AE)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                req,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
