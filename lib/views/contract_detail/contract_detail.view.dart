import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/contract_detail/contract_detail.controller.dart';

class ContractDetailScreen extends GetWidget<ContractDetailController> {
  const ContractDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi tiết hợp đồng',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: responsiveFont(24),
            color: AppColor.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: AppColor.black),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(responsiveHeight(16)),
                      child: Text(
                        'Thông tin nhà',
                        style: TextStyle(
                          fontSize: responsiveFont(20),
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackText,
                        ),
                      ),
                    ),
                    _infoHouse(),
                    Padding(
                      padding: EdgeInsets.all(responsiveHeight(16)),
                      child: Text(
                        'Thông tin dịch vụ',
                        style: TextStyle(
                          fontSize: responsiveFont(20),
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackText,
                        ),
                      ),
                    ),
                    _infoService(),
                    Padding(
                      padding: EdgeInsets.all(responsiveHeight(16)),
                      child: Text(
                        'Thông tin hợp đồng',
                        style: TextStyle(
                          fontSize: responsiveFont(20),
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackText,
                        ),
                      ),
                    ),
                    _infoContract(),
                    SizedBox(height: responsiveHeight(30)),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _infoContract() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Column(
        children: [
          _buildRow(
              title: 'Ngày kí',
              value: '${controller.contract.value.dateSigned}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Ngày bắt đầu',
              value: '${controller.contract.value.dateStarted}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Ngày kết thúc',
              value: '${controller.contract.value.dateEnd}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Ngày cập nhật',
              value: '${controller.contract.value.lastUpdated}'),
        ],
      ),
    );
  }

  Widget _infoService() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/icons/house.png',
              height: responsiveHeight(40),
              width: responsiveWidth(40),
            ),
            title: Text(
              'Tiền thuê',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(18),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
            subtitle: Text(
              controller.contract.value.priceForRent.toVND(unit: 'đ'),
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(14),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/water.png',
              height: responsiveHeight(40),
              width: responsiveWidth(40),
            ),
            title: Text(
              'Tiền nước',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(18),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
            subtitle: Text(
              controller.contract.value.priceForWater.toVND(unit: 'đ'),
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(14),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/lighting.png',
              height: responsiveHeight(40),
              width: responsiveWidth(40),
            ),
            title: Text(
              'Tiền điện',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(18),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
            subtitle: Text(
              controller.contract.value.priceForElectric.toVND(unit: 'đ'),
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(14),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/request.png',
              height: responsiveHeight(40),
              width: responsiveWidth(40),
              color: AppColor.black,
            ),
            title: Text(
              'Tiền dịch vụ tòa nhà',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(18),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
            subtitle: Text(
              controller.contract.value.priceForService.toVND(unit: 'đ'),
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: responsiveFont(14),
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoHouse() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Column(
        children: [
          _buildRow(
              title: 'Ký túc xá',
              value: '${controller.contract.value.buildingName}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Địa chỉ',
              value: '${controller.contract.value.buildingAddress}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Số điện thoại',
              value: '${controller.contract.value.buildingPhone}'),
        ],
      ),
    );
  }

  Widget _buildRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w400,
            color: AppColor.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w500,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}
