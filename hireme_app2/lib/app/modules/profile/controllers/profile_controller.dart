import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLoggedIn = false.obs;

  void loginWithGoogle() {
    // Contoh logika login dengan Google
    isLoggedIn.value = true;
    print("Logged in with Google");
  }

  void loginWithEmail(String email, String password) {
    // Contoh logika login dengan email dan password
    isLoggedIn.value = true;
    print("Logged in with email: $email");
  }

  void logout() {
    isLoggedIn.value = false;
    print("User logged out");
  }
}
