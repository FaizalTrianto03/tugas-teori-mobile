import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/notification_data.dart'; // Import data notifikasi

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding to the entire list
        child: ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            final notification = notificationList[index];
            return Column(
              children: [
                Card(
                  elevation: 3, // Add elevation for a subtle shadow effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10, 
                      horizontal: 16, // More spacing inside the card
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: notification.isRead
                          ? Colors.green.withOpacity(0.8) // Different color for read
                          : Colors.grey.withOpacity(0.4), // Lighter color for unread
                      child: Icon(
                        notification.isRead
                            ? Icons.check_circle
                            : Icons.notifications,
                        color: notification.isRead ? Colors.white : Colors.black,
                      ),
                    ),
                    title: Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight: notification.isRead
                            ? FontWeight.normal
                            : FontWeight.bold, // Bold for unread notifications
                        color: notification.isRead ? Colors.black54 : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      '${notification.day}, ${notification.date}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios, // Use a forward arrow to indicate navigation
                      size: 16,
                    ),
                    onTap: () {
                      notification.isRead = true; // Mark notification as read
                      Get.toNamed('/notification-detail', arguments: notification);
                    },
                  ),
                ),
                Divider(), // Add a divider between cards
              ],
            );
          },
        ),
      ),
    );
  }
}
