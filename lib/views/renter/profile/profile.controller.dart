import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
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
  TextEditingController birthdateCtrl = TextEditingController();

  // change pw
  TextEditingController oldPassCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmCtrl = TextEditingController();

  var isLoading = true.obs;
  var renter = Renter().obs;
  var isEditing = false.obs;
  var isVisible = false.obs;
  var gender = ''.obs;
  var _image;

  File? avatar;

  final _userRepo = Get.find<UserRepo>();
  final editFormKey = GlobalKey<FormState>();
  final changePwFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    Future.wait(
      [getRenterProfile()],
    );
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
          birthdateCtrl.text =
              Jiffy(renter.value.birthdate).format('dd/MM/yyyy');
          if (renter.value.gender!.toLowerCase() == 'nam') {
            gender.value = 'nam';
          } else if (renter.value.gender!.toLowerCase() == 'nữ') {
            gender.value = 'nữ';
          } else {
            gender.value = 'Chưa cập nhật';
          }
        } else {
          showToast('BUG!!!');
        }
        isLoading.value = false;
      },
    );
  }

  Future<void> editRenterProfile() async {
    _preferences = await SharedPreferences.getInstance();
    showLoading('Đang cập nhật thông tin');
    await _userRepo
        .editProfileRenter(
          email: emailCtrl.text.trim(),
          phone: phoneCtrl.text.trim(),
          fullname: fullnameCtrl.text.trim(),
          address: addressCtrl.text.trim(),
          birthday: birthdateCtrl.text.trim(),
          gender: gender.value.toLowerCase() == 'nam' ? 'nam' : 'nữ',
        )
        .then(
          (value) => {
            if (value == true)
              {
                getRenterProfile(),
                isEditing.value = false,
                hideLoading(),
              }
            else
              {
                showToast('BUG!!!!'),
              },
            hideLoading(),
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
