import 'package:get/get.dart';
import 'package:unihome/views/bottom_nav_bar/botton_nav_bar.controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
  }
}
