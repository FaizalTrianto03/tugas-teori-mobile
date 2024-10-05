import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/applied/bindings/applied_binding.dart';
import 'package:hireme_apps/app/modules/applied/views/applied_screen.dart';
import 'package:hireme_apps/app/modules/home/views/homepage_one_screen.dart';
import 'package:hireme_apps/app/modules/home/bindings/home_binding.dart';
import 'package:hireme_apps/app/modules/profile/bindings/profile_binding.dart';
import 'package:hireme_apps/app/modules/profile/views/profile_screen.dart';
import 'package:hireme_apps/app/modules/browse/bindings/browse2_login_binding.dart';
import 'package:hireme_apps/app/modules/browse/views/browse2_login_screen.dart';
import 'package:hireme_apps/main.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomepageoneScreen(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: AppRoutes.APPLIED,
      page: () => AppliedScreen(),
      binding: AppliedBinding(),
    ),
    GetPage(
      name: AppRoutes.BROWSE,
      page: () => Browse2LoginScreen(),
      binding: Browse2LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),

    // Add more routes as required
  ];
}
