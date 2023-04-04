import 'package:get/get.dart';
import 'package:unihome/views/technician/electric/electric.controller.dart';

class ElectricBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ElectricController());
  }
}
