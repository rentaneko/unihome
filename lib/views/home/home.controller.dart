import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class HomeController extends GetxController {
  //
  var invoice = Invoice().obs;
  var isLoading = true.obs;
  var renter = Renter().obs;

  late SharedPreferences _preferences;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getRenterProfile(),
        getDueDateInvoice(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  Future<void> getRenterProfile() async {
    _userRepo.getRenterProfile().then(
      (value) {
        if (value != null) {
          renter.value = value;
        } else {
          showToast('BUG!!!');
        }
      },
    );
  }

  Future<void> getDueDateInvoice() async {
    await _userRepo.getDueDateInvoice().then((value) {
      if (value != null) {
        invoice.value = value;
      } else {
        showToast('BUG!!!');
      }
    });
  }

  Future<void> callNumber() async {
    await FlutterPhoneDirectCaller.callNumber(invoice.value.admin!.phone!);
  }
}
