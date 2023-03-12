import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/contract/contract.controller.dart';

class ContractScreen extends GetWidget<ContractController> {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'HỢP ĐỒNG',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(22),
                      color: AppColor.white,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: AppColor.primary,
                ),
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                  child: Column(
                    children: [
                      SizedBox(height: responsiveHeight(24)),
                      Text(
                        'Thông tin hợp đồng',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: responsiveFont(18),
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(height: responsiveHeight(24)),
                      _buildRow(
                        title: 'Tên',
                        value: controller.contract.value.name!,
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      _buildRow(
                        title: 'Giá nhà',
                        value:
                            controller.contract.value.priceForRent.toString(),
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      _buildRow(
                        title: 'Ngày kí',
                        value: Jiffy.parse(
                                controller.contract.value.dateSigned.toString())
                            .format(pattern: 'dd/MM/yyyy'),
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      _buildRow(
                        title: 'Ngày bắt đầu',
                        value: Jiffy.parse(
                                controller.contract.value.startDate.toString())
                            .format(pattern: 'dd/MM/yyyy'),
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      _buildRow(
                        title: 'Ngày kết thúc',
                        value: 'Chưa cập nhật',
                        // value: Jiffy.parse(
                        //         controller.contract.value.endDate.toString())
                        //     .format(pattern: 'dd/MM/yyyy'),
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      _buildRow(
                        title: 'Ngày cập nhật',
                        value: Jiffy.parse(controller.contract.value.lastUpdated
                                .toString())
                            .format(pattern: 'dd/MM/yyyy'),
                      ),
                      const Divider(color: AppColor.grayLight, thickness: 1),
                      SizedBox(height: responsiveHeight(16)),
                      Text(
                        'Dịch vụ sử dụng',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: responsiveFont(18),
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(height: responsiveHeight(24)),
                      ListTile(
                        leading: Image.asset('assets/icons/water.png'),
                        title: Text(
                          'Tiền nước theo đồng hồ',
                          style: TextStyle(
                            fontSize: responsiveFont(18),
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          '${controller.contract.value.priceForWater}đ/m3',
                          style: TextStyle(
                            fontSize: responsiveFont(18),
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset('assets/icons/electric.png'),
                        title: Text(
                          'Tiền điện theo đồng hồ',
                          style: TextStyle(
                            fontSize: responsiveFont(18),
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          '${controller.contract.value.priceForElectricity}đ/Kwh',
                          style: TextStyle(
                            fontSize: responsiveFont(18),
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
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
