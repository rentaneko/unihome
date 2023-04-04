import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/technician/electric/electric.controller.dart';

class ElectricView extends GetWidget<ElectricController> {
  const ElectricView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Tòa nhà',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                fontSize: responsiveFont(20),
                color: AppColor.blackText,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: '1',
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                ],
              ),
            ),
            Text(
              'Phòng',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                fontSize: responsiveFont(20),
                color: AppColor.blackText,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: '1',
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
