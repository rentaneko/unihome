import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/views/renter/service/service.controller.dart';

class ServiceScreen extends GetWidget<ServiceController> {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  itemCount: controller.listService.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      value: false,
                      onChanged: (bool? value) {},
                      title: Text('${controller.listService[index].name}'),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
