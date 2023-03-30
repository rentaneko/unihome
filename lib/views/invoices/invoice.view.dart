import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/invoices/invoice.controller.dart';

class InvoiceScreen extends GetWidget<InvoiceController> {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'HOÁ ĐƠN',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(22),
              color: AppColor.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        backgroundColor: AppColor.white,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      SizedBox(height: responsiveHeight(12)),
                      _buildTabbar(),
                      _buildBody(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildTabbar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.grayBorder,
        borderRadius: BorderRadius.circular(72),
      ),
      child: ButtonsTabBar(
        radius: 72,
        elevation: 0,
        contentPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(18)),
        center: false,
        physics: const NeverScrollableScrollPhysics(),
        unselectedBackgroundColor: AppColor.grayBorder,
        backgroundColor: AppColor.main,
        unselectedLabelStyle: TextStyle(
          color: AppColor.grayText,
          fontFamily: 'SF Pro Display',
          fontSize: responsiveFont(15),
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'SF Pro Display',
          fontSize: responsiveFont(15),
          fontWeight: FontWeight.w500,
        ),
        height: 56,
        tabs: const [
          Tab(text: 'Tất cả'),
          Tab(text: 'Chưa thanh toán'),
          Tab(text: 'Đã thanh toán'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildTab('Tất cả'),
          Container(color: AppColor.bg),
          Container(color: AppColor.blue),
        ],
      ),
    );
  }

  Widget _buildTab(String type) {
    return Padding(
      padding: EdgeInsets.all(responsiveHeight(16)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: responsiveHeight(12)),
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(16),
              vertical: responsiveHeight(16),
            ),
            decoration: BoxDecoration(
              color: AppColor.lighter,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(40),
                              color: AppColor.blackText,
                            ),
                          ),
                          Text(
                            '/2022',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(16),
                              color: AppColor.blackText,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '1.500.000 đồng',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            fontSize: responsiveFont(22),
                            color: AppColor.blackText,
                          ),
                        ),
                        Text(
                          'Đã trả',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF Pro Display',
                            fontSize: responsiveFont(15),
                            color: AppColor.complete,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tiền cọc',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        fontSize: responsiveFont(16),
                        color: AppColor.blackText,
                      ),
                    ),
                    Text(
                      '1.500.000 đồng',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        fontSize: responsiveFont(15),
                        color: AppColor.blackText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
