import 'package:get/get.dart';

class JoblistsectionItemModel {
  JoblistsectionItemModel({
    this.designLeadOne,
    this.seniorproduct,
    this.googleinc,
    this.fulltime,
    this.remote,
    this.price,
    this.id,
  }) {
    designLeadOne = designLeadOne ?? Rx("assets/images/img_image_3.png");
    seniorproduct = seniorproduct ?? Rx("Design Lead");
    googleinc = googleinc ?? Rx("GitLab");
    fulltime = fulltime ?? Rx("Full time");
    remote = remote ?? Rx("Remote");
    price = price ?? Rx("\$64k - \$80k/yearly");
    id = id ?? Rx("");
  }

  Rx<String>? designLeadOne;
  Rx<String>? seniorproduct;
  Rx<String>? googleinc;
  Rx<String>? fulltime;
  Rx<String>? remote;
  Rx<String>? price;
  Rx<String>? id;
}

class AppliedLoginModel {
  Rx<List<JoblistsectionItemModel>> joblistsectionItemList = Rx([
    JoblistsectionItemModel(
      designLeadOne: "assets/images/img_image_3.png".obs,
      seniorproduct: "Design Lead".obs,
      googleinc: "GitLab".obs,
      fulltime: "Full time".obs,
      remote: "Remote".obs,
      price: "\$64k - \$80k/yearly".obs,
    ),
    JoblistsectionItemModel(
      designLeadOne: "assets/images/img_image_3_40x40.png".obs,
      seniorproduct: "Head of Product Design".obs,
      googleinc: "Uber".obs,
    ),
    JoblistsectionItemModel(
      designLeadOne: "assets/images/img_image_3_1.png".obs,
      seniorproduct: "Senior Product Designer".obs,
      googleinc: "Google INC".obs,
      fulltime: "Full time".obs,
      remote: "Remote".obs,
      price: "\$64k - \$80k/yearly".obs,
    ),
  ]);
}

class AppliedLoginController extends GetxController {
  Rx<AppliedLoginModel> appliedLoginModelObj = AppliedLoginModel().obs;
}
