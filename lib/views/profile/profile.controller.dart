import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/utils/metric.dart';

class ProfileController extends GetxController {
  //
  late SharedPreferences _preferences;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController fullnameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController universityCtrl = TextEditingController();
  TextEditingController majorCtrl = TextEditingController();

  var isLoading = true.obs;
  var renter = Renter().obs;
  var isEditing = false.obs;
  var birthdate = DateTime.now();

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
          emailCtrl.text = renter.value.email!;
          phoneCtrl.text = renter.value.phone!;
          fullnameCtrl.text = renter.value.fullname!;
          addressCtrl.text = renter.value.address!;
          universityCtrl.text = renter.value.universityId.toString();
          majorCtrl.text = renter.value.majorId.toString();
        } else {
          showToast('BUG!!!');
        }
        isLoading.value = false;
      },
    );
  }

  Future<void> editRenterProfile() async {
    _preferences = await SharedPreferences.getInstance();
    isLoading.value = true;
    await _userRepo
        .editProfileRenter(
          _preferences.getString(USER_ID)!,
          emailCtrl.text.trim(),
          phoneCtrl.text.trim(),
          fullnameCtrl.text.trim(),
          addressCtrl.text.trim(),
          int.parse(universityCtrl.text.trim().toString()),
          int.parse(majorCtrl.text.trim().toString()),
        )
        .then(
          (value) => {
            if (value == true)
              {
                getRenterProfile(),
                isEditing.value = false,
              }
            else
              {showToast('BUG!!!!')},
            isLoading.value = false,
          },
        );
  }

  Future<void> logOut() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove(USER_ID);
    _preferences.remove(TOKEN);
    goToAndRemoveAll(screen: ROUTE_LOGIN);
  }
}
