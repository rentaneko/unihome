import 'package:flutter/material.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';

Widget button(String title, VoidCallback onPress) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.main,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(8)),
      minimumSize: Size(double.infinity, responsiveHeight(48)),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: AppColor.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        fontSize: responsiveFont(14),
      ),
    ),
  );
}
