import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/upload_cv_controller.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadCvScreen extends GetWidget<UploadCvController> {
  const UploadCvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFD6C5FF),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                _buildGoogleCvSection(),
                const SizedBox(height: 10),
                _buildFormSection(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// AppBar section
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: SvgPicture.asset("assets/images/img_back.svg"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 34),
          child: SvgPicture.asset("assets/images/img_options.svg"),
        ),
      ],
    );
  }

  /// Google CV section
  Widget _buildGoogleCvSection() {
    return Container(
      height: 176,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0XFFCBB5FE),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 14),
                const Text(
                  "UI/UX Designer",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Google", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 22),
                    CircleAvatar(radius: 3),
                    SizedBox(width: 22),
                    Text("California", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 22),
                    CircleAvatar(radius: 3),
                    SizedBox(width: 22),
                    Text("1 day ago", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/img_google_1.png",
                  height: 54, width: 54),
            ),
          ),
        ],
      ),
    );
  }

  /// Upload CV and Information section
  Widget _buildFormSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildUploadCvSection(),
          const SizedBox(height: 34),
          _buildInformationSection(),
          const SizedBox(height: 34),
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildUploadCvSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload CV",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const Text("Add your CV/Resume to apply for a job",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
        const SizedBox(height: 20),
        DottedBorder(
          color: const Color(0XFF120F20),
          strokeWidth: 0.5,
          radius: const Radius.circular(14),
          dashPattern: const [3, 3],
          borderType: BorderType.RRect,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/img_icon.svg",
                    height: 24, width: 24),
                const SizedBox(width: 14),
                const Text("Upload CV/Resume", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Information",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 14),
        TextFormField(
          controller: controller.grouponeoneController,
          maxLines: 12,
          decoration: InputDecoration(
            hintText: "Explain why you are the right person for this job",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }

  /// Apply Now button
  Widget _buildApplyButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
              0XFF1331AE), // Changed from primary to backgroundColor
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        onPressed: () {},
        child: const Text("APPLY NOW",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
      ),
    );
  }

  /// Bottom Bar section
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in), label: "Applied"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
