import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unihome/repositories/repos/user.repo.dart';

class LoginController extends GetxController {
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  final formKey = GlobalKey<FormState>();

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Please input your username';
    } else {
      if (value.length < 4 || value.length > 15) {
        return 'Username must be from 4-5 chars';
      }
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please input your password';
    } else {
      if (value.length < 6 || value.length > 12) {
        return 'Password must be from 6-12 chars';
      }
    }
    return null;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      log('True');
    } else {
      log('False');
    }
    // await _userRepo
    //     .loginWithRenter(
    //       usernameCtrl.text.trim(),
    //       passwordCtrl.text.trim(),
    //     )
    //     .then((value) => inspect(value));
  }
}
