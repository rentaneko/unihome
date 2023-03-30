import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/house/house.controller.dart';

class HouseScreen extends GetWidget<HouseController> {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'THÔNG TIN NHÀ',
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
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: responsiveHeight(16)),
                      Padding(
                        padding: EdgeInsets.only(left: responsiveWidth(16)),
                        child: Text(
                          'Thông tin',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: responsiveFont(20),
                            color: AppColor.blackText,
                          ),
                        ),
                      ),
                      SizedBox(height: responsiveHeight(12)),
                      _infoHouse(),
                      SizedBox(height: responsiveHeight(16)),
                      Padding(
                        padding: EdgeInsets.only(
                          left: responsiveWidth(16),
                          right: responsiveWidth(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tiện ích',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                fontSize: responsiveFont(20),
                                color: AppColor.blackText,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Obx(() => _addMoreService());
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(responsiveHeight(2)),
                                decoration: BoxDecoration(
                                  color: AppColor.gray400,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsiveHeight(12)),
                      _serviceBlock(),
                      SizedBox(height: responsiveHeight(16)),
                      Padding(
                        padding: EdgeInsets.only(left: responsiveWidth(16)),
                        child: Text(
                          'Danh sách khách thuê',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: responsiveFont(20),
                            color: AppColor.blackText,
                          ),
                        ),
                      ),
                      _memberBlock(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _infoHouse() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      padding: EdgeInsets.all(responsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildRow(
              title: 'Ký túc xá', value: '${controller.rental.value.flatName}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Địa chỉ',
              value: '${controller.rental.value.buildingAddress}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _buildRow(
              title: 'Phòng', value: '${controller.rental.value.buildingName}'),
          const Divider(color: AppColor.gray400, thickness: 1),
          _managerBlock(),
        ],
      ),
    );
  }

  Widget _managerBlock() {
    return ListTile(
      leading: Container(
        height: responsiveHeight(42),
        width: responsiveWidth(42),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.white,
        ),
        child: Image.asset('assets/icons/user-2.png'),
      ),
      title: Text(
        '${controller.rental.value.accountName}',
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
          fontSize: responsiveFont(16),
          color: AppColor.blackText,
        ),
      ),
      subtitle: Text(
        '${controller.rental.value.accountPhone}',
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
          fontSize: responsiveFont(14),
          color: AppColor.grayText,
        ),
      ),
      trailing: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(responsiveHeight(6)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.grayBorder),
          ),
          child: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _memberBlock() {
    return Container(
      margin: EdgeInsets.only(
        top: responsiveHeight(12),
        left: responsiveWidth(16),
        right: responsiveWidth(16),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(20),
      ),
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: controller.rental.value.renters!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: responsiveWidth(10),
          mainAxisExtent: responsiveHeight(130),
          mainAxisSpacing: responsiveHeight(20),
        ),
        itemBuilder: (BuildContext context, int index) {
          return _member(index);
        },
      ),
    );
  }

  Widget _member(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(8),
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.white,
            minRadius: responsivePercent(8),
            child: Image.asset(
              'assets/icons/user-2.png',
              height: responsiveHeight(20),
              width: responsiveWidth(20),
            ),
          ),
          SizedBox(height: responsiveHeight(6)),
          Text(
            '${controller.rental.value.renters![index].fullname}',
            style: TextStyle(
              fontSize: responsiveFont(12),
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              color: AppColor.blackText,
            ),
          ),
          SizedBox(height: responsiveHeight(6)),
          Text(
            '${controller.rental.value.renters![index].phone}',
            style: TextStyle(
              fontSize: responsiveFont(12),
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              color: AppColor.blackText,
            ),
          ),
          SizedBox(height: responsiveHeight(6)),
        ],
      ),
    );
  }

  Widget _buildRow({required String title, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceBlock() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      padding: EdgeInsets.all(responsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.lighter,
        borderRadius: BorderRadius.circular(24),
      ),
      child: MasonryGridView.builder(
        shrinkWrap: true,
        itemCount: controller.rental.value.listService!.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        crossAxisSpacing: responsiveWidth(12),
        mainAxisSpacing: responsiveHeight(12),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: responsiveHeight(10),
              horizontal: responsiveWidth(24),
            ),
            decoration: BoxDecoration(
              color: AppColor.main,
              borderRadius: BorderRadius.circular(92),
            ),
            child: Text(
              '${controller.rental.value.listService![index].name}',
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: responsiveFont(16),
                color: AppColor.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _addMoreService() {
    return Column(
      children: [
        Text(
          'Danh sách tiện ích',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w600,
            color: AppColor.blackText,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listService.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value: controller.listService[index].checked,
              onChanged: (bool? value) {
                controller.checkDuplicate(value!, index);
              },
              title: Text('${controller.listService[index].name}'),
              activeColor: AppColor.complete,
            );
          },
        ),
      ],
    );
  }
}
