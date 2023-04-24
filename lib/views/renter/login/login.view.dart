import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';
import 'package:unihome/views/renter/login/login.controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => goBack(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
            size: responsiveFont(18),
          ),
        ),
      ),
      body: Container(
        height: getHeightDevice(),
        width: getWidthDevice(),
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Chào mừng trở lại!',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: responsiveFont(24),
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(10)),
                Center(
                  child: Text(
                    'Vui lòng đăng nhập để sử dụng hệ thống.',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: responsiveFont(14),
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayText,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/logos/logo.png',
                    height: responsiveHeight(250),
                  ),
                ),
                Text(
                  'Tài khoản',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: responsiveFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackText,
                  ),
                ),
                SizedBox(height: responsiveHeight(10)),
                TextFormField(
                  key: const Key('username_controller'),
                  controller: controller.usernameCtrl,
                  validator: (value) => controller.validateUsername(value),
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.price),
                    ),
                    prefixIcon: Image.asset(
                      'assets/icons/user.png',
                      color: AppColor.primary,
                    ),
                    focusColor: AppColor.primary,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.price),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.primary),
                    ),
                    filled: true,
                    fillColor: AppColor.lightBlue,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.grayBorder),
                    ),
                    hintText: 'example@gmail.com',
                    hintStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: responsiveFont(16),
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayText,
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(32)),
                Text(
                  'Mật khẩu',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: responsiveFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackText,
                  ),
                ),
                SizedBox(height: responsiveHeight(10)),
                TextFormField(
                  key: const Key('password_controller'),
                  controller: controller.passwordCtrl,
                  validator: (value) => controller.validatePassword(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/key.png',
                      color: AppColor.primary,
                    ),
                    focusColor: AppColor.primary,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.price),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.price),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.primary),
                    ),
                    filled: true,
                    fillColor: AppColor.lightBlue,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: AppColor.grayBorder),
                    ),
                    hintText: 'Nhập mật khẩu ở đây',
                    hintStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: responsiveFont(16),
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayText,
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(64)),
                button('Đăng nhập', () => controller.login()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
