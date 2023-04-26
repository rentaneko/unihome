import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/technician/ticket_tech/ticket_tech.controller.dart';

class TicketTechScreen extends GetWidget<TicketTechController> {
  const TicketTechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Text(
          'Danh sách yêu cầu',
          style: TextStyle(
            color: AppColor.black,
            fontSize: responsiveFont(24),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: responsiveHeight(12)),
                    _buildTabbar(),
                    _buildBody(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTabbar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.grayBorder,
        borderRadius: BorderRadius.circular(72),
      ),
      child: ButtonsTabBar(
        radius: 72,
        elevation: 0,
        contentPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
        center: false,
        physics: const NeverScrollableScrollPhysics(),
        unselectedBackgroundColor: AppColor.grayBorder,
        backgroundColor: AppColor.main,
        unselectedLabelStyle: TextStyle(
          color: AppColor.grayText,
          fontFamily: 'SF Pro Display',
          fontSize: responsiveFont(15),
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'SF Pro Display',
          fontSize: responsiveFont(15),
          fontWeight: FontWeight.w500,
        ),
        height: 56,
        tabs: const [
          Tab(text: 'Gửi'),
          Tab(text: 'Thảo luận'),
          Tab(text: 'Đang xử lý'),
          Tab(text: 'Đã xong'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: TabBarView(
        children: [
          _allTab('active'),
          _allTab('processing'),
          _allTab('confirming'),
          _allTab('solved'),
        ],
      ),
    );
  }

  Widget _allTab(String? status) {
    switch (status) {
      case 'active':
        RxList<Ticket> tmp = <Ticket>[].obs;
        controller.listTicket.forEach(
          (e) {
            if (e.status!.toLowerCase() == status) {
              tmp.add(e);
            }
          },
        );
        return Container(
          height: getHeightDevice(),
          width: getWidthDevice(),
          padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tmp.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => goTo(
                    screen: ROUTE_TICKET_DETAIL_TECH, argument: tmp[index]),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                    vertical: responsiveHeight(12),
                  ),
                  margin: EdgeInsets.only(bottom: responsiveHeight(16)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight, width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/no-image.png')),
                          SizedBox(width: responsiveWidth(24)),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tmp[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  _statusText(tmp[index]
                                      .status
                                      .toString()
                                      .toLowerCase()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _statusColor(tmp[index]
                                        .status
                                        .toString()
                                        .toLowerCase()),
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  'Ngày gửi: ${tmp[index].createdDate}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${tmp[index].desc}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: responsiveFont(16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      case 'processing':
        RxList<Ticket> tmp = <Ticket>[].obs;
        controller.listTicket.forEach(
          (e) {
            if (e.status!.toLowerCase() == status) {
              tmp.add(e);
            }
          },
        );
        return Container(
          height: getHeightDevice(),
          width: getWidthDevice(),
          padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tmp.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => goTo(
                    screen: ROUTE_TICKET_DETAIL_TECH, argument: tmp[index]),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                    vertical: responsiveHeight(12),
                  ),
                  margin: EdgeInsets.only(bottom: responsiveHeight(16)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight, width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/no-image.png')),
                          SizedBox(width: responsiveWidth(24)),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tmp[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  _statusText(tmp[index]
                                      .status
                                      .toString()
                                      .toLowerCase()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _statusColor(tmp[index]
                                        .status
                                        .toString()
                                        .toLowerCase()),
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  'Ngày gửi: ${tmp[index].createdDate}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${tmp[index].desc}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: responsiveFont(16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      case 'confirming':
        RxList<Ticket> tmp = <Ticket>[].obs;
        controller.listTicket.forEach(
          (e) {
            if (e.status!.toLowerCase() == status) {
              tmp.add(e);
            }
          },
        );
        return Container(
          height: getHeightDevice(),
          width: getWidthDevice(),
          padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tmp.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => goTo(
                    screen: ROUTE_TICKET_DETAIL_TECH, argument: tmp[index]),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                    vertical: responsiveHeight(12),
                  ),
                  margin: EdgeInsets.only(bottom: responsiveHeight(16)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight, width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/no-image.png')),
                          SizedBox(width: responsiveWidth(24)),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tmp[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  _statusText(tmp[index]
                                      .status
                                      .toString()
                                      .toLowerCase()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _statusColor(tmp[index]
                                        .status
                                        .toString()
                                        .toLowerCase()),
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  'Ngày gửi: ${tmp[index].createdDate}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${tmp[index].desc}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: responsiveFont(16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );

      case 'solved':
        RxList<Ticket> tmp = <Ticket>[].obs;
        controller.listTicket.forEach(
          (e) {
            if (e.status!.toLowerCase() == status) {
              tmp.add(e);
            }
          },
        );
        return Container(
          height: getHeightDevice(),
          width: getWidthDevice(),
          padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tmp.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => goTo(
                    screen: ROUTE_TICKET_DETAIL_TECH, argument: tmp[index]),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                    vertical: responsiveHeight(12),
                  ),
                  margin: EdgeInsets.only(bottom: responsiveHeight(16)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight, width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/no-image.png')),
                          SizedBox(width: responsiveWidth(24)),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tmp[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  _statusText(tmp[index]
                                      .status
                                      .toString()
                                      .toLowerCase()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _statusColor(tmp[index]
                                        .status
                                        .toString()
                                        .toLowerCase()),
                                    fontSize: responsiveFont(16),
                                  ),
                                ),
                                Text(
                                  'Ngày gửi: ${tmp[index].createdDate}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    fontSize: responsiveFont(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${tmp[index].desc}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: responsiveFont(16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );

      default:
    }
    return Container(
      height: getHeightDevice(),
      width: getWidthDevice(),
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listTicket.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => goTo(
                screen: ROUTE_TICKET_DETAIL_TECH,
                argument: controller.listTicket[index]),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(16),
                vertical: responsiveHeight(12),
              ),
              margin: EdgeInsets.only(bottom: responsiveHeight(16)),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.grayLight, width: 1.5),
                borderRadius: BorderRadius.circular(6),
                color: AppColor.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset('assets/icons/no-image.png')),
                      SizedBox(width: responsiveWidth(24)),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.listTicket[index].name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                                fontSize: responsiveFont(16),
                              ),
                            ),
                            Text(
                              _statusText(controller.listTicket[index].status
                                  .toString()
                                  .toLowerCase()),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: _statusColor(controller
                                    .listTicket[index].status
                                    .toString()
                                    .toLowerCase()),
                                fontSize: responsiveFont(16),
                              ),
                            ),
                            Text(
                              'Ngày gửi: ${controller.listTicket[index].createdDate}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColor.black,
                                fontSize: responsiveFont(14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${controller.listTicket[index].desc}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                      fontSize: responsiveFont(16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'active':
        return AppColor.send;
      case 'processing':
        return AppColor.processing;
      case 'confirming':
        return AppColor.main;
      case 'solved':
        return AppColor.complete;
      default:
        return AppColor.darkBlue;
    }
  }

  String _statusText(String status) {
    switch (status) {
      case 'active':
        return 'Gửi';
      case 'processing':
        return 'Thảo luận';
      case 'solved':
        return 'Hoàn thành';
      case 'confirming':
        return 'Đang xử lí';

      default:
        return 'Chưa cập nhật';
    }
  }
}
