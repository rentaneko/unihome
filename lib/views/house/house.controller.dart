import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/rental.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class HouseController extends GetxController {
  var isLoading = true.obs;
  var rental = Rental().obs;

  final _userRepo = Get.find<UserRepo>();

  late SharedPreferences _preferences;

  @override
  void onInit() {
    getRentalDetail();
    super.onInit();
  }

  Future<void> getRentalDetail() async {
    _preferences = await SharedPreferences.getInstance();
    await _userRepo
        .getRentalDetail(_preferences.getString(USER_ID)!)
        .then((value) {
      if (value != null) {
        rental.value = value;
        isLoading.value = false;
      } else {
        showToast('BUG!!!!');
      }
    });
  }
}
