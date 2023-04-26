import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/technician.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/utils/metric.dart';

class ProfileTechController extends GetxController {
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
  var renter = Technician().obs;
  var isEditing = false.obs;
  var isVisible = false.obs;
  var _image;
  File? avatar;

  final _userRepo = Get.find<UserRepo>();
  final editFormKey = GlobalKey<FormState>();
  final changePassFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    Future.wait(
      [
        getProfile(),
      ],
    ).then((value) => isLoading.value = false);
    super.onInit();
  }

  Future<void> editProfile() async {
    showLoading('Đang cập nhật thông tin');
    await _userRepo
        .editProfileTech(
      email: emailCtrl.text,
      phone: phoneCtrl.text,
      fullname: fullnameCtrl.text,
      address: addressCtrl.text,
    )
        .then(
      (value) {
        if (value) {
          hideLoading();
          isEditing.value = false;
          showToast('Cập nhật thông tin thành công');
        } else {
          hideLoading();
          showToast('Cập nhật thông tin không thành công');
        }
      },
    );
  }

  Future<void> getProfile() async {
    _userRepo.getTechProfile().then(
      (value) {
        if (value != null) {
          renter.value = value;
          emailCtrl.text = renter.value.email!;
          phoneCtrl.text = renter.value.phone!;
          fullnameCtrl.text = renter.value.fullname!;
          addressCtrl.text = renter.value.address!;
          Get.log('AVATAR ================ ${renter.value.imageUrl}');
        } else {
          showToast('BUG!!!');
        }
        isLoading.value = false;
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
    await _userRepo.uploadAvatar(_image).then((_) => getProfile());
  }

  Future pickImage(ImageSource source) async {
    try {
      final tmp = await ImagePicker().pickImage(source: source);
      if (tmp == null) return;
      _image = File(tmp.path);
      uploadImage();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> changePassword() async {
    await _userRepo
        .changePasswordTech(
      password: passCtrl.text.trim(),
      confirm: confirmCtrl.text.trim(),
      oldPass: oldPassCtrl.text.trim(),
    )
        .then(
      (value) {
        if (value == 'Mật khẩu đã được cập nhật') {
          showToast(
              'Thay đổi mật khẩu thành công\nBạn vui lòng đăng nhập lại tài khoản');
          Future.delayed(
            const Duration(seconds: 2),
            () => goToAndRemoveAll(screen: ROUTE_SPLASH),
          );
        } else {
          showToast(value.toString());
        }
      },
    );
  }
}
