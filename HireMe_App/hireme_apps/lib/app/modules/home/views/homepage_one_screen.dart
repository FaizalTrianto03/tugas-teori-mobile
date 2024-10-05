import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/homepageone_controller.dart'; // Asumsi controller ada di sini

class HomepageoneScreen extends GetWidget<HomepageoneController> {
   HomepageoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Color(0XFFD5C4FF),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding:  EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 28),
                  _buildFindYourDreamSection(),
                  SizedBox(height: 20),
                  _buildSearchBar(),
                  SizedBox(height: 52),
                  _buildImageSection(),
                  SizedBox(height: 34),
                  _buildJobOfferText(),
                   SizedBox(height: 16),
                  _buildJobSiteLogosRow1(),
                   SizedBox(height: 16),
                  _buildJobSiteLogosRow2(),
                   SizedBox(height: 52),
                  _buildAccountButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Header Widget
  Widget _buildHeader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "HireMe.id",
        style:  TextStyle(
          color: Color(0XFF25324B),
          fontSize: 24,
          fontFamily: 'Red Hat Display',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  /// Find Your Dream Job Section Widget
  Widget _buildFindYourDreamSection() {
    return Container(
      width: double.maxFinite,
      margin:  EdgeInsets.only(right: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            width: 246,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Find Your \n",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 50,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "Dream Job",
                    style: TextStyle(
                      color: Color(0XFF26A4FF),
                      fontSize: 50,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " \nHere!",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 50,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
           SizedBox(height: 8),
          SizedBox(
            height: 46,
            width: double.maxFinite,
            child: SvgPicture.asset(
              "assets/images/img_group.svg",
            ),
          ),
        ],
      ),
    );
  }

  /// Search Bar Widget
  Widget _buildSearchBar() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        autofocus: true,
        controller: controller.searchController,
        style:  TextStyle(
          color: Color(0X6625324B),
          fontSize: 24,
          fontFamily: 'Red Hat Display',
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: "Start your career...",
          hintStyle:  TextStyle(
            color: Color(0X6625324B),
            fontSize: 24,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: Container(
            margin:  EdgeInsets.fromLTRB(20, 18, 32, 18),
            child: SvgPicture.asset(
              "assets/images/img_search.svg",
              height: 38,
              width: 38,
              fit: BoxFit.contain,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.searchController.clear();
            },
            icon:  Icon(
              Icons.clear,
              color: Color(0xff757575),
            ),
          ),
          filled: true,
          fillColor:  Color(0XFFFFFFFF),
        ),
      ),
    );
  }

  /// Image Section Widget
  Widget _buildImageSection() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        height: 322,
        width: double.maxFinite,
        child: SvgPicture.asset(
          "assets/images/img_image_homepage.svg",
        ),
      ),
    );
  }

  /// Job Offer Text Widget
  Widget _buildJobOfferText() {
    return  SizedBox(
      width: double.maxFinite,
      child: Text(
        "Find job offers from the most popular job listing sites",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0XFF000000),
          fontSize: 24,
          fontFamily: 'Red Hat Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// First Row of Job Site Logos
  Widget _buildJobSiteLogosRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 18,
          width: 64,
          child: SvgPicture.asset("assets/images/img_indeed.svg"),
        ),
         SizedBox(width: 16),
        SizedBox(
          height: 12,
          width: 76,
          child: SvgPicture.asset("assets/images/img_monster.svg"),
        ),
         SizedBox(width: 16),
        SizedBox(
          height: 18,
          width: 72,
          child: SvgPicture.asset("assets/images/img_linkedin.svg"),
        ),
      ],
    );
  }

  /// Second Row of Job Site Logos
  Widget _buildJobSiteLogosRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
          width: 86,
          child: SvgPicture.asset("assets/images/img_glassdor.svg"),
        ),
         SizedBox(width: 16),
        SizedBox(
          height: 16,
          width: 84,
          child: SvgPicture.asset("assets/images/img_angellist.svg"),
        ),
      ],
    );
  }

  /// Account Buttons (Create Account & Google Button)
  Widget _buildAccountButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor:  Color(0XFF1230AE),
              side:  BorderSide(
                color: Color(0X19000000),
                width: 1.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding:  EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 14,
              ),
            ),
            onPressed: () {},
            child:  Text(
              "Create Account",
              style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
         SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Container(
            width: 56,
            height: 54,
            decoration: BoxDecoration(
              color:  Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color:  Color(0X19000000),
                width: 1.63,
              ),
            ),
            child: SvgPicture.asset(
              "assets/images/img_continue_with_google.svg",
            ),
          ),
        ),
      ],
    );
  }
}
