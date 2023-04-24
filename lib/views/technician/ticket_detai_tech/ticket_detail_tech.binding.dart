import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/technician/ticket_detai_tech/ticket_detai_tech.controller.dart';

class TicketDetailTechBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.put(UserRepo(Get.find()));
    Get.put(TicketDetailTechController());
  }
}
