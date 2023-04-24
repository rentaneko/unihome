import 'package:get/get.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';

class TicketTechController extends GetxController {
  var isLoading = true.obs;
  var listTicket = <Ticket>[].obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getListTicket(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  Future<void> getListTicket() async {
    await _userRepo.getListTicket().then((value) {
      if (value != null) {
        listTicket.value = value;
      }
    });
  }
}
