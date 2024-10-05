import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliedController extends GetxController {
  // Controllers for email and password input fields
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  // Reactive boolean for password visibility toggle
  RxBool isShowPassword = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }
}
