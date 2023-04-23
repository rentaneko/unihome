import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
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
            'Danh sách hóa đơn',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(24),
              color: AppColor.blackText,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 2,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColor.white,
        body: Obx(
          () => controller.isLoading.value == true
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
          _buildTab(null),
          _buildTab(false),
          _buildTab(true),
        ],
      ),
    );
  }

  Widget _buildTab(bool? status) {
    if (status != null) {
      RxList<Invoice> listByType = <Invoice>[].obs;
      controller.listInvoice.forEach(
        (element) {
          if (element.status == status) {
            listByType.add(element);
          }
        },
      );

      return Padding(
        padding: EdgeInsets.all(responsiveHeight(16)),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listByType.length,
          itemBuilder: (context, index) {
            // ignore: unnecessary_cast
            listByType as List<Invoice>;
            return InkWell(
              onTap: () => goTo(
                screen: ROUTE_INVOICE_DETAIL,
                argument: listByType[index].invoiceId,
              ),
              child: Container(
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
                    Text(
                      '${controller.listInvoice[index].invoiceName}',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        fontSize: responsiveFont(16),
                        color: AppColor.blackText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: controller.listInvoice[index].dueDate ==
                                  'Chưa cập nhật'
                              ? Text(
                                  'Chưa cập nhật',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    fontSize: responsiveFont(22),
                                    color: AppColor.blackText,
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Jiffy(listByType[index].dueDate)
                                          .format('MM'),
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        fontSize: responsiveFont(40),
                                        color: AppColor.blackText,
                                      ),
                                    ),
                                    Text(
                                      '/${Jiffy(listByType[index].dueDate).format('yyyy')}',
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
                              listByType[index].amount.toVND(unit: 'VNĐ'),
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                fontSize: responsiveFont(22),
                                color: AppColor.blackText,
                              ),
                            ),
                            _statusText(listByType[index].status!),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Người thanh toán',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700,
                            fontSize: responsiveFont(16),
                            color: AppColor.blackText,
                          ),
                        ),
                        Text(
                          '${listByType[index].renter!.fullname}',
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
              ),
            );
          },
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(responsiveHeight(16)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listInvoice.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => goTo(
              screen: ROUTE_INVOICE_DETAIL,
              argument: controller.listInvoice[index].invoiceId,
            ),
            child: Container(
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
                  Text(
                    '${controller.listInvoice[index].invoiceName}',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: responsiveFont(16),
                      color: AppColor.blackText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: controller.listInvoice[index].dueDate ==
                                'Chưa cập nhật'
                            ? Text(
                                'Chưa cập nhật',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: responsiveFont(22),
                                  color: AppColor.blackText,
                                ),
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Jiffy(controller.listInvoice[index].dueDate)
                                        .format('MM'),
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500,
                                      fontSize: responsiveFont(40),
                                      color: AppColor.blackText,
                                    ),
                                  ),
                                  Text(
                                    '/${Jiffy(controller.listInvoice[index].dueDate).format('yyyy')}',
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
                            controller.listInvoice[index].amount
                                .toVND(unit: 'VNĐ'),
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(22),
                              color: AppColor.blackText,
                            ),
                          ),
                          _statusText(controller.listInvoice[index].status!),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Người thanh toán',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          fontSize: responsiveFont(16),
                          color: AppColor.blackText,
                        ),
                      ),
                      Text(
                        '${controller.listInvoice[index].renter!.fullname}',
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
            ),
          );
        },
      ),
    );
  }

  Widget _statusText(bool status) {
    if (status == false) {
      return Text(
        'Chưa thanh toán',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'SF Pro Display',
          fontSize: responsiveFont(15),
          color: AppColor.price,
        ),
      );
    }
    return Text(
      'Đã thanh toán',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'SF Pro Display',
        fontSize: responsiveFont(15),
        color: AppColor.complete,
      ),
    );
  }
}
