import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/invoice_detail/invoice_detail.controller.dart';

class InvoiceDetailScreen extends GetWidget<InvoiceDetailController> {
  const InvoiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi tiết hóa đơn',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: responsiveFont(24),
            color: AppColor.blackText,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: AppColor.black),
      ),
      backgroundColor: AppColor.main,
      body: Obx(
        () => controller.isLoading.value == true
            ? const Center(child: CircularProgressIndicator.adaptive())
            : (controller.invoice.value.invoiceId == null
                ? const Center(child: Text('Chưa có dữ liệu'))
                : ListView(
                    children: [
                      SizedBox(height: responsiveHeight(36)),
                      _infoBlock(),
                      SizedBox(height: responsiveHeight(24)),
                      // _moneyBlock(),
                      SizedBox(height: responsiveHeight(24)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: Text(
                          'Hình đính kèm',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: responsiveFont(20),
                            color: AppColor.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      _imageBlock(),
                    ],
                  )),
      ),
    );
  }

  Widget _imageBlock() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(12),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset('assets/icons/add-image.png'),
    );
  }

  Widget _moneyBlock() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(12),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: responsiveFont(30),
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${controller.invoice.value.amount} đồng',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: responsiveFont(20),
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          controller.invoice.value.invoiceDetails != null
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.invoice.value.invoiceDetails!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.invoice.value.invoiceDetails![index].service!.serviceName}',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: responsiveFont(16),
                              color: AppColor.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${controller.invoice.value.invoiceDetails![index].service!.amount} đồng',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: responsiveFont(16),
                              color: AppColor.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _infoBlock() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(12),
      ),
      padding: EdgeInsets.all(responsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            'Tên',
            controller.invoice.value.invoiceName.toString(),
          ),
          SizedBox(height: responsiveHeight(8)),
          _buildRow(
            'Tình trạng',
            controller.invoice.value.status.toString(),
          ),
          SizedBox(height: responsiveHeight(8)),
          _buildRow(
            'Ngày tạo',
            Jiffy(controller.invoice.value.createTime).format('dd/MM/yyyy'),
          ),
          SizedBox(height: responsiveHeight(8)),
          _buildRow(
            'Hạn trả',
            controller.invoice.value.dueDate.toString(),
          ),
          SizedBox(height: responsiveHeight(8)),
          _buildRow(
            'Ngày trả',
            controller.invoice.value.paymentTime.toString(),
          ),
          SizedBox(height: responsiveHeight(8)),
          _statusText('Chi tiết'),
          SizedBox(height: responsiveHeight(4)),
          Text(
            controller.invoice.value.detail.toString(),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              fontWeight: FontWeight.w400,
              color: AppColor.blackText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w400,
            color: AppColor.blackText,
          ),
        ),
        _statusText(value),
      ],
    );
  }

  Widget _statusText(String status) {
    switch (status) {
      case 'true':
        return Text(
          'Đã thanh toán',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: responsiveFont(16),
            color: AppColor.price,
          ),
        );
      case 'false':
        return Text(
          'Chưa thanh toán',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: responsiveFont(16),
            color: AppColor.complete,
          ),
        );
      default:
        return Text(
          status,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: responsiveFont(14),
            fontWeight: FontWeight.w400,
            color: AppColor.blackText,
          ),
        );
    }
  }
}
