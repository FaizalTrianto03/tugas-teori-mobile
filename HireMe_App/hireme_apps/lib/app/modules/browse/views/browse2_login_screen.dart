import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hireme_apps/app/modules/browse/models/browse2_login_model.dart';
import '../controllers/browse2_login_controller.dart';

class Browse2LoginScreen extends GetWidget<Browse2LoginController> {
  const Browse2LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 6),
              _buildSearchSection(),
              const SizedBox(height: 16),
              _buildJobListings(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 74,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 53,
      leading: Padding(
        padding: const EdgeInsets.only(left: 19),
        child: SizedBox(
          height: 34,
          width: 34,
          child: SvgPicture.asset(
            "assets/images/img_icon_arrow_right.svg",
          ),
        ),
      ),
      centerTitle: true,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/images/img_icon.svg",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text(
              "Design",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 24,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.search, size: 22),
                const Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    "Job title or keyword",
                    style: TextStyle(
                      color: Color(0X6625324B),
                      fontSize: 20,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Divider(height: 3, thickness: 3, color: const Color(0XFFA8ADB7)),
          const SizedBox(height: 6),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 34),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Malang, Indonesia",
                    style: TextStyle(
                      color: Color(0X6625324B),
                      fontSize: 20,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_downward, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobListings() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: controller
              .browse2LoginModelObj.value.joblistingsItemList.value.length,
          itemBuilder: (context, index) {
            final model = controller
                .browse2LoginModelObj.value.joblistingsItemList.value[index];
            return JoblistingsItemWidget(model);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 14),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Color(0XFF1230AE)),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done, color: Colors.grey),
          label: 'Applied',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          label: 'Profile',
        ),
      ],
    );
  }
}

/// Job Listings Item Widget
class JoblistingsItemWidget extends StatelessWidget {
  final JoblistingsItemModel joblistingsItemModelObj;

  const JoblistingsItemWidget(this.joblistingsItemModelObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0XFFD6C5FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/images/img_vector.svg",
              height: 42, width: 50),
          SizedBox(
            width: 268,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joblistingsItemModelObj.branddesigner.value,
                  style: const TextStyle(
                    color: Color(0XFF25324B),
                    fontSize: 20,
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      joblistingsItemModelObj.nomad.value,
                      style: const TextStyle(
                        color: Color(0XFF515B6F),
                        fontSize: 16,
                        fontFamily: 'Epilogue',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                        radius: 2, backgroundColor: Color(0XFF515B6F)),
                    const SizedBox(width: 8),
                    Text(
                      joblistingsItemModelObj.parisfrance.value,
                      style: const TextStyle(
                        color: Color(0XFF515B6F),
                        fontSize: 16,
                        fontFamily: 'Epilogue',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
