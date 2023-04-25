import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class ForgetPasswordController extends GetxController {
  final emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailCtrl.clear();
    emailCtrl.dispose();
    super.onClose();
  }

  Future<void> resetPassword() async {
    await _userRepo.resetPassword(emailCtrl.text.trim()).then(
      (value) {
        if (value) {
          showLoading(
              'Vui lòng kiểm tra hòm thư của bạn\nHệ thống tự động quay về trang đăng nhập sau 3 giây');
          Future.delayed(
            const Duration(seconds: 3),
            () {
              hideLoading();
              goBack();
            },
          );
        }
      },
    );
  }
}
