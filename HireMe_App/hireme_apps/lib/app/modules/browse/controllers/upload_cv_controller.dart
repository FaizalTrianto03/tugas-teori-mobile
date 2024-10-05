import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UploadCvModel {}

/// A controller class for the UploadCvScreen.
/// This class manages the state of the UploadCvScreen, including the
/// current uploadCvModelObj
class UploadCvController extends GetxController {
  TextEditingController grouponeoneController = TextEditingController();

  Rx<UploadCvModel> uploadCvModelObj = UploadCvModel().obs;

  @override
  void onClose() {
    super.onClose();
    grouponeoneController.dispose();
  }
}
