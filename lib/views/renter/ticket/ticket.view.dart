import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';
import 'package:unihome/views/renter/ticket/ticket.controller.dart';

class TicketScreen extends GetWidget<TicketController> {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bg,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return _openDialog();
            },
          ),
          backgroundColor: AppColor.primary,
          child: Icon(Icons.add,
              color: AppColor.white, size: responsiveHeight(24)),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          centerTitle: true,
          title: Text(
            'DANH SÁCH SỰ CỐ',
            style: TextStyle(
              color: AppColor.white,
              fontSize: responsiveFont(22),
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
      ),
    );
  }

  Widget _openDialog() {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: responsiveWidth(20)),
          Text(
            'Tạo yêu cầu mới',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(18),
              color: AppColor.blackText,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: () => goBack(),
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.close_sharp),
          ),
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Loại sự cố',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(16),
              color: AppColor.blackText,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: responsiveHeight(12)),
          Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton2<TicketType>(
                items: controller.listTicketType
                    .map((type) => _buildDropDown(type))
                    .toList(),
                value: controller.selectedType.value,
                onChanged: (value) => controller.selectedType.value = value!,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: responsiveFont(14),
                ),
                buttonStyleData: ButtonStyleData(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: responsiveWidth(12)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grayLight),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(16)),
          Text(
            'Miêu tả sự cố',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(16),
              color: AppColor.blackText,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: responsiveHeight(12)),
          TextFormField(
            controller: controller.ticketDesc,
            minLines: 7,
            maxLines: 10,
            decoration: InputDecoration(
              focusColor: AppColor.primary,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.price),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.darkBlue),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.grayBorder),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(16)),
          Text(
            'Hình đính kèm',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: responsiveFont(16),
              color: AppColor.blackText,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: responsiveHeight(12)),
          Obx(
            () => Container(
              width: double.infinity,
              height: responsiveHeight(120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.grayBorder),
              ),
              child: controller.fileImagePath.value == 'no-image'
                  ? IconButton(
                      onPressed: () =>
                          controller.pickImage(ImageSource.gallery),
                      icon: Image.asset('assets/icons/add-photo.png'),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(controller.img!)))),
            ),
          ),
          SizedBox(height: responsiveHeight(12)),
          // button
          button('Gửi', () => controller.requestTicket()),
        ],
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
        backgroundColor: AppColor.primary,
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
          Tab(text: 'Tất cả'),
          Tab(text: 'Gửi'),
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
          _allTab(),
          _sendTab(),
          _processingTab(),
          _doneTab(),
        ],
      ),
    );
  }

  Widget _allTab() {
    return Container(
      height: getHeightDevice(),
      width: getWidthDevice(),
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listTicket.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicket[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trạng thái',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      _statusText(controller.listTicket[index].status
                          .toString()
                          .toLowerCase()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _statusColor(controller.listTicket[index].status
                            .toString()
                            .toLowerCase()),
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loại dịch vụ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicket[index].type}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày được tạo',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      Jiffy(controller.listTicket[index].createdDate.toString())
                          .format('dd/MM/yyyy'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sendTab() {
    return Container(
      height: getHeightDevice(),
      width: getWidthDevice(),
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listTicketSend.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketSend[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trạng thái',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      _statusText(controller.listTicketSend[index].status
                          .toString()
                          .toLowerCase()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _statusColor(controller
                            .listTicketSend[index].status
                            .toString()
                            .toLowerCase()),
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loại dịch vụ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketSend[index].type}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày được tạo',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      Jiffy(controller.listTicketSend[index].createdDate
                              .toString())
                          .format('dd/MM/yyyy'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _processingTab() {
    return Container(
      height: getHeightDevice(),
      width: getWidthDevice(),
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listTicketProcess.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketProcess[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trạng thái',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      _statusText(controller.listTicketProcess[index].status
                          .toString()
                          .toLowerCase()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _statusColor(controller
                            .listTicketProcess[index].status
                            .toString()
                            .toLowerCase()),
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loại dịch vụ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketProcess[index].type}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày được tạo',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      Jiffy(controller.listTicketProcess[index].createdDate
                              .toString())
                          .format('dd/MM/yyyy'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _doneTab() {
    return Container(
      height: getHeightDevice(),
      width: getWidthDevice(),
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(22), vertical: responsiveHeight(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listTicketDone.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketDone[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trạng thái',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      _statusText(controller.listTicketDone[index].status
                          .toString()
                          .toLowerCase()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _statusColor(controller
                            .listTicketDone[index].status
                            .toString()
                            .toLowerCase()),
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loại dịch vụ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      '${controller.listTicketDone[index].type}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày được tạo',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                    Text(
                      Jiffy(controller.listTicketDone[index].createdDate
                              .toString())
                          .format('dd/MM/yyyy'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: responsiveFont(16),
                      ),
                    ),
                  ],
                ),
              ],
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

      default:
        return AppColor.complete;
    }
  }

  String _statusText(String status) {
    switch (status) {
      case 'active':
        return 'Chờ xử lý';
      case 'processing':
        return 'Đang xử lý';
      default:
        return 'Đã hoàn thành';
    }
  }

  DropdownMenuItem<TicketType> _buildDropDown(TicketType type) {
    return DropdownMenuItem(
      value: type,
      child: Text(type.name.toString()),
    );
  }
}
