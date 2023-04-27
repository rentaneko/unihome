import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';
import 'package:expandable/expandable.dart';
import 'package:unihome/views/technician/profile_tech/profile_tech.controller.dart';

class ProfileTechScreen extends GetWidget<ProfileTechController> {
  const ProfileTechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.main,
        appBar: AppBar(
          backgroundColor: AppColor.main,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Hồ sơ',
            style: TextStyle(
              color: AppColor.white,
              fontSize: responsiveFont(24),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _body(),
                    Positioned(
                      top: responsiveHeight(25),
                      child: _avatarBlock(),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Container(
          height: responsiveHeight(100),
          color: AppColor.main,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: responsiveHeight(150)),
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  elevation: 1.5,
                  shadowColor: AppColor.darkness,
                  margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: responsiveHeight(responsiveHeight(8)),
                      bottom: responsiveHeight(responsiveHeight(8)),
                    ),
                    child: ExpandablePanel(
                      header: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: responsiveWidth(16),
                                right: responsiveWidth(12)),
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(10),
                              vertical: responsiveHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.main,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset('assets/icons/user.png',
                                color: AppColor.white),
                          ),
                          Text(
                            'Thông tin cá nhân chi tiết',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(16),
                              color: AppColor.darkBlue,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ],
                      ),
                      collapsed: const SizedBox(),
                      expanded: _buildInformationBlock(),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                Card(
                  elevation: 1.5,
                  shadowColor: AppColor.darkness,
                  margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: responsiveHeight(responsiveHeight(8)),
                      bottom: responsiveHeight(responsiveHeight(8)),
                    ),
                    child: ExpandablePanel(
                      header: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: responsiveWidth(16),
                                right: responsiveWidth(12)),
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(10),
                              vertical: responsiveHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.main,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset('assets/icons/setting.png',
                                color: AppColor.white),
                          ),
                          Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(16),
                              color: AppColor.darkBlue,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ],
                      ),
                      collapsed: const SizedBox(),
                      expanded: _changePasswordBlock(),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(12)),
                Card(
                  elevation: 1.5,
                  shadowColor: AppColor.darkness,
                  margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: responsiveHeight(responsiveHeight(8)),
                      bottom: responsiveHeight(responsiveHeight(8)),
                    ),
                    child: InkWell(
                      onTap: () => controller.logOut(),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: responsiveWidth(16),
                                right: responsiveWidth(12)),
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(10),
                              vertical: responsiveHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.main,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/icons/toggle-off-circle.png',
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            'Đăng xuất',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveFont(16),
                              color: AppColor.darkBlue,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _changePasswordBlock() {
    return Container(
      margin: EdgeInsets.only(
        right: responsiveWidth(12),
        left: responsiveWidth(12),
        top: responsiveHeight(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(16),
      ),
      decoration: BoxDecoration(
        color: AppColor.lightBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Form(
        key: controller.changePassFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsiveHeight(14)),
            TextFormField(
              controller: controller.oldPassCtrl,
              obscureText: controller.isVisible.value ? false : true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Vui lòng nhập mật khẩu hiện tại';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nhập mật khẩu hiện tại',
                hintStyle: TextStyle(
                  fontSize: responsiveFont(12),
                  color: AppColor.gray600,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: responsiveHeight(4),
                  horizontal: responsiveWidth(6),
                ),
                suffixIcon: IconButton(
                  onPressed: () =>
                      controller.isVisible.value = !controller.isVisible.value,
                  icon: controller.isVisible.value
                      ? const Icon(Icons.visibility, color: AppColor.main)
                      : const Icon(Icons.visibility_off),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusColor: AppColor.primary,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.primary),
                ),
                filled: true,
                fillColor: AppColor.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.grayBorder),
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(14)),
            TextFormField(
              controller: controller.passCtrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Vui lòng nhập mật khẩu mới';
                }
                return null;
              },
              obscureText: controller.isVisible.value ? false : true,
              decoration: InputDecoration(
                hintText: 'Nhập mật khẩu mới',
                hintStyle: TextStyle(
                  fontSize: responsiveFont(12),
                  color: AppColor.gray600,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: responsiveHeight(4),
                  horizontal: responsiveWidth(6),
                ),
                suffixIcon: IconButton(
                  onPressed: () =>
                      controller.isVisible.value = !controller.isVisible.value,
                  icon: controller.isVisible.value
                      ? const Icon(Icons.visibility, color: AppColor.main)
                      : const Icon(Icons.visibility_off),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusColor: AppColor.primary,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.primary),
                ),
                filled: true,
                fillColor: AppColor.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.grayBorder),
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(14)),
            TextFormField(
              controller: controller.confirmCtrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Vui lòng xác nhận mật khẩu mới';
                } else {
                  if (value != controller.passCtrl.text) {
                    return 'Mật khẩu mới không khớp';
                  }
                }
                return null;
              },
              obscureText: controller.isVisible.value ? false : true,
              decoration: InputDecoration(
                hintText: 'Nhập lại mật khẩu mới',
                hintStyle: TextStyle(
                  fontSize: responsiveFont(12),
                  color: AppColor.gray600,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: responsiveHeight(4),
                  horizontal: responsiveWidth(6),
                ),
                suffixIcon: IconButton(
                  onPressed: () =>
                      controller.isVisible.value = !controller.isVisible.value,
                  icon: controller.isVisible.value
                      ? const Icon(Icons.visibility, color: AppColor.main)
                      : const Icon(Icons.visibility_off),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusColor: AppColor.primary,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.price),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.primary),
                ),
                filled: true,
                fillColor: AppColor.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.grayBorder),
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(14)),
            button(
              'Xác nhận',
              () {
                if (controller.changePassFormKey.currentState!.validate()) {
                  controller.changePassword();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationBlock() {
    return Container(
      margin: EdgeInsets.only(
        right: responsiveWidth(12),
        left: responsiveWidth(12),
        top: responsiveHeight(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(16),
      ),
      decoration: BoxDecoration(
        color: AppColor.lightBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: controller.isEditing.value
          ? Form(
              key: controller.editFormKey,
              child: Column(
                children: [
                  _buildRowTextField(
                    ctrl: controller.fullnameCtrl,
                    (value) {
                      return null;
                    },
                  ),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField(ctrl: controller.emailCtrl, (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return 'Địa chỉ email không hợp lệ';
                    }
                    return null;
                  }),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField(ctrl: controller.phoneCtrl, (value) {
                    return null;
                  }),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField(ctrl: controller.addressCtrl, (value) {
                    return null;
                  }),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  button(
                    'Xác nhận',
                    () {
                      if (controller.editFormKey.currentState!.validate()) {
                        controller.editProfile();
                      }
                    },
                  ),
                ],
              ),
            )
          : Column(
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
                  title: 'Địa chỉ',
                  value: '${controller.renter.value.address}',
                ),
                const Divider(color: AppColor.grayLight, thickness: 1),
                button(
                    'Cập nhật',
                    () => controller.isEditing.value =
                        !controller.isEditing.value),
              ],
            ),
    );
  }

  Widget _avatarBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: responsiveHeight(150),
              width: responsiveWidth(150),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: controller.renter.value.imageUrl == null
                  ? ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/icons/user-2.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  : ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "${controller.renter.value.imageUrl}",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator.adaptive(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.gray100,
                  border: Border.all(color: AppColor.blackText),
                ),
                child: IconButton(
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight(10)),
        Text(
          '${controller.renter.value.fullname}',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            color: AppColor.blackText,
            fontSize: responsiveFont(24),
          ),
        ),
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

  Widget _buildRowTextField(String? Function(String?) validator,
      {required TextEditingController ctrl}) {
    return TextFormField(
      controller: ctrl,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(8),
          vertical: responsiveHeight(4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.grayBorder,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.main,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.price,
            width: 0.5,
          ),
        ),
        fillColor: AppColor.white,
        filled: true,
        hintText: ctrl.text,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: responsiveFont(14),
          color: AppColor.gray400,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }
}
