import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/homepage_login_controller.dart';
import 'package:hireme_apps/app/modules/browse/models/jobcategorieslist_item_model.dart'; // Pastikan path ini benar

class HomepageLoginScreen extends GetWidget<HomepageLoginController> {
  HomepageLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFD6C5FF),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 14),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "HireMe.id",
                  style: TextStyle(
                    color: Color(0XFF25324B),
                    fontSize: 24,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SizedBox(
                  height: 676,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildJobListingsScroll(),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailsSection(),
                            SizedBox(height: 12),
                            _buildJobListingsList(),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [_buildDetailsButton()],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobListingsScroll() {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0XFFD6C5FF),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      "assets/images/img_7tuadqi_400x400.png",
                      height: 64,
                      width: 64,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, top: 14),
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(right: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Brand Designer",
                                  style: TextStyle(
                                    color: Color(0XFF000000),
                                    fontSize: 20,
                                    fontFamily: 'Epilogue',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: SvgPicture.asset(
                                      "assets/images/img_favorite_fill.svg",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Text(
                                  "Maze",
                                  style: TextStyle(
                                    color: Color(0XFF515B6F),
                                    fontSize: 16,
                                    fontFamily: 'Epilogue',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 4,
                                    width: 4,
                                    margin: EdgeInsets.only(left: 8, bottom: 6),
                                    decoration: BoxDecoration(
                                      color: Color(0XFF515B6F),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "San Fransisco, USA",
                                    style: TextStyle(
                                      color: Color(0XFF515B6F),
                                      fontSize: 16,
                                      fontFamily: 'Epilogue',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Color(0XDBFFFFFF),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  "Full-Time",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0XFF56CDAD),
                                    fontSize: 14,
                                    fontFamily: 'Epilogue',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: Color(0XFFD9D9D9),
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFF),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Color(0XFFFEB835),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  "Marketing",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0XFFFEB835),
                                    fontSize: 14,
                                    fontFamily: 'Epilogue',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFF),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Color(0XFF4640DE),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  "Design",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0XFF4640DE),
                                    fontSize: 14,
                                    fontFamily: 'Epilogue',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 32),
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Details",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 16,
                  fontFamily: 'Epilogue',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobListingsList() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10, // Ubah ini dengan jumlah data yang Anda miliki
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          return; // Pastikan ini terdefinisi
        },
      ),
    );
  }

  Widget _buildDetailsButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: () {
          // Aksi untuk button
        },
        child: Text("View Details"),
      ),
    );
  }
}
