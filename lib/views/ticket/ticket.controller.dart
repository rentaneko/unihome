import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class TicketController extends GetxController {
  TextEditingController ticketDesc = TextEditingController();

  var isLoading = true.obs;
  var listTicket = <Ticket>[].obs;
  var listTicketType = <TicketType>[].obs;
  var selectedType = TicketType().obs;
  var imageList = <File>[].obs;

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
    ticketDesc.dispose();
    super.onClose();
  }

  Future<void> getListTicket() async {
    await _userRepo.getListTicket().then((value) {
      if (value != null) {
        listTicket.value = value;
      }
    });
  }

  Future<void> requestTicket() async {
    await _userRepo
        .requestTicket(
      images: imageList,
      ticketDesc: ticketDesc.text.trim(),
      type: selectedType.value.id!,
    )
        .then(
      (value) {
        if (value == true) {
          ticketDesc.clear();
          selectedType.value = listTicketType[0];
          imageList.clear();
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
      final List<XFile> pickedList = await ImagePicker().pickMultiImage();
      imageList.clear();
      if (pickedList.length > 3) {
        showToast('Bạn chỉ được chọn tối đa 3 bức ảnh');
        pickedList.clear();
      } else {
        pickedList.forEach((element) {
          imageList.add(File(element.path));
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
