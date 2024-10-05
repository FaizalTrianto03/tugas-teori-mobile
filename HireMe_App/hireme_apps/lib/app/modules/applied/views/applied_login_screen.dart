import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/applied_login_controller.dart';

class AppliedLoginScreen extends GetWidget<AppliedLoginController> {
  const AppliedLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFD6C5FF),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 16,
            top: 34,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildProfileSection(),
              const SizedBox(height: 42),
              _buildJobListSection(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SizedBox(
            height: 56,
            width: 74,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.asset(
                    "assets/images/img_ellipse_643.png",
                    height: 56,
                    width: 56,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: 40,
                    width: 32,
                    child: SvgPicture.asset(
                      "assets/images/img_profile.svg",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Faizal Ang Ang",
                      style: TextStyle(
                        color: Color(0XFF0A0A0A),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "faizalang123@gmai.com",
                      style: TextStyle(
                        color: Color(0XFF0A0A0A),
                        fontSize: 11,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobListSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: controller
                .appliedLoginModelObj.value.joblistsectionItemList.value.length,
            itemBuilder: (context, index) {
              final model = controller.appliedLoginModelObj.value
                  .joblistsectionItemList.value[index];
              return JoblistsectionItemWidget(model);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return SizedBox(
      height: 68,
      width: double.maxFinite,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 38,
          vertical: 4,
        ),
        decoration: const BoxDecoration(
          color: Color(0XFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0X3F000000),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: SizedBox(
                            height: 34,
                            width: 28,
                            child: SvgPicture.asset(
                              "assets/images/img_home_fill.svg",
                            ),
                          ),
                        ),
                        const Text(
                          "Home",
                          style: TextStyle(
                            color: Color(0XFF9D9D9D),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 54,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox(
                              height: 28,
                              width: double.maxFinite,
                              child: SvgPicture.asset(
                                "assets/images/img_file_dock_search.svg",
                              ),
                            ),
                          ),
                          const Text(
                            "Browse",
                            style: TextStyle(
                              color: Color(0XFF9D9D9D),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: SizedBox(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              "assets/images/img_done_ring_round.svg",
                            ),
                          ),
                        ),
                        const Text(
                          "Applied",
                          style: TextStyle(
                            color: Color(0XFF1230AE),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 46,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SizedBox(
                            height: 32,
                            width: double.maxFinite,
                            child: SvgPicture.asset(
                              "assets/images/img_user_alt_fill.svg",
                            ),
                          ),
                        ),
                        const Text(
                          "Profile",
                          style: TextStyle(
                            color: Color(0XFF9D9D9D),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}

class JoblistsectionItemWidget extends StatelessWidget {
  final JoblistsectionItemModel joblistsectionItemModelObj;

  JoblistsectionItemWidget(this.joblistsectionItemModelObj, {Key? key})
      : super(key: key);

  final controller = Get.find<AppliedLoginController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.zero,
      color: const Color(0XFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 112,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0X0C87A5FF),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Obx(
                            () => Image.asset(
                              joblistsectionItemModelObj.designLeadOne!.value,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  joblistsectionItemModelObj
                                      .seniorproduct!.value,
                                  style: const TextStyle(
                                    color: Color(0XFF18191E),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  joblistsectionItemModelObj.googleinc!.value,
                                  style: const TextStyle(
                                    color: Color(0XCC18191E),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0XFFF4F6FC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => Text(
                                  joblistsectionItemModelObj.fulltime!.value,
                                  style: const TextStyle(
                                    color: Color(0XCC18191E),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0XFFF4F6FC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => Text(
                                  joblistsectionItemModelObj.remote!.value,
                                  style: const TextStyle(
                                    color: Color(0XCC18191E),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () => Text(
                            joblistsectionItemModelObj.price!.value,
                            style: const TextStyle(
                              color: Color(0XCC18191E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: double.maxFinite,
                height: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0XFF1230AE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    visualDensity:
                        const VisualDensity(vertical: -4, horizontal: -4),
                    padding: const EdgeInsets.only(right: 6),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          "assets/images/img_system_24px_donecircular.svg",
                          height: 12,
                          width: 12,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        "Applied",
                        style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
