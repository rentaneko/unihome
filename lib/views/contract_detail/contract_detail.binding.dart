import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/contract_detail/contract_detail.controller.dart';

class ContractDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut(() => UserRepo(Get.find()));
    Get.lazyPut(() => ContractDetailController());
  }
}
