import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/description_controller.dart';

class DescriptionScreen extends GetWidget<DescriptionController> {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFD5C5FF),
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _buildGoogleCvSection(),
                  const SizedBox(height: 20),
                  _buildSalaryAndLocationSection(),
                  const SizedBox(height: 16),
                  _buildMapSection(),
                  const SizedBox(height: 22),
                  _buildInformationSection(),
                  const SizedBox(height: 14),
                  _buildDividers(),
                  const SizedBox(height: 14),
                  _buildExperienceSection(
                      experienceText: "Qualification",
                      durationText: "Bachelor’s Degree"),
                  _buildDividers(),
                  _buildExperienceSection(
                      experienceText: "Experience", durationText: "3 Years"),
                  _buildDividers(),
                  _buildExperienceSection(
                      experienceText: "Job Type", durationText: "Full-Time"),
                  _buildDividers(),
                  _buildExperienceSection(
                      experienceText: "Specialization", durationText: "Design"),
                  _buildDividers(),
                  const SizedBox(height: 28),
                  _buildFacilitiesSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 52,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 59,
      leading: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset("assets/images/img_back.svg"),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 34),
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset("assets/images/img_options.svg"),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleCvSection() {
    return SizedBox(
      height: 176,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0XFFCBB5FE),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const SizedBox(height: 14),
                const Text(
                  "UI/UX Designer",
                  style: TextStyle(
                    color: Color(0XFF0D0140),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Google",
                      style: TextStyle(
                        color: Color(0XFF0D0140),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 22),
                    CircleAvatar(radius: 3, backgroundColor: Color(0XFF0D0140)),
                    SizedBox(width: 22),
                    Text(
                      "California",
                      style: TextStyle(
                        color: Color(0XFF0D0140),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 22),
                    CircleAvatar(radius: 3, backgroundColor: Color(0XFF0D0140)),
                    SizedBox(width: 22),
                    Text(
                      "1 day ago",
                      style: TextStyle(
                        color: Color(0XFF0D0140),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                color: const Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(42),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset("assets/images/img_google_1.png",
                    height: 54, width: 54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryAndLocationSection() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 8, right: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Salary",
                  style: TextStyle(fontSize: 14, fontFamily: 'DM Sans')),
              Text("Job Type",
                  style: TextStyle(fontSize: 14, fontFamily: 'DM Sans')),
              Text("Position",
                  style: TextStyle(fontSize: 14, fontFamily: 'DM Sans')),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            "Job Description",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans'),
          ),
          const SizedBox(height: 10),
          const Text(
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium...",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0X331432AE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: const Text("Read more",
                style: TextStyle(fontSize: 12, fontFamily: 'Open Sans')),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 150,
      width: 358,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          this.controller.googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
      ),
    );
  }

  Widget _buildInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Information",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Position",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans')),
        SizedBox(height: 4),
        Text("Senior Designer",
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
      ],
    );
  }

  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Facilities and Others",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Medical", style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Dental", style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Meal Allowance",
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Transport Allowance",
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Regular Hours",
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
        SizedBox(height: 14),
        Text("Mondays-Fridays",
            style: TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
      ],
    );
  }

  Widget _buildExperienceSection({
    required String experienceText,
    required String durationText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(experienceText,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans')),
        const SizedBox(height: 4),
        Text(durationText,
            style: const TextStyle(fontSize: 12, fontFamily: 'DM Sans')),
      ],
    );
  }

  Widget _buildDividers() {
    return const SizedBox(
      width: double.maxFinite,
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0XFFFFFFFF),
        indent: 8,
        endIndent: 12,
      ),
    );
  }
}
