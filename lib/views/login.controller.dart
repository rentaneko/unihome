import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unihome/repositories/repos/user.repo.dart';

class LoginController extends GetxController {
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;

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

  Future<void> login() async {
    await _userRepo
        .loginWithRenter(
          usernameCtrl.text.trim(),
          passwordCtrl.text.trim(),
        )
        .then((value) => inspect(value));
  }
}
