import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/chat_data.dart'; // Import the chat data
import '../../../data/job_data.dart'; // Import the job data

class AppliedChatView extends StatefulWidget {
  @override
  _AppliedChatViewState createState() => _AppliedChatViewState();
}

class _AppliedChatViewState extends State<AppliedChatView> {
  final TextEditingController _messageController = TextEditingController();
  String? _replyMessage; // Store the message being replied to
  List<Map<String, String>> _temporaryMessages = []; // Temporary messages list

  @override
  Widget build(BuildContext context) {
    final Job job = Get.arguments as Job; // Cast Get.arguments to Job
    
    // Get the chat messages for this job and ensure the type is handled properly
    List<Map<String, dynamic>> chatMessages = chatData.cast<Map<String, dynamic>>();

    // Combine initial messages with temporary ones for display
    List<Map<String, dynamic>> displayedMessages = [...chatMessages, ..._temporaryMessages];

    return Scaffold(
      appBar: AppBar(
        title: Text('${job.companyName}'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: displayedMessages.length,
              itemBuilder: (context, index) {
                final message = displayedMessages[index];
                return _buildSwipeableMessage(message);
              },
            ),
          ),
          if (_replyMessage != null) _buildReplyPreview(), // Move reply preview above input field
          _buildMessageInput(), // Message input with attachment option
        ],
      ),
    );
  }

  // Widget to display reply preview just above the message input field
  Widget _buildReplyPreview() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Replying to: $_replyMessage',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.black54),
            onPressed: () {
              setState(() {
                _replyMessage = null; // Clear the reply when 'X' is pressed
              });
            },
          ),
        ],
      ),
    );
  }

  // Widget for displaying a swipeable message
  Widget _buildSwipeableMessage(Map<String, dynamic> message) {
    bool isSender = message['sender'] == 'Pelamar Kerja'; // Check if the message is from the applicant

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd, // Swipe to the right only
      onDismissed: (_) {
        setState(() {
          _replyMessage = message['message']; // Set the message being replied to
        });
      },
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        color: Colors.blue.withOpacity(0.2),
        child: Icon(Icons.reply, color: Color(0xFF1230AE), size: 30),
      ),
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7), // Limit message bubble width
          decoration: BoxDecoration(
            color: isSender ? Color(0xFF1230AE) : Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start, // Align based on sender
            children: [
              Text(
                message['message']!,
                style: TextStyle(color: isSender ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 5.0),
              Text(
                message['timestamp']!, // Display the timestamp
                style: TextStyle(color: isSender ? Colors.white70 : Colors.black54, fontSize: 10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the message input field with attachment button
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      color: Colors.white,
      child: Row(
        children: [
          // Simulated attachment button
          IconButton(
            icon: Icon(Icons.attach_file, color: Color(0xFF1230AE)),
            onPressed: () {
              // This is a formal button, doesn't affect the logic
              _showAttachmentOptions();
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF1230AE)),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  // Simulate attachment options when '+' or attach button is clicked
  void _showAttachmentOptions() {
    Get.snackbar(
      'Attachment',
      'This is a placeholder for attachment options (images, files, etc.)',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[200],
      colorText: Colors.black,
      duration: Duration(seconds: 3),
    );
  }

  // Function to handle sending a message (only temporary, no real modification)
  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        // Add the message to the temporary message list
        _temporaryMessages.add({
          'sender': 'Pelamar Kerja',
          'message': _messageController.text,
          'timestamp': TimeOfDay.now().format(context),
        });
        _replyMessage = null; // Clear the reply message after sending
      });
      _messageController.clear(); // Clear the text field after sending
    }
  }
}
