import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/otp_email_number_controller.dart';

class OtpEmailNumberScreen extends GetWidget<OtpEmailNumberController> {
  const OtpEmailNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFD4C5FD),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 78, right: 80),
                    child: SizedBox(
                      height: 246,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        "assets/images/img_image.svg",
                      ),
                    ),
                  ),
                  const SizedBox(height: 74),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "OTP Verification",
                      style: TextStyle(
                        color: Color(0XFF323232),
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 304,
                      child: Text(
                        "Enter email and phone number to send one time Password",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0XFF514B6B),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 38),
                  SizedBox(
                    width: 366,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          color: Color(0XFF1230AE),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Color(0XFF1230AE),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.fromLTRB(16, 22, 32, 22),
                          child: SvgPicture.asset(
                            "assets/images/img_edit_icon.svg",
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          maxHeight: 72,
                        ),
                        filled: true,
                        fillColor: const Color(0XFF1230AE),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(24, 22, 32, 22),
                      ),
                      style: const TextStyle(
                        color: Color(0XFF514A6B),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 52),
                  _buildContactInformationSection(),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: double.maxFinite,
                    height: 72,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0XFF1230AE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 22),
                      ),
                      onPressed: () {
                        // Add your logic here
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInformationSection() {
    return SizedBox(
      height: 72,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24, bottom: 10),
              child: Text(
                "+62 999999999",
                style: TextStyle(
                  color: Color(0XFF514A6B),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 366,
            child: TextFormField(
              controller: controller.phoneNumberController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: const TextStyle(
                  color: Color(0XFF1230AE),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                hintText: "Phone Number",
                hintStyle: const TextStyle(
                  color: Color(0XFF1230AE),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: const Color(0XFF1230AE),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              ),
              style: const TextStyle(
                color: Color(0XFF1230AE),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
