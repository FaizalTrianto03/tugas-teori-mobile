import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This class defines the variables used in the [description_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DescriptionModel {}

/// A controller class for the DescriptionScreen.
/// This class manages the state of the DescriptionScreen, including the
/// current descriptionModelObj
class DescriptionController extends GetxController {
  Rx<DescriptionModel> descriptionModelObj = DescriptionModel().obs;

  Completer<GoogleMapController> googleMapController = Completer();
}
