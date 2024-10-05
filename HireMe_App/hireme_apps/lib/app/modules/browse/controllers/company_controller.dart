import 'package:get/get.dart';

class CompanyModel {}

/// A controller class for the CompanyScreen.
/// This class manages the state of the CompanyScreen, including the
/// current companyModelObj
class CompanyController extends GetxController {
  Rx<CompanyModel> companyModelObj = CompanyModel().obs;
}
