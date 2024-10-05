import 'package:get/get.dart';

class JobcategorieslistItemModel {
  // Using required fields to make sure certain parameters are always provided.
  JobcategorieslistItemModel({
    String? designOne,
    String? designTwo,
    String? jobs,
    String? id,
  })  : designOne = Rx<String>(designOne ?? "assets/images/img_icon_40x40.svg"),
        designTwo = Rx<String>(designTwo ?? "Design"),
        jobs = Rx<String>(jobs ?? "235 jobs available"),
        id = Rx<String>(id ?? "");

  // Declaring Rx fields with non-nullable types to make it more robust.
  Rx<String> designOne;
  Rx<String> designTwo;
  Rx<String> jobs;
  Rx<String> id;

  // Add a copyWith method to easily create updated versions of this model
  JobcategorieslistItemModel copyWith({
    String? designOne,
    String? designTwo,
    String? jobs,
    String? id,
  }) {
    return JobcategorieslistItemModel(
      designOne: designOne ?? this.designOne.value,
      designTwo: designTwo ?? this.designTwo.value,
      jobs: jobs ?? this.jobs.value,
      id: id ?? this.id.value,
    );
  }
}
