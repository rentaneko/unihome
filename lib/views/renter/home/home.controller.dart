import 'package:get/get.dart';
import 'package:unihome/repositories/models/rental.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  //
  var isLoading = true.obs;
  var renter = Renter().obs;
  var basicRental = BasicRental().obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getRenterProfile(),
        getBasicRental(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  Future<void> getRenterProfile() async {
    _userRepo.getRenterProfile().then(
      (value) {
        if (value != null) {
          renter.value = value;
        } else {
          showToast('BUG!!!');
        }
      },
    );
  }

  Future<void> getBasicRental() async {
    await _userRepo.getBasicRental().then((value) {
      if (value != null) {
        basicRental.value = value;
      } else {
        showToast('BUG!!!');
      }
    });
  }

  Future<void> openUrl() async {
    final Uri url = Uri.parse('https://vinflat.myouri.cyou/');
    await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
