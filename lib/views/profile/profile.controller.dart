import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class ProfileController extends GetxController {
  //
  late SharedPreferences _preferences;

  var isLoading = true.obs;
  var renter = Renter().obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getRenterProfile();
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
        isLoading.value = false;
      },
    );
  }

  Future<void> editRenterProfile() async {
    _preferences = await SharedPreferences.getInstance();
    Get.log(
        '[ID RENTER] =================== ${_preferences.getString(USER_ID)!}');
    await _userRepo.editProfileRenter(_preferences.getString(USER_ID)!);
  }
}
