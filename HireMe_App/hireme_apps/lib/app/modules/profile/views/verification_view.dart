import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controllers/verification_controller.dart';

class VerificationScreen extends GetWidget<VerificationController> {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0XFFD4C5FD),
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "OTP Verification",
                style: TextStyle(
                  color: Color(0XFF1E232C),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 320,
                child: Text(
                  "Enter the verification code we just sent to your number +629 *******99.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0XFF514A6B),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 4, right: 6),
                child: Obx(
                  () => PinCodeTextField(
                    appContext: Get.context!,
                    controller: controller
                        .otpController, // Pastikan ini adalah TextEditingController
                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    enableActiveFill: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {},
                    textStyle: const TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    pinTheme: PinTheme(
                      fieldHeight: 50,
                      fieldWidth: 46,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      selectedFillColor: const Color(0X33D9D9D9),
                      selectedColor: const Color(0XFF1331AE),
                      activeFillColor: const Color(0X33EFEAFF),
                      activeColor: const Color(0XFF1331AE),
                      inactiveFillColor: const Color(0XFFEFEAFF),
                      inactiveColor: const Color(0X19000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 68),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn’t receive code? ",
                        style: TextStyle(
                          color: Color(0XFF514A6B),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: TextStyle(
                          color: Color(0XFF1331AE),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Spacer(flex: 63),
              Container(
                width: double.maxFinite,
                height: 58,
                margin: const EdgeInsets.only(right: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0XFF1331AE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    // Add verification logic
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 36)
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 56,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 41,
      leading: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            "assets/images/img_arrow_left.svg",
          ),
        ),
      ),
    );
  }
}
