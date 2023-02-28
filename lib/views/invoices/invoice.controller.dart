import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class InvoiceController extends GetxController {
  //
  var isLoading = true.obs;
  var invoice = Invoice().obs;

  late SharedPreferences _preferences;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getListInvoiceByRenterId();
    super.onInit();
  }

  Future<void> getListInvoiceByRenterId() async {
    _preferences = await SharedPreferences.getInstance();
    await _userRepo
        .getListInvoiceByRenterId(_preferences.getString(USER_ID)!, '3')
        .then((value) {
      if (value != null) {
        invoice.value = value;
      } else {
        showToast('BUG!!!');
      }
      isLoading.value = false;
    });
  }
}
