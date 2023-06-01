import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/rental.model.dart';
import 'package:unihome/repositories/models/service.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class HouseController extends GetxController {
  var isLoading = true.obs;
  var rental = Rental().obs;
  var listService = <Services>[].obs;

  final _userRepo = Get.find<UserRepo>();

  late SharedPreferences _preferences;

  @override
  void onInit() {
    Future.wait(
      [
        getRentalDetail(),
        getListServices(),
      ],
    ).then((_) {
      isLoading.value = false;
    });

    super.onInit();
  }

  Future<void> getRentalDetail() async {
    _preferences = await SharedPreferences.getInstance();
    await _userRepo
        .getRentalDetail(_preferences.getString(USER_ID)!)
        .then((value) {
      if (value != null) {
        rental.value = value;
      } else {
        showToast('BUG!!!!');
      }
    });
  }

  Future<void> getListServices() async {
    await _userRepo.getListService().then(
      (value) {
        if (value != null) {
          listService.value = value;
        } else {
          showToast('BUG!!!!');
        }
      },
    );
  }

  Future<void> addService() async {
    await _userRepo
        .addService(listService
            .map((element) => int.parse(element.serviceId.toString()))
            .toList())
        .then((value) {
      listService.forEach((service) {
        rental.value.listService!.forEach((rental) {
          service.checked = false;
        });
      });
      goBack();
      showToast('Đăng ký dịch vụ thành công');
    });
  }
}
