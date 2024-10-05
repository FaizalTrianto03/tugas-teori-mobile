import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/applied_controller.dart'; // Pastikan controller diimport

class AppliedScreen extends GetWidget<AppliedController> {
  const AppliedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0XFFD6C5FF),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 28,
            top: 70,
            right: 28,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildTitleSection(),
              const SizedBox(height: 72),
              _buildForm(),
              const SizedBox(height: 76),
              _buildOrDivider(),
              const SizedBox(height: 74),
              _buildGoogleSignUpButton(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  /// Title Section Widget
  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Explore now",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 40,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 4),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Join HireMe.id",
            style: TextStyle(
              color: Color(0XFF040404),
              fontSize: 24,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }

  /// Form Section Widget
  Widget _buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildEmailInput(),
          const SizedBox(height: 16),
          _buildPasswordInput(),
          const SizedBox(height: 16),
          _buildSignInButton(),
        ],
      ),
    );
  }

  /// Email Input Widget
  Widget _buildEmailInput() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller.emailInputController,
        style: const TextStyle(
          color: Color(0XFF7C8493),
          fontSize: 16,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: const TextStyle(
            color: Color(0XFF7C8493),
            fontSize: 16,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  /// Password Input Widget
  Widget _buildPasswordInput() {
    return SizedBox(
      width: 300,
      child: Obx(
        () => TextFormField(
          controller: controller.passwordInputController,
          obscureText: controller.isShowPassword.value,
          style: const TextStyle(
            color: Color(0XFF7C8493),
            fontSize: 16,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: const TextStyle(
              color: Color(0XFF7C8493),
              fontSize: 16,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: _inputBorder(),
            focusedBorder: _inputBorder(),
            disabledBorder: _inputBorder(),
            suffixIcon: InkWell(
              onTap: () {
                controller.isShowPassword.toggle();
              },
              child: SvgPicture.asset(
                "assets/images/img_vector.svg",
                height: 20,
                width: 24,
              ),
            ),
            filled: true,
            fillColor: const Color(0XFFFFFFFF),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
          ),
        ),
      ),
    );
  }

  /// Sign In Button Widget
  Widget _buildSignInButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF1230AE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          // Handle sign-in action
        },
        child: const Text(
          "Sign In",
          style: TextStyle(
            color: Color(0XE8FFFFFF),
            fontSize: 20,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  /// Google Sign Up Button Widget
  Widget _buildGoogleSignUpButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0XFFFFFFFF),
          side: const BorderSide(color: Color(0X19000000), width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        onPressed: () {
          // Handle Google sign-up action
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/img_google.svg",
              height: 22,
              width: 24,
            ),
            const SizedBox(width: 16),
            const Text(
              "Sign up with Google",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Bottom Navigation Bar Widget
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0XFFFFFFFF),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0XFF9D9D9D)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Color(0XFF9D9D9D)),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle, color: Color(0XFF1230AE)),
          label: 'Applied',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color(0XFF9D9D9D)),
          label: 'Profile',
        ),
      ],
    );
  }

  /// Input border helper method
  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0XFF979797), width: 1),
    );
  }

  /// OR Divider Section Widget
  Widget _buildOrDivider() {
    return const SizedBox(
      height: 26,
      width: 28,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 14,
              width: 28,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0XFFD6C5FF),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
          Text(
            "or",
            style: TextStyle(
              color: Color(0X7F000000),
              fontSize: 20,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
