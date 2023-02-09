import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/login.controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeightDevice(),
        width: getWidthDevice(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('username'),
            TextFormField(),
            Text('password'),
            TextFormField(),
            ElevatedButton(
              onPressed: () {},
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
