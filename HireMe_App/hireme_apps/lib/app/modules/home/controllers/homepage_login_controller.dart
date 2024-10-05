import 'package:get/get.dart';

class HomepageLoginModel {
  Rx<List<JoblistingslistItemModel>> joblistingslistItemList = Rx([
    JoblistingslistItemModel(
      image: "assets/images/img_netlify_logo_1.png".obs,
      socialmedia: "Social Media Assistant".obs,
      imageOne: "assets/images/img_favorite.svg".obs,
      nomad: "Netlify".obs,
      parisfrance: "Paris, France".obs,
      labelOne: "Full-Time".obs,
      labelOne1: "Marketing".obs,
      labelTwo: "Design".obs,
    ),
    JoblistingslistItemModel(
      socialmedia: "HR Manager".obs,
      imageOne: "assets/images/img_favorite.svg".obs,
      nomad: "Webflow".obs,
      parisfrance: "Lucern, Switzerland".obs,
      labelOne: "Full-Time".obs,
      labelOne1: "Marketing".obs,
      labelTwo: "Design".obs,
    ),
    JoblistingslistItemModel(
      socialmedia: "Brand Designer".obs,
      imageOne: "assets/images/img_favorite_fill.svg".obs,
      nomad: "Dropbox".obs,
      parisfrance: "San Francisco, USA".obs,
      labelOne: "Full-Time".obs,
      labelOne1: "Marketing".obs,
      labelTwo: "Design".obs,
    ),
  ]);
}

class JoblistingslistItemModel {
  JoblistingslistItemModel({
    this.image,
    this.socialmedia,
    this.imageOne,
    this.nomad,
    this.parisfrance,
    this.labelOne,
    this.labelOne1,
    this.labelTwo,
    this.id,
  }) {
    image = image ?? Rx("assets/images/img_netlify_logo_1.png");
    socialmedia = socialmedia ?? Rx("Social Media Assistant");
    imageOne = imageOne ?? Rx("assets/images/img_favorite.svg");
    nomad = nomad ?? Rx("Netlify");
    parisfrance = parisfrance ?? Rx("Paris, France");
    labelOne = labelOne ?? Rx("Full-Time");
    labelOne1 = labelOne1 ?? Rx("Marketing");
    labelTwo = labelTwo ?? Rx("Design");
    id = id ?? Rx("");
  }

  Rx<String>? image;
  Rx<String>? socialmedia;
  Rx<String>? imageOne;
  Rx<String>? nomad;
  Rx<String>? parisfrance;
  Rx<String>? labelOne;
  Rx<String>? labelOne1;
  Rx<String>? labelTwo;
  Rx<String>? id;
}

class HomepageLoginController extends GetxController {
  Rx<HomepageLoginModel> homepageLoginModelObj = HomepageLoginModel().obs;
}
