import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/home/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Column(
                children: [
                  Image.asset('assets/logos/logo-2.png'),
                  Text('ContractId ========= ${controller.contract.value.id}'),
                  Text(
                      'ContractName ========= ${controller.contract.value.name}'),
                  Text(
                      'DateSigned ========= ${controller.contract.value.dateSigned}'),
                  Text(
                      'StartDate ========= ${controller.contract.value.startDate}'),
                  Text(
                      'Description ========= ${controller.contract.value.description}'),
                  Text(
                      'LastUpdated ========= ${controller.contract.value.lastUpdated}'),
                  Text(
                      'PriceForWater ========= ${controller.contract.value.priceForWater}'),
                  Text(
                      'PriceForElectricity ========= ${controller.contract.value.priceForElectricity}'),
                  Text(
                      'PriceForService ========= ${controller.contract.value.priceForService}'),
                  Text(
                      'ContractStatus ========= ${controller.contract.value.status}'),
                  Text(
                      'ImageUrl ========= ${controller.contract.value.imageUrl}'),
                  Text(
                      'PriceForRent ========= ${controller.contract.value.priceForRent}'),
                ],
              ),
      ),
    );
  }
}
