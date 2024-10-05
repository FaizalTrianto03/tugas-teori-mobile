import 'package:get/get.dart';

class Browse2LoginModel {
  Rx<List<JoblistingsItemModel>> joblistingsItemList = Rx([
    JoblistingsItemModel(
      branddesigner: "Brand Designer".obs,
      nomad: "Dropbox".obs,
      parisfrance: "San Francisco, USA".obs,
      labelOne: "Full-Time".obs,
      labelOne1: "Marketing".obs,
      labelTwo: "Design".obs,
    ),
    // Add more job listings
  ]);
}

class JoblistingsItemModel {
  Rx<String> branddesigner;
  Rx<String> nomad;
  Rx<String> parisfrance;
  Rx<String> labelOne;
  Rx<String> labelOne1;
  Rx<String> labelTwo;

  JoblistingsItemModel({
    required this.branddesigner,
    required this.nomad,
    required this.parisfrance,
    required this.labelOne,
    required this.labelOne1,
    required this.labelTwo,
  });
}
