import 'package:get/get.dart';
import 'package:unihome/repositories/models/service.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class ServiceController extends GetxController {
  //
  var isLoading = true.obs;
  var listService = <Services>[].obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    getListService();
    super.onInit();
  }

  Future<void> getListService() async {
    await _userRepo.getListService().then((value) {
      if (value != null) {
        listService.value = value;
      } else {
        showToast('BUG!!!');
      }
      isLoading.value = false;
    });
  }
}
