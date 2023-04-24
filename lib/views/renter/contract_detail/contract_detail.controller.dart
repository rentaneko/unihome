import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class ContractDetailController extends GetxController {
  var args = getArgument();
  var contract = ContractDetail().obs;
  var isLoading = true.obs;

  late SharedPreferences _preferences;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getContractDetail();
    super.onInit();
  }

  Future<void> getContractDetail() async {
    _preferences = await SharedPreferences.getInstance();
    await _userRepo
        .getContractByRenterId(
      contractId: args.toString(),
      idRenter: _preferences.getString(USER_ID)!,
    )
        .then(
      (value) {
        if (value != null) {
          contract.value = value;
          Get.log('Check =================== ${contract.value.imageUrls}');
        } else {
          showToast('BUG!!!!');
        }
        isLoading.value = false;
      },
    );
  }
}
