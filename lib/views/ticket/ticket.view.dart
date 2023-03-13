import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/views/ticket/ticket.controller.dart';

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
              : Container(
                  height: getHeightDevice(),
                  width: getWidthDevice(),
                  padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(22),
                      vertical: responsiveHeight(24)),
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
                          border:
                              Border.all(color: AppColor.grayLight, width: 1.5),
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
                                  '${controller.listTicket[index].status}',
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
                                  Jiffy.parse(controller
                                          .listTicket[index].createdDate
                                          .toString())
                                      .format(pattern: 'dd/MM/yyyy'),
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
                ),
        ),
      ),
    );
  }

  Widget _openDialog() {
    return AlertDialog(
      title: Text('Ticket'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          TextFormField(
            controller: controller.ticketName,
            decoration: InputDecoration(
              labelText: 'Tên sự cố',
              labelStyle: TextStyle(
                fontSize: responsiveFont(16),
                color: AppColor.primary,
              ),
              focusColor: AppColor.primary,
              prefixIconColor: AppColor.primary,
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.price),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(16)),
          TextFormField(
            controller: controller.ticketDesc,
            decoration: InputDecoration(
              labelText: 'Miêu tả',
              labelStyle: TextStyle(
                fontSize: responsiveFont(16),
                color: AppColor.primary,
              ),
              focusColor: AppColor.primary,
              prefixIconColor: AppColor.primary,
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.price),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            controller.ticketName.clear();
            controller.ticketDesc.clear();
            goBack();
          },
          child: Text('Close'),
        ),
        ElevatedButton(
          onPressed: () => controller.requestTicket(),
          child: Text('Create'),
        ),
      ],
    );
  }

  DropdownMenuItem<TicketType> _buildDropDown(TicketType type) {
    return DropdownMenuItem(
      value: type,
      child: Text(type.name.toString()),
    );
  }
}
