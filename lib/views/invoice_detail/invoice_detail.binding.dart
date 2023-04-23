import 'package:get/get.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/views/invoice_detail/invoice_detail.controller.dart';

class InvoiceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.put(UserRepo(Get.find()));
    Get.put(InvoiceDetailController());
  }
}
