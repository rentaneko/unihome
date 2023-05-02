import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/ticket_detail/ticket_detail.controller.dart';

class TicketDetailScreen extends GetWidget<TicketDetailController> {
  const TicketDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goToAndRemoveAll(screen: ROUTE_NAV_BAR),
      child: Scaffold(
        backgroundColor: AppColor.main,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: AppColor.blackText),
          elevation: 2,
          title: Text(
            'Chi tiết yêu cầu',
            style: TextStyle(
              color: AppColor.black,
              fontSize: responsiveFont(24),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(36)),
                Text(
                  'Tên yêu cầu',
                  style: TextStyle(
                    fontSize: responsiveFont(16),
                    color: AppColor.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(8)),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(8),
                      vertical: responsiveHeight(4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.grayBorder,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.main,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.price,
                        width: 0.5,
                      ),
                    ),
                    fillColor: AppColor.white,
                    filled: true,
                    enabled: false,
                    hintText: '${controller.ticket.name}',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: responsiveFont(16),
                      color: AppColor.blackText,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                Text(
                  'Loại yêu cầu',
                  style: TextStyle(
                    fontSize: responsiveFont(16),
                    color: AppColor.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(8)),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(8),
                      vertical: responsiveHeight(4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.grayBorder,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.main,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.price,
                        width: 0.5,
                      ),
                    ),
                    fillColor: AppColor.white,
                    filled: true,
                    enabled: false,
                    hintText: '${controller.ticket.ticketType!.name}',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: responsiveFont(16),
                      color: AppColor.blackText,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                Text(
                  'Miêu tả thêm',
                  style: TextStyle(
                    fontSize: responsiveFont(16),
                    color: AppColor.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(8)),
                TextFormField(
                  controller: controller.desc,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(8),
                      vertical: responsiveHeight(4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.grayBorder,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.main,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.price,
                        width: 0.5,
                      ),
                    ),
                    fillColor: AppColor.white,
                    filled: true,
                    hintText: controller.desc.text,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: responsiveFont(16),
                      color: AppColor.blackText,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: responsiveHeight(12)),
                Text(
                  'Hình đính kèm',
                  style: TextStyle(
                    fontSize: responsiveFont(16),
                    color: AppColor.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(8)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: responsiveHeight(24)),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.grayBorder),
                  ),
                  child: controller.ticket.imageUrl == null
                      ? IconButton(
                          onPressed: () =>
                              controller.pickImage(ImageSource.gallery),
                          icon: Image.asset(
                            'assets/icons/add-image.png',
                            color: AppColor.black,
                          ),
                        )
                      : Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: 2.5,
                              children: controller.imageList
                                  .map((img) => Image.file(File(img.path)))
                                  .toList(),
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.pickImage(ImageSource.gallery),
                              icon: Image.asset('assets/icons/add-photo.png',
                                  height: responsiveHeight(24),
                                  width: responsiveWidth(24),
                                  color: AppColor.black),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: responsiveHeight(24)),
                getStatus(controller.ticket.status!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getStatus(String status) {
    if (status == 'Confirming') {
      return ElevatedButton(
        onPressed: () => controller.acceptTicket(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          minimumSize: Size(double.infinity, responsiveHeight(48)),
          disabledBackgroundColor: AppColor.white.withOpacity(0.8),
        ),
        child: Text(
          'Xác nhận đã giải quyết',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: responsiveFont(16),
            color: AppColor.main,
            fontFamily: 'SF Pro Display',
          ),
        ),
      );
    } else if (status == 'Active') {
      return ElevatedButton(
        onPressed: () => controller.deleteTicket(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          minimumSize: Size(double.infinity, responsiveHeight(48)),
          disabledBackgroundColor: AppColor.white.withOpacity(0.8),
        ),
        child: Text(
          'Huỷ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: responsiveFont(16),
            color: AppColor.main,
            fontFamily: 'SF Pro Display',
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
