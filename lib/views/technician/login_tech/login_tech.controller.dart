import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/utils/metric.dart';

class LoginTechController extends GetxController {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  late SharedPreferences _preferences;
  final formKey = GlobalKey<FormState>();

  var isVisible = false.obs;

  final _userRepo = Get.find<UserRepo>();
  @override
  void onClose() {
    usernameCtrl.clear();
    passwordCtrl.clear();
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
    _preferences = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      showLoading('Waiting');
      await _userRepo
          .loginWithTechnician(
              usernameCtrl.text.trim(), passwordCtrl.text.trim())
          .then((value) {
        if (value != null) {
          _preferences.setString(TOKEN, value.data['token'].toString());
          _preferences.setString(USER_ID, value.data['id'].toString());

          goTo(screen: ROUTE_NAV_BAR_TECH);
        } else {
          showToast('Username or password is wrong');
        }
      });
      hideLoading();
    } else {
      log('False');
    }
  }
}
