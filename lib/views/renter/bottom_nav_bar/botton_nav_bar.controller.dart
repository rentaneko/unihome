import 'package:get/get.dart';
import 'package:unihome/views/renter/invoices/invoice.controller.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;
  final _invoiceController = Get.find<InvoiceController>();
  final _ticketController = Get.find<TicketController>();

  void changeTab(int value) {
    if (value == 2) {
      _invoiceController.getListInvoiceByRenterId();
    }
    if (value == 3) {
      _ticketController.getListTicket();
    }

    selectedIndex.value = value;
  }
}
