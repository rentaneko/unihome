import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';

class TicketDetailTechController extends GetxController {
  var ticket = getArgument() as Ticket;

  TextEditingController desc = TextEditingController();
  var imageList = <File>[].obs;

  final _userRepo = Get.find<UserRepo>();

  @override
  void onInit() {
    desc.text = ticket.desc.toString();

    super.onInit();
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

  Future<void> acceptTicket() async {
    await _userRepo.acceptTicketTech(ticket.id.toString()).then(
      (value) {
        if (value == 'true') {
          showToast('Successful');
        } else {
          showToast(value.toString());
        }
      },
    );
  }

  Future<void> solveTicket() async {
    await _userRepo.solveTicketTech(ticket.id.toString()).then(
      (value) {
        if (value == 'true') {
          showToast('Successful');
        } else {
          showToast(value.toString());
        }
      },
    );
  }
}
