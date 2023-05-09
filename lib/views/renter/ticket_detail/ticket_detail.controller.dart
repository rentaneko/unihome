import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/utils/metric.dart';

class TicketDetailController extends GetxController {
  var id = getArgument() as int;
  var ticket = Ticket().obs;
  var isLoading = true.obs;

  TextEditingController desc = TextEditingController();
  var imageList = <File>[].obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    Future.wait(
      [
        getTicketDetail(),
      ],
    ).then((_) => isLoading.value = false);

    super.onInit();
  }

  Future<void> getTicketDetail() async {
    await _userRepo.getTicketDetail(id.toString()).then(
      (value) {
        if (value != null) {
          ticket.value = value;
          desc.text = ticket.value.desc.toString();
        }
      },
    );
  }

  Future<void> acceptTicket() async {
    await _userRepo.acceptTicket(ticket.value.id.toString()).then((value) {
      if (value == 'true') {
        showToast('Xác nhận yêu cầu thành công');
        goToAndRemoveAll(screen: ROUTE_NAV_BAR);
      } else {
        showToast(value.toString());
      }
    });
  }

  Future<void> deleteTicket() async {
    await _userRepo.deleteTicket(ticket.value.id.toString()).then((value) {
      if (value == 'true') {
        showToast('Xoá yêu cầu thành công');
        goBack();
      } else {
        showToast(value.toString());
      }
    });
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
