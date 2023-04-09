import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/dummy_data.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/renter/home/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.primary,
                  automaticallyImplyLeading: false,
                  leading: controller.renter.value.imageUrl == null
                      ? Padding(
                          padding: EdgeInsets.all(responsiveHeight(8)),
                          child: InkWell(
                            onTap: () => goTo(screen: ROUTE_PROFILE),
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: AppColor.white,
                                child: Image.asset('assets/icons/user.png'),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(responsiveHeight(8)),
                          child: InkWell(
                            onTap: () => goTo(screen: ROUTE_PROFILE),
                            child: ClipRRect(
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
                        ),
                  title: Text(
                    'VinFlat',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: responsiveFont(24),
                      color: AppColor.white,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/noti-fill.png'),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoBlock(),
                      _managerBlocl(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(16)),
                        child: Text(
                          'Tính năng',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackText,
                            fontSize: responsiveFont(18),
                          ),
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return _buildServiceComponent(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildServiceComponent(int index) {
    return InkWell(
      onTap: () => goTo(screen: serviceData[index]['route'].toString()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(20),
              vertical: responsiveHeight(20),
            ),
            decoration: BoxDecoration(
              color: AppColor.main,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(
              serviceData[index]['icon'].toString(),
              color: AppColor.white,
            ),
          ),
          SizedBox(height: responsiveHeight(8)),
          Text(
            '${serviceData[index]['title']}',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(16),
              color: AppColor.blackText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _managerBlocl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          child: Text(
            'Quản lí',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              color: AppColor.blackText,
              fontSize: responsiveFont(18),
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(12)),
        ListTile(
          leading: Container(
            height: responsiveHeight(42),
            width: responsiveWidth(42),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            child: Image.asset('assets/icons/user-2.png'),
          ),
          title: Text(
            'Louise Vuitton',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: responsiveFont(16),
              color: AppColor.blackText,
            ),
          ),
          subtitle: Text(
            '0901234567',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: responsiveFont(14),
              color: AppColor.grayText,
            ),
          ),
          trailing: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(responsiveHeight(6)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.grayBorder),
              ),
              child: Icon(Icons.phone),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoBlock() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hóa đơn đến hạn thanh toán',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(18),
              color: AppColor.blackText,
            ),
          ),
          SizedBox(height: responsiveHeight(4)),
          Text(
            'Hạn thanh toán',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: responsiveFont(14),
              color: AppColor.grayText,
            ),
          ),
          SizedBox(height: responsiveHeight(4)),
          Text(
            'controller.contract.value.dateSigned!',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: responsiveFont(20),
              color: AppColor.price,
            ),
          ),
          SizedBox(height: responsiveHeight(6)),
          // button('Trả ngay ${controller.contract.value.priceForRent} đ', () {}),
          SizedBox(height: responsiveHeight(10)),
          const Divider(color: AppColor.black, thickness: 1),
          _buildRow(
            title: 'Mã hợp đồng ',
            value: 'controller.contract.value.id',
          ),
          const Divider(color: AppColor.black, thickness: 0.2),
          _buildRow(
              title: 'Số dư còn lại', value: 'controller.contract.value.name'),
          const Divider(color: AppColor.black, thickness: 0.2),
        ],
      ),
    );
  }

  Widget _buildRow({required String title, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(14),
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
