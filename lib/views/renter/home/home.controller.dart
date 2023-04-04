import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class HomeController extends GetxController {
  //
  var contract = Contract().obs;
  var isLoading = true.obs;
  var renter = Renter().obs;

  late SharedPreferences _preferences;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getRenterProfile(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  Future<void> getRenterProfile() async {
    _preferences = await SharedPreferences.getInstance();
    _userRepo.getRenterProfile(_preferences.getString(USER_ID)!).then(
      (value) {
        if (value != null) {
          renter.value = value;
        } else {
          showToast('BUG!!!');
        }
      },
    );
  }
}
