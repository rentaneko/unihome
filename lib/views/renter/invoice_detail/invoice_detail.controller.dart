import 'package:get/get.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class InvoiceDetailController extends GetxController {
  var isLoading = true.obs;
  var invoice = Invoice().obs;
  var invoiceId = getArgument();

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getInvoiceDetail(),
      ],
    ).then((_) => isLoading.value = false);
    super.onInit();
  }

  Future<void> getInvoiceDetail() async {
    await _userRepo.getIndvoiceDetail(invoiceId.toString()).then((value) {
      if (value != null) {
        invoice.value = value;
      } else {
        showToast('BUG!!!');
      }
    });
  }
}
