import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';
import 'package:expandable/expandable.dart';
import 'package:unihome/views/renter/profile/profile.controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.main,
        appBar: AppBar(
          backgroundColor: AppColor.main,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => goBack(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.white,
              size: responsiveFont(18),
            ),
          ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: responsiveHeight(14)),
          TextFormField(
            controller: controller.oldPassCtrl,
            obscureText: controller.isVisible.value ? false : true,
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
          button('Xác nhận', () => controller.changePassword()),
        ],
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
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField((value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng nhập email của bạn';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Địa chỉ email không hợp lệ';
                    }
                    return null;
                  }, ctrl: controller.emailCtrl),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField((value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
                    } else if (!value.isPhoneNumber) {
                      return 'Số điện thoại không hợp lệ';
                    } else if (value.length != 10) {
                      return 'Số điện thoại không hợp lệ';
                    }
                    return null;
                  }, ctrl: controller.phoneCtrl),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField(
                    (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập ngày sinh';
                      } else if (!GetUtils.hasMatch(
                          value, '\\d{2}/\\d{2}/\\d{4}')) {
                        return 'Vui lòng nhập đúng định dạng dd/MM/yyyy';
                      }
                      return null;
                    },
                    ctrl: controller.birthdateCtrl,
                  ),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  _buildRowTextField((value) {
                    return null;
                  }, ctrl: controller.addressCtrl),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  SizedBox(height: responsiveHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: controller.gender.value == 'nam'
                              ? null
                              : () => controller.gender.value = 'nam',
                          icon: Icon(
                            Icons.male,
                            color: controller.gender.value == 'nam'
                                ? AppColor.main
                                : AppColor.gray800,
                          ),
                          label: Text(
                            'Nam',
                            style: TextStyle(
                              fontWeight: controller.gender.value == 'nam'
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                              color: controller.gender.value == 'nam'
                                  ? AppColor.main
                                  : AppColor.gray800,
                              fontSize: responsiveFont(14),
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.white,
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: controller.gender.value == 'nam'
                                      ? AppColor.main
                                      : AppColor.gray800),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            disabledBackgroundColor: AppColor.white,
                          ),
                        ),
                      ),
                      SizedBox(width: responsiveWidth(24)),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: controller.gender.value == 'nữ'
                              ? null
                              : () => controller.gender.value = 'nữ',
                          icon: Icon(
                            Icons.female,
                            color: controller.gender.value == 'nữ'
                                ? AppColor.main
                                : AppColor.gray800,
                          ),
                          label: Text(
                            'Nữ',
                            style: TextStyle(
                              fontWeight: controller.gender.value == 'nữ'
                                  ? FontWeight.w400
                                  : FontWeight.w500,
                              color: controller.gender.value == 'nữ'
                                  ? AppColor.main
                                  : AppColor.gray800,
                              fontSize: responsiveFont(14),
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.white,
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: controller.gender.value == 'nữ'
                                    ? AppColor.main
                                    : AppColor.gray800,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            disabledBackgroundColor: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColor.grayLight, thickness: 1),
                  button(
                    'Xác nhận',
                    () {
                      if (controller.editFormKey.currentState!.validate()) {
                        controller.editRenterProfile();
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
                  title: 'Ngày sinh',
                  value: Jiffy('${controller.renter.value.birthdate}')
                      .format('dd/MM/yyyy'),
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
                  value: controller.renter.value.gender == 'nam' ? 'Nam' : 'Nữ',
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
            fontFamily: 'SF Pro Display',
            color: AppColor.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: responsiveFont(16),
            fontWeight: FontWeight.w500,
            color: AppColor.black,
            fontFamily: 'SF Pro Display',
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
