import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/home/home.view.dart';
import 'package:unihome/views/invoices/invoice.view.dart';
import 'package:unihome/views/profile/profile.view.dart';

class BottomNavBarScreen extends GetWidget<BottomNavBarController> {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [HomeScreen(), InvoiceScreen(), ProfileScreen()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: AppColor.primary,
            elevation: 0,
            selectedItemColor: AppColor.white,
            unselectedItemColor: AppColor.gray,
            currentIndex: controller.selectedIndex.value,
            onTap: (value) => controller.changeTab(value),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Thông tin'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_one_rounded), label: 'Hoá đơn'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Cá nhân'),
            ],
          ),
        ),
      ),
    );
  }
}