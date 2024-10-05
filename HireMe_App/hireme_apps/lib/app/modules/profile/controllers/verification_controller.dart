import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

/// This class defines the variables used in the [verification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class VerificationModel {
  // Anda dapat menambahkan atribut yang relevan di sini
}

/// A controller class for the VerificationScreen.
/// This class manages the state of the VerificationScreen, including the
/// current verificationModelObj
class VerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  Rx<VerificationModel> verificationModelObj = VerificationModel().obs;

  @override
  void onInit() {
    super.onInit();
    _listenForSms();
  }

  // Method untuk mendengarkan kode SMS
  void _listenForSms() async {
    SmsAutoFill().listenForCode;
  }

  // Metode untuk mengupdate OTP ketika kode diperbarui
  void updateOtp(String code) {
    otpController.text = code; // Update controller dengan kode yang diterima
  }

  @override
  void onClose() {
    // Pastikan untuk menutup TextEditingController saat controller ditutup
    otpController.dispose();
    super.onClose();
  }
}
