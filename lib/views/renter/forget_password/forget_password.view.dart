import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/forget_password/forget_password.controller.dart';

class ForgetPasswordScreen extends GetWidget<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(64)),
                Image.asset('assets/logos/logo.png', color: AppColor.white),
                Text(
                  'Bạn quên mật khẩu?',
                  style: TextStyle(
                    fontSize: responsiveFont(24),
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                Text(
                  'Vui lòng nhập địa chỉ email\ncủa bạn để đặt lại mật khẩu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsiveFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackText,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                SizedBox(height: responsiveHeight(36)),
                TextFormField(
                  controller: controller.emailCtrl,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng nhập email của bạn';
                    } else {
                      if (!GetUtils.isEmail(value)) {
                        return 'Vui lòng nhập đúng định dạng email';
                      }
                    }
                    return null;
                  },
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
                    hintText: 'Nhập email của bạn trong hợp đồng',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: responsiveFont(14),
                      color: AppColor.gray400,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(24)),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.resetPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    minimumSize: Size(double.infinity, responsiveHeight(48)),
                  ),
                  child: Text(
                    'Gửi email',
                    style: TextStyle(
                      fontSize: responsiveFont(16),
                      fontWeight: FontWeight.w600,
                      color: AppColor.main,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                TextButton(
                  onPressed: () => goBack(),
                  child: Text(
                    'Trở lại',
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
