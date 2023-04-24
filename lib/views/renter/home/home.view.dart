import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: responsiveWidth(16),
                          mainAxisSpacing: responsiveHeight(16),
                          mainAxisExtent: responsiveHeight(54),
                        ),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(responsiveWidth(16)),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: serviceData.length,
                        itemBuilder: (context, index) {
                          return _buildServiceComponent(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildServiceComponent(int index) {
    return ListTile(
      onTap: () => goTo(screen: serviceData[index]['route'].toString()),
      tileColor: AppColor.main,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      trailing: Image.asset(
        '${serviceData[index]['icon']}',
        height: responsiveHeight(45),
        width: responsiveWidth(45),
        color: AppColor.white,
      ),
      leading: Text(
        '${serviceData[index]['title']}',
        style: TextStyle(
          fontSize: responsiveFont(20),
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
          '${controller.basicRental.value.roomId}',
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
