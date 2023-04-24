import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut(() => UserRepo(Get.find()));
    Get.put(TicketController());
  }
}
