import 'package:get/get.dart';
import 'package:unihome/views/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/home/home.controller.dart';
import 'package:unihome/views/invoices/invoice.controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(InvoiceController());
    Get.put(BottomNavBarController());
  }
}
