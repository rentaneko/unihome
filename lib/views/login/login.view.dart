import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/login/login.controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        height: getHeightDevice(),
        width: getWidthDevice(),
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/logos/logo.png'),
                Text(
                  'Chào mừng quý cư dân',
                  style: TextStyle(
                    fontSize: responsiveFont(28),
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: responsiveHeight(32)),
                TextFormField(
                  controller: controller.usernameCtrl,
                  validator: (value) => controller.validateUsername(value),
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.person_2, color: AppColor.primary),
                    labelText: 'Tên tài khoản',
                    labelStyle: TextStyle(
                      fontSize: responsiveFont(16),
                      color: AppColor.primary,
                    ),
                    focusColor: AppColor.primary,
                    prefixIconColor: AppColor.primary,
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.price),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(32)),
                TextFormField(
                  controller: controller.passwordCtrl,
                  validator: (value) => controller.validatePassword(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: AppColor.primary),
                    labelText: 'Mật khẩu',
                    labelStyle: TextStyle(
                      fontSize: responsiveFont(16),
                      color: AppColor.primary,
                    ),
                    focusColor: AppColor.primary,
                    prefixIconColor: AppColor.primary,
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.price),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off_outlined,
                          color: AppColor.primary),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(64)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            vertical: responsiveHeight(16), horizontal: responsiveWidth(16)),
        child: ElevatedButton(
          onPressed: () => controller.login(),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minimumSize: Size(double.infinity, responsiveHeight(48))),
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColor.white,
              fontSize: responsiveFont(18),
            ),
          ),
        ),
      ),
    );
  }
}
