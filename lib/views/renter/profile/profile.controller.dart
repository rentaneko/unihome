import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  // change pw
  TextEditingController oldPassCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmCtrl = TextEditingController();

  var isLoading = true.obs;
  var renter = Renter().obs;
  var isEditing = false.obs;
  var isVisible = false.obs;
  var birthdate = DateTime.now();
  var _image;

  File? avatar;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getRenterProfile();
    super.onInit();
  }

  Future<void> getRenterProfile() async {
    _userRepo.getRenterProfile().then(
      (value) {
        if (value != null) {
          renter.value = value;
          emailCtrl.text = renter.value.email!;
          phoneCtrl.text = renter.value.phone!;
          fullnameCtrl.text = renter.value.fullname!;
          addressCtrl.text = renter.value.address!;
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
    goToAndRemoveAll(screen: ROUTE_SPLASH);
  }

  Future<void> uploadImage() async {
    await _userRepo.uploadFile(_image).then((_) => getRenterProfile());
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      _image = File(image.path);
      uploadImage();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> changePassword() async {
    await _userRepo
        .changePasswordRenter(
      password: passCtrl.text.trim(),
      confirm: confirmCtrl.text.trim(),
      oldPass: oldPassCtrl.text.trim(),
    )
        .then(
      (value) {
        if (value == '') {
          showToast(
              'Thay đổi mật khẩu thành công\nBạn vui lòng đăng nhập lại tài khoản');
          Future.delayed(
            const Duration(seconds: 2),
            () => goToAndRemoveAll(screen: ROUTE_SPLASH),
          );
        } else {
          showToast('Mật khẩu không khớp với nhau');
        }
      },
    );
  }
}
