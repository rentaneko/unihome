import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/technician/nav_bar/nav_bar.controller.dart';
import 'package:unihome/views/technician/ticket_tech/ticket_tech.view.dart';

class NavBarScreen extends GetWidget<NavBarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            TicketTechScreen(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          selectedItemColor: AppColor.main,
          unselectedItemColor: AppColor.gray500,
          currentIndex: controller.selectedIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) => controller.changeTab(value),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/danger.png'),
              label: 'Yêu cầu',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/user.png'),
              label: 'Hồ sơ',
            ),
          ],
        ),
      ),
    );
  }
}
