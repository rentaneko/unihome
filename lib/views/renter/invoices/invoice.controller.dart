import 'package:get/get.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class InvoiceController extends GetxController {
  //

  var listInvoice = <Invoice>[].obs;
  var isLoading = true.obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getListInvoiceByRenterId();
    super.onInit();
  }

  Future<void> getListInvoiceByRenterId() async {
    await _userRepo.getListInvoice().then((value) {
      if (value != null) {
        listInvoice.value = value;
      } else {
        showToast('BUG!!!');
      }
      isLoading.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
