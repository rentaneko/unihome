import 'package:get/get.dart';
import 'package:unihome/views/technician/nav_bar/nav_bar.controller.dart';
import 'package:unihome/views/technician/profile_tech/profile_tech.controller.dart';
import 'package:unihome/views/technician/ticket_tech/ticket_tech.controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TicketTechController());
    Get.put(ProfileTechController());
    Get.put(NavBarController());
  }
}
