import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/home/home.view.dart';
import 'package:unihome/views/house/house.view.dart';
import 'package:unihome/views/invoices/invoice.view.dart';
import 'package:unihome/views/ticket/ticket.view.dart';

class BottomNavBarScreen extends GetWidget<BottomNavBarController> {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomeScreen(),
              HouseScreen(),
              InvoiceScreen(),
              TicketScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: AppColor.primary,
            elevation: 0,
            selectedItemColor: AppColor.main,
            unselectedItemColor: AppColor.gray500,
            currentIndex: controller.selectedIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) => controller.changeTab(value),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png'),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/rental.png'),
                label: 'Căn hộ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/invoice.png',
                  height: responsiveHeight(24),
                  width: responsiveWidth(24),
                  color: AppColor.blackText,
                ),
                label: 'Hóa đơn',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/danger.png'),
                label: 'Yêu cầu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
