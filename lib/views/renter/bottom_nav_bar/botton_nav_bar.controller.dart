import 'package:get/get.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/invoices/invoice.controller.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;
  final _invoiceController = Get.find<InvoiceController>();
  final _ticketController = Get.find<TicketController>();

  void changeTab(int value) {
    var args = getArgument();
    if (args != null) {
      Get.log('[INDEX] ========= $args');
      selectedIndex.value = args;
    }
    if (value == 2) {
      _invoiceController.getListInvoiceByRenterId();
    }
    if (value == 3) {
      _ticketController.getListTicket();
    }

    selectedIndex.value = value;
  }
}
