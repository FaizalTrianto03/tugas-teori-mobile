import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/company_controller.dart';

class CompanyScreen extends GetWidget<CompanyController> {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFD5C5FF),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGoogleCvSection(),
              const SizedBox(height: 10),
              _buildDescriptionCompanyButtons(),
              const SizedBox(height: 12),
              _buildAboutCompanySection(),
              _buildCompanyDetails(),
              _buildCompanyGalleryRow(),
              const SizedBox(height: 40),
              _buildMenuBar(),
              const SizedBox(height: 40),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  /// AppBar section
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
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
      width: double.maxFinite,
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

  /// Description and Company buttons
  Widget _buildDescriptionCompanyButtons() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          _buildButton("Description", true),
          const SizedBox(width: 14),
          _buildButton("Company", false),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isSelected) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0XFF1432AE) : Colors.white, // Updated
          foregroundColor:
              isSelected ? Colors.white : const Color(0XFF130160), // Updated
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        ),
        onPressed: () {},
        child: Text(text,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  /// About company section
  Widget _buildAboutCompanySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("About Company",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          _buildTextBlock(
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis.",
            4,
          ),
          _buildTextBlock(
              "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis.",
              3),
          _buildTextBlock(
              "Nor again is there anyone who loves or pursues or desires to obtain pain of itself.",
              2),
        ],
      ),
    );
  }

  Widget _buildTextBlock(String text, int maxLines) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontSize: 12, fontFamily: 'DM Sans', fontWeight: FontWeight.w400),
      ),
    );
  }

  /// Company Details section
  Widget _buildCompanyDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetail("Website", "https://www.google.com", isLink: true),
          _buildDetail("Industry", "Internet product"),
          _buildDetail("Employee size", "132,121 Employees"),
          _buildDetail("Head office", "Mountain View, California, USA"),
          _buildDetail("Type", "Multinational company"),
          _buildDetail("Since", "1998"),
          _buildDetail("Specialization",
              "Search technology, Web computing, Software, and Online advertising"),
        ],
      ),
    );
  }

  static Widget _buildDetail(String title, String value,
      {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              color: isLink ? const Color(0XFF4615FF) : const Color(0XFF514A6B),
            ),
          ),
        ],
      ),
    );
  }

  /// Company Gallery section
  Widget _buildCompanyGalleryRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/img_unsplash_gmsnxqiljp4.png",
                height: 118, width: 222),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/img_unsplash_uevezouyhgw.png",
                    height: 54, width: 102),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        "assets/images/img_unsplash_wd1lrb9oeeo.png",
                        height: 54,
                        width: 102),
                  ),
                  Positioned(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XB20C3548), // Updated
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: const Text("+5 pictures",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Menu and Apply Now section
  Widget _buildMenuBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/img_save.svg"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF1331AE),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Apply Now",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  /// Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Text("Home",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text("Browse",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text("Applied",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text("Profile",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          label: '',
        ),
      ],
    );
  }
}
