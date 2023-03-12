import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/profile/profile.controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: IconButton(
                                onPressed: () => goBack(),
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: AppColor.white),
                              ),
                              minLeadingWidth: responsiveWidth(60),
                              title: Text(
                                'THÔNG TIN CƠ BẢN',
                                style: TextStyle(
                                  fontSize: responsiveFont(22),
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: responsiveHeight(128),
                              width: responsiveWidth(128),
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/icons/user-2.png'),
                                    minRadius: 100,
                                  ),
                                  Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/icons/change-avatar.png',
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: responsiveHeight(16)),
                            Text(
                              '${controller.renter.value.fullname}',
                              style: TextStyle(
                                fontSize: responsiveFont(20),
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsiveHeight(10)),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16),
                          ),
                          child: _buildInformationBlock()),
                      ListTile(
                        leading: Text(
                          'Đổi mật khẩu',
                          style: TextStyle(
                            fontSize: responsiveFont(16),
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: AppColor.black),
                      ),
                      ListTile(
                        onTap: () => controller.logOut(),
                        leading: Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: responsiveFont(16),
                            color: AppColor.price,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.exit_to_app_outlined,
                          color: AppColor.price,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildInformationBlock() {
    return Column(
      children: [
        _buildRow(
          title: 'Username',
          value: '${controller.renter.value.username}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Email',
          value: '${controller.renter.value.email}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Số điện thoại',
          value: '${controller.renter.value.phone}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Ngày sinh',
          value: '${controller.renter.value.birthdate}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Số CMND',
          value: '${controller.renter.value.citizenNumber}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Địa chỉ',
          value: '${controller.renter.value.address}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Giới tính',
          value: '${controller.renter.value.gender}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Ngành',
          value: '${controller.renter.value.major!.name}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
        SizedBox(height: responsiveHeight(10)),
        _buildRow(
          title: 'Đại học',
          value: '${controller.renter.value.university!.name}',
        ),
        const Divider(color: AppColor.grayLight, thickness: 1),
      ],
    );
  }

  Widget _buildRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w400,
            color: AppColor.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w500,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}
