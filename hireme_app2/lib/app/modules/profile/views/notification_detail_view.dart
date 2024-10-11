import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/notification_data.dart'; // Import data notifikasi

class NotificationDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil data notifikasi dari arguments
    final NotificationCustom notification = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with Hero animation
              Hero(
                tag: 'notificationTitle_${notification.title}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Date with Icon
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    '${notification.day}, ${notification.date}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Divider for better separation
              Divider(color: Colors.grey[300], thickness: 1),
              const SizedBox(height: 20),
              // Description Section with padding
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  notification.description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                    height: 1.5, // Improved readability with line height
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Divider for visual separation at the bottom
              Divider(color: Colors.grey[300], thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
