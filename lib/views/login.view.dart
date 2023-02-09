import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/login.controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SizedBox(
        height: getHeightDevice(),
        width: getWidthDevice(),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('username'),
              TextFormField(
                controller: controller.usernameCtrl,
                validator: (value) => controller.validateUsername(value),
              ),
              Text('password'),
              TextFormField(
                controller: controller.passwordCtrl,
                validator: (value) => controller.validatePassword(value),
              ),
              ElevatedButton(
                onPressed: () => controller.login(),
                child: Text('login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
