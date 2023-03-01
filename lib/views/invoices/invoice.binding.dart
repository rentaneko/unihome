import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/invoices/invoice.controller.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut(() => UserRepo(Get.find()));
    Get.lazyPut(() => InvoiceController(), fenix: true);
  }
}