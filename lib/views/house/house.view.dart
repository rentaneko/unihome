import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      ),
    );
  }
}
