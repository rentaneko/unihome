import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';
import 'package:expandable/expandable.dart';
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
                appBar: AppBar(
                  backgroundColor: AppColor.white,
                  elevation: 2,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () => goToAndRemoveAll(screen: ROUTE_HOME),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.black,
                      size: responsiveFont(18),
                    ),
                  ),
                  title: Text(
                    'Hồ sơ',
                    style: TextStyle(
                      color: AppColor.blackText,
                      fontSize: responsiveFont(24),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: responsiveHeight(36)),
                      Center(child: _avatarBlock()),
                      SizedBox(height: responsiveHeight(36)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: const Divider(
                            color: AppColor.gray300, thickness: 1),
                      ),
                      ExpandablePanel(
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
                                color: AppColor.darkBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/icons/user.png',
                                  color: AppColor.white),
                            ),
                            Text(
                              'Thông tin cá nhân',
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: const Divider(
                            color: AppColor.grayBorder, thickness: 1),
                      ),
                      ExpandablePanel(
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
                                color: AppColor.darkBlue,
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: const Divider(
                            color: AppColor.grayBorder, thickness: 1),
                      ),
                      InkWell(
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
                                color: AppColor.darkBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.exit_to_app,
                                  color: AppColor.white,
                                  size: responsiveFont(20)),
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _changePasswordBlock() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(12)),
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
          Text(
            'Mật khẩu mới',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: responsiveHeight(10)),
          TextFormField(
            controller: controller.passCtrl,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.price),
              ),
              prefixIcon: Image.asset(
                'assets/icons/new-pass.png',
                color: AppColor.primary,
              ),
              focusColor: AppColor.primary,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.price),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.primary),
              ),
              filled: true,
              fillColor: AppColor.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.grayBorder),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(14)),
          Text(
            'Xác nhận lại mật khẩu mới',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: responsiveHeight(10)),
          TextFormField(
            controller: controller.confirmCtrl,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.price),
              ),
              prefixIcon: Image.asset(
                'assets/icons/repeat.png',
                color: AppColor.primary,
              ),
              focusColor: AppColor.primary,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.price),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.primary),
              ),
              filled: true,
              fillColor: AppColor.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: AppColor.grayBorder),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(16)),
          button('Xác nhận', () => controller.changePassword()),
        ],
      ),
    );
  }

  Widget _buildInformationBlock() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(12)),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(16),
      ),
      decoration: BoxDecoration(
        color: AppColor.lightBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
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
            value: '${controller.renter.value.gender}',
          ),
          const Divider(color: AppColor.grayLight, thickness: 1),
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
        SizedBox(height: responsiveHeight(4)),
        Text(
          '${controller.renter.value.email}',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            color: AppColor.grayText,
            fontSize: responsiveFont(16),
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
}
