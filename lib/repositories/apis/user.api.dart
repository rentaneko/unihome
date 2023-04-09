import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:unihome/repositories/res/base_connect.dart';
import 'package:unihome/repositories/res/base_response.dart';

class UserApi extends BaseConnect {
  Future<BaseResponse?> loginWithRenter(
      String username, String password) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await postRequest(
      '/api/auth/user/v1/login',
      body: jsonEncode(
        <String, String>{
          "usernameOrPhoneNumber": username,
          "password": password,
          "deviceToken": deviceId.toString(),
        },
      ),
    );
  }

  Future<BaseResponse?> getContractByRenterId(
      {required String idContract, required String idRenter}) async {
    return await getResponse('/api/contracts/$idContract/user/$idRenter');
  }

  Future<BaseResponse?> getListInvoiceByRenterId(
      String idRenter, String invoiceId) async {
    return await getResponse('/api/invoices/$invoiceId/user/$idRenter');
  }

  Future<BaseResponse?> getRenterProfile() async {
    return await getResponse('/api/renters/profile');
  }

  Future<BaseResponse?> getListService() async {
    return await getResponse('/api/services');
  }

  Future<BaseResponse?> editProfileRenter(
      String idRenter,
      String email,
      String phone,
      String fullname,
      String address,
      int universityId,
      int majorId) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await putRequest(
      '/api/renters/$idRenter',
      body: jsonEncode(
        <String, dynamic>{
          "username": "renter3",
          "email": email,
          "password": "renter3",
          "phone": int.parse(phone),
          "fullName": fullname,
          "birthDate": "2005-08-18T17:18:18.303Z",
          "status": true,
          "contractId": 3,
          "address": address,
          "gender": "Male",
          "universityId": universityId,
          "majorId": majorId,
          "deviceToken": deviceId.toString(),
        },
      ),
    );
  }

  Future<BaseResponse?> requestTicket(
      {required String ticketDesc,
      required int type,
      required List<File> images}) async {
    return await postFormDataRequest(
      '/api/tickets',
      ticketTypeId: type,
      desc: ticketDesc,
      file: images,
    );
  }

  Future<BaseResponse?> getListTicket() async {
    return await getResponse('/api/tickets');
  }

  Future<BaseResponse?> getListTicketType() async {
    return await getResponse('/api/tickets/type');
  }

  Future<BaseResponse?> getRentalDetail(String renterId) async {
    return await getResponse('/api/renters/rental');
  }

  Future<BaseResponse?> getListInvoice() async {
    return await getResponse('/api/invoices/user/all');
  }

  Future<BaseResponse?> getListContract() async {
    return await getResponse('/api/contracts/renter');
  }

  Future<BaseResponse?> uploadFiles(File image) async {
    return await putFormDataRequest('/api/upload/renter', image);
  }

  Future<BaseResponse?> addService(List<int> listService) async {
    return await putRequest(
      '/api/services/select',
      body: listService,
    );
  }

  Future<BaseResponse?> changePassword(String password, String confirm) async {
    return await putRequest(
      '/api/renters/change-password',
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "confirmPassword": confirm,
      }),
    );
  }

  Future<BaseResponse?> getDueDateInvoice() async {
    return await getResponse('/api/invoices/latest');
  }
}
