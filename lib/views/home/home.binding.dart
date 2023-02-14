import 'package:get/get.dart';
import 'package:unihome/views/home/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
