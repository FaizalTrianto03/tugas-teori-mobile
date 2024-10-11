import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final String status;

  const ProgressBarWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    // Mengatur status menjadi teks deskriptif dan warna sesuai status
    String progressText;
    Color progressColor;

    if (status == 'inProcess') {
      progressText = 'In Process';
      progressColor = Colors.blue;
    } else if (status == 'accepted') {
      progressText = 'Accepted';
      progressColor = Colors.green;
    } else {
      progressText = 'Cancelled';
      progressColor = Colors.red;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          progressText,
          style: TextStyle(
            color: progressColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        // Bar progres sederhana
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            widthFactor: (status == 'inProcess')
                ? 0.5
                : (status == 'accepted')
                    ? 1.0
                    : 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
