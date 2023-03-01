import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/views/profile/profile.controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Column(
                children: [
                  Text('[ID] ========== ${controller.renter.value.id}'),
                  Text(
                      '[USERNAME] ========== ${controller.renter.value.username}'),
                  Text('[EMAIL] ========== ${controller.renter.value.email}'),
                  Text('[PHONE] ========== ${controller.renter.value.phone}'),
                  Text(
                      '[FULLNAME] ========== ${controller.renter.value.fullname}'),
                  Text(
                      '[BIRTHDATE] ========== ${controller.renter.value.birthdate}'),
                  Text('[STATUS] ========== ${controller.renter.value.status}'),
                  Text(
                      '[CITIZENNUMBER] ========== ${controller.renter.value.citizenNumber}'),
                  Text(
                      '[CITIZENIMAGE] ========== ${controller.renter.value.citizenImageUrl}'),
                  Text(
                      '[ADDRESS] ========== ${controller.renter.value.address}'),
                  Text('[GENDER] ========== ${controller.renter.value.gender}'),
                ],
              ),
      ),
    );
  }
}
