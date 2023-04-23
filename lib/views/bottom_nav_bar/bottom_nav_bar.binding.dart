import 'package:get/get.dart';
import 'package:unihome/views/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/home/home.controller.dart';
import 'package:unihome/views/house/house.controller.dart';
import 'package:unihome/views/invoices/invoice.controller.dart';
import 'package:unihome/views/ticket/ticket.controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(HouseController(), permanent: true);
    Get.put(InvoiceController(), permanent: true);
    Get.put(TicketController(), permanent: true);
    Get.put(BottomNavBarController());
  }
}
