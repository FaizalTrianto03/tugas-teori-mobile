import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpEmailNumberModel {}

class OtpEmailNumberController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<OtpEmailNumberModel> otpEmailNumberModelObj = OtpEmailNumberModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    phoneNumberController.dispose();
  }
}
