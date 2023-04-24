import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/technician/login_tech/login_tech.controller.dart';

class LoginTechBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.put(UserRepo(Get.find()));
    Get.put(LoginTechController());
  }
}
