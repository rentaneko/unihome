import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/contract/contract.controller.dart';

class ContractScreen extends GetWidget<ContractController> {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Danh sách hợp đồng',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(22),
              color: AppColor.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.contract.length,
                  itemBuilder: (context, index) {
                    return _contractContainer(index);
                  },
                ),
        ),
      ),
    );
  }

  Widget _contractContainer(int index) {
    return InkWell(
      onTap: () => goTo(
        screen: ROUTE_CONTRACT_DETAIL,
        argument: controller.contract[index].id,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lighter,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.symmetric(
          vertical: responsiveHeight(8),
          horizontal: responsiveWidth(16),
        ),
        padding: EdgeInsets.all(responsiveHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.contract[index].name}',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: responsiveFont(20),
                color: AppColor.blackText,
              ),
            ),
            SizedBox(height: responsiveHeight(12)),
            Text(
              '${controller.contract[index].startDate} - ${controller.contract[index].endDate}',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: responsiveFont(14),
                color: AppColor.blackText,
              ),
            ),
            SizedBox(height: responsiveHeight(12)),
            getStatus(index),
            SizedBox(height: responsiveHeight(12)),
            Text(
              '${controller.contract[index].description}',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: responsiveFont(14),
                color: AppColor.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getStatus(int index) {
    if (controller.contract[index].status!.toLowerCase() == 'active') {
      return Text(
        'Đang hoạt động',
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
          fontSize: responsiveFont(14),
          color: AppColor.complete,
        ),
      );
    }
    return Text(
      'Đã huỷ',
      style: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        fontSize: responsiveFont(14),
        color: AppColor.price,
      ),
    );
  }
}
