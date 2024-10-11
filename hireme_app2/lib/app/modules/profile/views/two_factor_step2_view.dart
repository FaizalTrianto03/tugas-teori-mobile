import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactorStep2View extends StatefulWidget {
  @override
  _TwoFactorStep2ViewState createState() => _TwoFactorStep2ViewState();
}

class _TwoFactorStep2ViewState extends State<TwoFactorStep2View> {
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Two-Factor Authentication',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressBar(), // Custom progress bar
            const SizedBox(height: 30),
            Text(
              'Step 2: Enter Verification Code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1230AE),
              ),
            ),
            const SizedBox(height: 20),
            _buildOtpInput(), // OTP input fields
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  // Resend OTP functionality (for now, it's a placeholder)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP resent!")),
                  );
                },
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    color: Color(0xFF1230AE),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the profile page after verification
                  Get.offAllNamed('/profile-login');
                },
                child: Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF1230AE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom progress bar widget
  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepIcon(Icons.person, true), // Step 1 completed
        _buildProgressLine(true),
        _buildStepIcon(Icons.lock, true), // Step 2 completed
      ],
    );
  }

  // Build the step icon
  Widget _buildStepIcon(IconData icon, bool isActive) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isActive ? Color(0xFF1230AE) : Colors.grey[300],
      child: Icon(icon, color: Colors.white),
    );
  }

  // Build the progress line between steps
  Widget _buildProgressLine(bool isActive) {
    return Container(
      width: 50,
      height: 3,
      color: isActive ? Color(0xFF1230AE) : Colors.grey[300],
    );
  }

  // OTP input with 6 fields and animation on focus
  Widget _buildOtpInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50,
          height: 50,
          child: TextField(
            controller: _otpControllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus(); // Move to the next field
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus(); // Move to the previous field if empty
              }
            },
          ),
        );
      }),
    );
  }
}
