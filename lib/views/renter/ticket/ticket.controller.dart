import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class TicketController extends GetxController {
  TextEditingController ticketName = TextEditingController();
  TextEditingController ticketDesc = TextEditingController();

  File? img;
  late SharedPreferences _preferences;

  var ticketType = 0.obs;
  var isLoading = true.obs;
  var listTicket = <Ticket>[].obs;
  var listTicketSend = <Ticket>[].obs;
  var listTicketProcess = <Ticket>[].obs;
  var listTicketDone = <Ticket>[].obs;
  var listTicketType = <TicketType>[].obs;
  var selectedType = TicketType().obs;
  var fileImagePath = 'no-image'.obs;
  var _image;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getListTicket(),
        getTicketType(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  @override
  void onClose() {
    ticketName.dispose();
    ticketDesc.dispose();
    super.onClose();
  }

  Future<void> getListTicket() async {
    await _userRepo.getListTicket().then((value) {
      if (value != null) {
        listTicket.value = value;
        for (var e in listTicket) {
          if (e.status!.toLowerCase() == 'active') {
            listTicketSend.add(e);
          }
          if (e.status!.toLowerCase() == 'processing') {
            listTicketProcess.add(e);
          }
          if (e.status!.toLowerCase() == 'completed') {
            listTicketDone.add(e);
          }
        }
      }
    });
  }

  Future<void> requestTicket() async {
    _preferences = await SharedPreferences.getInstance();
    await _userRepo
        .requestTicket(
      _preferences.getString(USER_ID)!,
      ticketName.text.trim(),
      ticketDesc.text.trim(),
      selectedType.value.id!,
    )
        .then(
      (value) {
        if (value == true) {
          ticketName.clear();
          ticketDesc.clear();
          selectedType.value = listTicketType[0];
          getListTicket();
          goBack();
          showToast('SUCCESSFUL');
        } else {
          showToast('BUG!!!');
        }
      },
    );
  }

  Future<void> getTicketType() async {
    await _userRepo.getTicketType().then(
          (value) => {
            if (value != null)
              {
                listTicketType.value = value,
                selectedType.value = listTicketType[0],
              }
            else
              {
                showToast('BUG!!!!'),
              }
          },
        );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      img = File(image.path);
      fileImagePath.value = img!.path;
      _image = img;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage() async {
    await _userRepo.uploadFile(_image);
  }
}
