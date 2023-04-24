import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/renter/ticket_detail/ticket_detail.controller.dart';

class TicketDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.put(UserRepo(Get.find()));
    Get.put(TicketDetailController());
  }
}
