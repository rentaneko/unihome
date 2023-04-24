import 'package:get/get.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class ContractController extends GetxController {
  var contract = <Contract>[].obs;
  var isLoading = true.obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getListContract();
    super.onInit();
  }

  Future<void> getListContract() async {
    await _userRepo.getListContract().then((value) {
      if (value != null) {
        contract.value = value;
      } else {
        showToast('BUG !!!!!');
      }
      isLoading.value = false;
    });
  }
}
