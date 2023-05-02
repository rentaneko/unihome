import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/dummy_data.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/home/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoBlock(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: Text(
                          'Tính năng',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackText,
                            fontSize: responsiveFont(18),
                          ),
                        ),
                      ),
                      SizedBox(height: responsiveHeight(16)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildServiceComponent(
                                'assets/icons/contract.png',
                                'Hợp đồng',
                                () => goTo(screen: ROUTE_CONTRACT),
                              ),
                            ),
                            SizedBox(width: responsiveWidth(16)),
                            Expanded(
                              child: _buildServiceComponent(
                                'assets/icons/user.png',
                                'Hồ sơ',
                                () => goTo(screen: ROUTE_PROFILE),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsiveHeight(16)),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildServiceComponent(
      String icon, String title, VoidCallback onPress) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: AppColor.main,
        padding: EdgeInsets.symmetric(
          vertical: responsiveHeight(8),
          horizontal: responsiveWidth(12),
        ),
      ),
      icon: Image.asset(
        icon,
        height: responsiveHeight(35),
        width: responsiveWidth(35),
        color: AppColor.white,
      ),
      label: Text(
        title,
        style: TextStyle(
          fontSize: responsiveFont(18),
          fontWeight: FontWeight.w600,
          color: AppColor.white,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }

  Widget _infoBlock() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        vertical: responsiveHeight(20),
        horizontal: responsiveWidth(16),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.black, width: 1),
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/logos/logo.png',
          height: responsiveHeight(75),
          width: responsiveWidth(60),
        ),
        title: Text(
          '${controller.basicRental.value.roomName}',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w400,
            color: AppColor.blackText,
          ),
        ),
        subtitle: Text(
          '${controller.basicRental.value.buildingName}',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w700,
            color: AppColor.blackText,
          ),
        ),
      ),
    );
  }
}
