import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/dummy_data.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/home/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    ListTile(
                      leading: IconButton(
                        onPressed: () => goTo(screen: ROUTE_PROFILE),
                        icon: Image.asset(
                          'assets/icons/user.png',
                          height: responsiveHeight(45),
                          width: responsiveWidth(45),
                        ),
                      ),
                      title: Text(
                        'Xin chào,',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: responsiveFont(12),
                          color: AppColor.black,
                        ),
                      ),
                      subtitle: Text(
                        '${controller.renter.value.fullname}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: responsiveFont(16),
                          color: AppColor.black,
                        ),
                      ),
                      trailing: Image.asset(
                        'assets/icons/notification.png',
                        height: responsiveHeight(35),
                        width: responsiveWidth(35),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(32)),
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: responsiveWidth(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColor.grayLight,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: responsiveHeight(10),
                              horizontal: responsiveWidth(20),
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(24),
                              border:
                                  Border.all(color: AppColor.gray, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Ngày đến hạn thanh toán ',
                                  style: TextStyle(
                                    fontSize: responsiveFont(14),
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                                ),
                                Text(
                                  Jiffy.parse(
                                          controller.contract.value.dateSigned!)
                                      .format(pattern: 'dd/MM/yyyy')
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: responsiveFont(20),
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.price,
                                  ),
                                ),
                                SizedBox(height: responsiveHeight(12)),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    minimumSize: Size(
                                        double.infinity, responsiveHeight(40)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Text(
                                    'Trả ngay ${controller.contract.value.priceForRent}đ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: responsiveFont(20),
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: responsiveHeight(16)),
                                _buildRow(
                                    title: 'Mã hợp đồng',
                                    value: '${controller.contract.value.id}'),
                                const Divider(
                                    color: AppColor.gray, thickness: 1),
                                _buildRow(
                                    title: 'Số dư còn lại',
                                    value: '100.000.000đ'),
                                const Divider(
                                    color: AppColor.gray, thickness: 1),
                              ],
                            ),
                          ),
                          SizedBox(height: responsiveHeight(16)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(20)),
                            child:
                                _buildRow(title: 'Ký túc xá', value: '123123'),
                          ),
                          SizedBox(height: responsiveHeight(16)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(20)),
                            child: _buildRow(
                                title: 'Người quản lí', value: '123123'),
                          ),
                          SizedBox(height: responsiveHeight(16)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(20)),
                            child: _buildRow(
                                title: 'Số điện thoại', value: '123123'),
                          ),
                          SizedBox(height: responsiveHeight(16)),
                        ],
                      ),
                    ),
                    SizedBox(height: responsiveHeight(32)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(16),
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 16 / 5,
                          crossAxisSpacing: responsiveWidth(22),
                          mainAxisSpacing: responsiveHeight(22),
                        ),
                        shrinkWrap: true,
                        itemCount: serviceData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildServiceComponent(index);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildServiceComponent(int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () => goTo(screen: serviceData[index]['route'].toString()),
        leading: Image.asset(serviceData[index]['icon'].toString()),
        title: Text(
          serviceData[index]['title'].toString(),
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w500,
            color: AppColor.primary,
          ),
        ),
        tileColor: AppColor.white,
        style: ListTileStyle.drawer,
        minLeadingWidth: responsiveWidth(30),
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
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w400,
            color: AppColor.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w400,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}
