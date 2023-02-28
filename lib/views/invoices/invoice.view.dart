import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/invoices/invoice.controller.dart';

class InvoiceScreen extends GetWidget<InvoiceController> {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/logos/logo-2.png'),
                    Column(
                      children: [
                        Text(
                            'InvoiceId ==================== ${controller.invoice.value.id}'),
                        Text(
                            'Name ==================== ${controller.invoice.value.name}'),
                        Text(
                            'Amount ==================== ${controller.invoice.value.amount}'),
                        Text(
                            'Status ==================== ${controller.invoice.value.status}'),
                        Text(
                            'Detail ==================== ${controller.invoice.value.detail}'),
                        Text(
                            'RenterId ==================== ${controller.invoice.value.renterId}'),
                        Text(
                            'Username ==================== ${controller.invoice.value.renter!.username}'),
                        Text(
                            'Email ==================== ${controller.invoice.value.renter!.email}'),
                        Text(
                            'MajorName ==================== ${controller.invoice.value.renter!.major!.name}'),
                        Text(
                            'UniversityName ==================== ${controller.invoice.value.renter!.university!.name}'),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
