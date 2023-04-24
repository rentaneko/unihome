import 'package:get/get.dart';
import 'package:unihome/views/renter/bottom_nav_bar/botton_nav_bar.controller.dart';
import 'package:unihome/views/renter/home/home.controller.dart';
import 'package:unihome/views/renter/house/house.controller.dart';
import 'package:unihome/views/renter/invoices/invoice.controller.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(HouseController());
    Get.put(InvoiceController());
    Get.put(TicketController());
    Get.put(BottomNavBarController());
  }
}
