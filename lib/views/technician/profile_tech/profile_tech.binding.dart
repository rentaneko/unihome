import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/technician/profile_tech/profile_tech.controller.dart';

class ProfileTechBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut(() => UserRepo(Get.find()));
    Get.lazyPut(() => ProfileTechController(), fenix: true);
  }
}
