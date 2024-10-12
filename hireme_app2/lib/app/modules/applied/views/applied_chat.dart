import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../data/chat_data.dart';
import '../../../data/job_data.dart';

class AppliedChatView extends StatefulWidget {
  @override
  _AppliedChatViewState createState() => _AppliedChatViewState();
}

class _AppliedChatViewState extends State<AppliedChatView> {
  final TextEditingController _messageController = TextEditingController();
  String? _replyMessage; // Store the message being replied to
  List<Map<String, dynamic>> _temporaryMessages = []; // Temporary messages list
  List<PlatformFile> _selectedFiles = []; // Store selected files
  bool isApplicant = true; // Switch between applicant (Pelamar Kerja) and company (Perusahaan)
  final ScrollController _scrollController = ScrollController(); // Scroll controller to manage chat scroll

  @override
  void initState() {
    super.initState();
    // Scroll to the last message when the chat is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Job job = Get.arguments as Job;

    // Combine initial messages with temporary ones for display
    List<Map<String, dynamic>> displayedMessages = [
      ...chatData.cast<Map<String, dynamic>>(),
      ..._temporaryMessages
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('${job.companyName}'),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'clearAll') {
                _clearAllChats();
              } else if (value == 'clearTemp') {
                _clearTemporaryChats();
              } else if (value == 'switch') {
                setState(() {
                  isApplicant = !isApplicant; // Switch roles
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'clearAll',
                  child: Text('Clear All Chats'),
                ),
                PopupMenuItem<String>(
                  value: 'clearTemp',
                  child: Text('Clear Temporary Chats'),
                ),
                PopupMenuItem<String>(
                  value: 'switch',
                  child: Text(isApplicant ? 'Switch to Company' : 'Switch to Applicant'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10.0),
              itemCount: displayedMessages.length,
              itemBuilder: (context, index) {
                final message = displayedMessages[index];
                return _buildSwipeableMessage(message, index);
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
  Widget _buildSwipeableMessage(Map<String, dynamic> message, int index) {
    bool isSender = message['sender'] == (isApplicant ? 'Pelamar Kerja' : 'Perusahaan');

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal, // Swipe in both directions
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          // Swipe to reply
          setState(() {
            _replyMessage = message['message'] ?? message['fileName']; // Reply to either text or file
          });
        } else if (direction == DismissDirection.endToStart) {
          // Swipe to delete
          setState(() {
            if (index >= chatData.length) {
              _temporaryMessages.removeAt(index - chatData.length); // Remove temporary message
            }
          });
        }
      },
      background: _buildSwipeBackground(Icons.reply, Alignment.centerLeft),
      secondaryBackground: _buildSwipeBackground(Icons.delete, Alignment.centerRight),
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: _buildChatBubble(message),
      ),
    );
  }

  // Helper method to build swipe background for reply and delete actions
  Widget _buildSwipeBackground(IconData icon, Alignment alignment) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: alignment == Alignment.centerLeft ? Colors.blue.withOpacity(0.2) : Colors.red.withOpacity(0.2),
      child: Icon(icon, color: alignment == Alignment.centerLeft ? Color(0xFF1230AE) : Colors.red, size: 30),
    );
  }

  // Build chat bubble based on message type (text or file)
  Widget _buildChatBubble(Map<String, dynamic> message) {
    bool isSender = message['sender'] == (isApplicant ? 'Pelamar Kerja' : 'Perusahaan');
    bool hasFiles = message.containsKey('files'); // Check if it contains files

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7), // Limit message bubble width
      decoration: BoxDecoration(
        color: isSender ? Color(0xFF1230AE) : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Reply logic
          if (message.containsKey('replyTo') && message['replyTo'] != null && message['replyTo'] is String)
            _buildRepliedMessage(message['replyTo']),
          if (hasFiles)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                message['files'].length,
                (index) => _buildFileMessageContent(message['files'][index], isSender),
              ),
            )
          else if (message.containsKey('message'))
            Text(
              message['message'] ?? '',
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
          const SizedBox(height: 5.0),
          Text(
            message['timestamp'] ?? '', // Display the timestamp
            style: TextStyle(color: isSender ? Colors.white70 : Colors.black54, fontSize: 10.0),
          ),
        ],
      ),
    );
  }

  // Build content for file messages (e.g., PDF, image, etc.) with preview
  Widget _buildFileMessageContent(Map<String, dynamic> fileMessage, bool isSender) {
    IconData fileIcon = Icons.insert_drive_file; // Default file icon
    Color iconColor = Colors.grey; // Default icon color

    // Determine the icon and color based on file type
    if (fileMessage['fileName'].endsWith('.pdf')) {
      fileIcon = Icons.picture_as_pdf;
      iconColor = Colors.red;
    } else if (fileMessage['fileName'].endsWith('.jpg') || fileMessage['fileName'].endsWith('.png')) {
      fileIcon = Icons.image;
      iconColor = Colors.blue;
    }

    return Row(
      children: [
        Icon(fileIcon, color: iconColor),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileMessage['fileName'],
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                fileMessage['fileSize'],
                style: TextStyle(
                  color: isSender ? Colors.white70 : Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for the message input field with attachment button
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      color: Colors.white,
      child: Column(
        children: [
          if (_selectedFiles.isNotEmpty)
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedFiles.length,
                itemBuilder: (context, index) {
                  final file = _selectedFiles[index];
                  return Stack(
                    children: [
                      _buildFilePreview(file),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedFiles.removeAt(index);
                            });
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close, size: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.attach_file, color: Color(0xFF1230AE)),
                onPressed: _pickFile,
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 5, // Adjust size of the field based on input
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: Color(0xFF1230AE)),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build file preview
  Widget _buildFilePreview(PlatformFile file) {
    if (file.extension == 'jpg' || file.extension == 'png') {
      return Container(
        margin: const EdgeInsets.all(5),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: MemoryImage(file.bytes!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      // Show file icon for non-image files
      return Container(
        margin: const EdgeInsets.all(5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Center(
          child: Text(file.name),
        ),
      );
    }
  }

  // Pick a file using file picker with file preview for images
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.files); // Add selected files to the list
      });
    }
  }

  // Function to handle sending a message (only temporary, no real modification)
  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty || _selectedFiles.isNotEmpty) {
      setState(() {
        // Add the text message and files to the temporary message list
        Map<String, dynamic> newMessage = {
          'sender': isApplicant ? 'Pelamar Kerja' : 'Perusahaan',
          'timestamp': TimeOfDay.now().format(context),
          'replyTo': _replyMessage, // Add replyTo if replying to a message
        };

        if (_messageController.text.trim().isNotEmpty) {
          newMessage['message'] = _messageController.text.trim();
        }

        if (_selectedFiles.isNotEmpty) {
          newMessage['files'] = _selectedFiles.map((file) => {
            'fileName': file.name,
            'fileSize': '${(file.size / 1024).toStringAsFixed(2)} KB',
          }).toList();
        }

        _temporaryMessages.add(newMessage);

        // Clear reply and selected files after sending
        _replyMessage = null;
        _selectedFiles.clear();
      });
      _messageController.clear(); // Clear the text field after sending
      _scrollToBottom(); // Scroll to the bottom after sending the message
    }
  }

  // Function to clear all chats
  void _clearAllChats() {
    setState(() {
      _temporaryMessages.clear();
      chatData.clear(); // This clears the initial chat as well
    });
  }

  // Function to clear temporary chats only
  void _clearTemporaryChats() {
    setState(() {
      _temporaryMessages.clear(); // Clear only the temporary messages
    });
  }

  // Scroll to the last message in the chat
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Widget to show the replied message as a preview inside the current message
  Widget _buildRepliedMessage(String repliedText) {
    return GestureDetector(
      onTap: () {
        // Scroll to the replied message
        int scrollIndex = _temporaryMessages.indexWhere((msg) => msg['message'] == repliedText);
        if (scrollIndex != -1) {
          // Scroll to the replied message position
          _scrollController.animateTo(
            scrollIndex * 80.0, // Adjust the height as per your message card height
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        margin: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          repliedText,
          style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
