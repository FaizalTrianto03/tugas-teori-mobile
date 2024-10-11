import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view_login.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/browse/views/browse_view.dart';
import '../modules/browse/views/browse_2_view.dart';
import '../modules/browse/views/browse_2_login_view.dart';
import '../modules/browse/views/browse_3_view.dart';
import '../modules/browse/views/browse_3_login_view.dart';
import '../modules/browse/views/browse_4_view.dart';
import '../modules/browse/views/browse_4_login_view.dart';
import '../modules/browse/views/browse_5_login_view.dart'; // Import your Browse5LoginView
import '../modules/browse/views/browse_login_view.dart';
import '../modules/browse/bindings/browse_binding.dart';
import '../modules/applied/views/applied_view.dart';
import '../modules/applied/bindings/applied_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/profile_login_view.dart';
import '../modules/profile/views/notifications_view.dart';
import '../modules/profile/views/notification_detail_view.dart';
import '../modules/profile/views/create_account_view.dart';
import '../modules/profile/views/create_account_success_view.dart';
import '../modules/profile/views/faq_view.dart'; // Import FAQ page
import '../modules/profile/views/edit_profile_view.dart'; // Import Edit Profile page
import '../modules/profile/views/two_factor_step1_view.dart'; // Import Two Factor Step 1 page
import '../modules/profile/views/two_factor_step2_view.dart'; // Import Two Factor Step 2 page
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/applied/views/applied_login_view.dart';
import '../modules/applied/views/applied_detail_view.dart';
import '../modules/applied/views/applied_chat.dart'; // Import your AppliedChatView
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME_LOGIN,
      page: () => HomeViewLogin(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BROWSE,
      page: () => BrowseView(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_LOGIN,
      page: () => BrowseLoginView(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_2,
      page: () => Browse2View(categoryName: Get.arguments),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_2_LOGIN,
      page: () => Browse2LoginView(categoryName: Get.arguments),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_3,
      page: () => Browse3View(job: Get.arguments),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_3_LOGIN,
      page: () => Browse3LoginView(job: Get.arguments),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: Routes.BROWSE_4,
      page: () => Browse4View(job: Get.arguments),
    ),
    GetPage(
      name: Routes.BROWSE_4_LOGIN,
      page: () => Browse4LoginView(job: Get.arguments),
    ),
    GetPage(
      name: Routes.APPLIED,
      page: () => AppliedView(),
      binding: AppliedBinding(),
    ),
    GetPage(
      name: Routes.APPLIED_CHAT, // New chat page route
      page: () => AppliedChatView(), // The view that you created for the chat
      // If you have a binding for chat, else remove this line
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => CreateAccountView(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT_SUCCESS,
      page: () => CreateAccountSuccessView(),
    ),
    GetPage(
      name: Routes.PROFILE_LOGIN,
      page: () => ProfileLoginView(),
    ),
    GetPage(
      name: Routes.FAQ, // Rute untuk FAQ
      page: () => FAQView(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE, // Rute untuk Edit Profile
      page: () => EditProfileView(),
    ),
    GetPage(
      name: Routes.TWO_FACTOR, // Rute untuk Two-Factor Step 1
      page: () => TwoFactorStep1View(),
    ),
    GetPage(
      name: Routes.TWO_FACTOR_VERIFICATION, // Rute untuk Two-Factor Step 2
      page: () => TwoFactorStep2View(),
    ),
    GetPage(
      name: Routes.APPLIED_LOGIN,
      page: () => AppliedLoginView(),
    ),
    GetPage(
      name: Routes.APPLIED_DETAIL,
      page: () => AppliedDetailView(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsView(),
    ),
    GetPage(
      name: Routes.NOTIFICATION_DETAIL,
      page: () => NotificationDetailView(),
    ),
    GetPage(
      name: Routes.BROWSE_5_LOGIN,
      page: () => Browse5LoginView(
        job: Get.arguments['job'],
        uploadedFiles: Get.arguments['uploadedFiles'],
      ),
    ),
  ];
}
