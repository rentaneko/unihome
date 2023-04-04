import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/technician/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/technician/electric/electric.view.dart';

class BottomNavBarScreen extends GetWidget<BottomNavBarController> {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              ElectricView(),
              Container(color: AppColor.price),
              Container(color: AppColor.complete),
              Container(color: AppColor.processing),
            ],
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
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/lightning.png'),
                label: 'Điện',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/water.png'),
                label: 'Nước',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/danger.png'),
                label: 'Sự cố',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/user.png'),
                label: 'Cá nhân',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
