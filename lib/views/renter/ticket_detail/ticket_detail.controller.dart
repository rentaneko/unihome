import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/repos/user.repo.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class TicketDetailController extends GetxController {
  var id = getArgument() as int;
  var ticket = Ticket().obs;
  var isLoading = true.obs;
  var isEditing = false.obs;

  TextEditingController desc = TextEditingController();
  TextEditingController name = TextEditingController();

  var imageList = <XFile>[].obs;

  final _userRepo = Get.find<UserRepo>();

  final ticketController = Get.find<TicketController>();

  final form = GlobalKey<FormState>();

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
          name.text = ticket.value.name.toString();
        }
      },
    );
  }

  Future<void> acceptTicket() async {
    await _userRepo.acceptTicket(ticket.value.id.toString()).then((value) {
      if (value == 'true') {
        ticketController.getListTicket().then((_) {
          showToast('Xác nhận yêu cầu thành công');
          goBack();
        });
      } else {
        showToast(value.toString());
      }
    });
  }

  Future<void> deleteTicket() async {
    await _userRepo.deleteTicket(ticket.value.id.toString()).then((value) {
      if (value == 'true') {
        ticketController.getListTicket().then((_) {
          showToast('Xoá yêu cầu thành công');
          goBack();
        });
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
        imageList.value = pickedList;
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> editTicket() async {
    isLoading.value = true;
    await _userRepo
        .editTicket(
      ticketDesc: desc.text,
      ticketId: ticket.value.id.toString(),
      type: ticket.value.ticketType!.id!,
      ticketName: name.text,
      images: imageList,
    )
        .then((value) {
      if (value) {
        getTicketDetail();
        showToast('Chỉnh sửa yêu cầu thành công');
        ticketController.getListTicket();
        isEditing.value = false;
      } else {
        showToast('Có lỗi trong lúc kết nối với server');
      }
      isLoading.value = false;
    });
  }
}
