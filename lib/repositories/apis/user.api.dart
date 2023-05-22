import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<BaseResponse?> loginWithTechnician(
      String username, String password) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await postRequest(
      '/api/auth/management/v1/login',
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

  Future<BaseResponse?> getTechProfile() async {
    return await getResponse('/api/employees/profile');
  }

  Future<BaseResponse?> getListService() async {
    return await getResponse('/api/services');
  }

  Future<BaseResponse?> editProfileRenter(
    String email,
    String phone,
    String fullname,
    String address,
    String birthday,
    String gender,
  ) async {
    return await putRequest(
      '/api/renters/profile/update',
      body: jsonEncode(
        <String, dynamic>{
          "email": email,
          "phone": phone,
          "fullName": fullname,
          'birthDate': birthday,
          "address": address,
          "gender": gender,
        },
      ),
    );
  }

  Future<BaseResponse?> editProfileTech(
    String email,
    String phone,
    String fullname,
    String address,
  ) async {
    return await putRequest(
      '/api/employees/profile/update',
      body: jsonEncode(
        <String, dynamic>{
          "email": email,
          "phone": phone,
          "fullName": fullname,
          "address": address,
        },
      ),
    );
  }

  Future<BaseResponse?> requestTicket(
      {required String ticketDesc,
      required int type,
      required String ticketName,
      required List<XFile> images}) async {
    return await postFormDataRequest(
      '/api/tickets',
      ticketTypeId: type,
      desc: ticketDesc,
      file: images,
      name: ticketName,
    );
  }

  Future<BaseResponse?> getListTicket() async {
    return await getResponse('/api/tickets?PageSize=25');
  }

  Future<BaseResponse?> getListTicketType() async {
    return await getResponse('/api/tickets/type');
  }

  Future<BaseResponse?> getRentalDetail(String renterId) async {
    return await getResponse('/api/renters/rental');
  }

  Future<BaseResponse?> getListInvoice() async {
    return await getResponse('/api/invoices');
  }

  Future<BaseResponse?> getListContract() async {
    return await getResponse('/api/contracts');
  }

  Future<BaseResponse?> uploadFiles(File image) async {
    return await putFormDataRequest('/api/upload/renter', image);
  }

  Future<BaseResponse?> uploadAvatar(File image) async {
    return await putFormDataRequest('/api/upload/employee', image);
  }

  Future<BaseResponse?> addService(List<int> listService) async {
    return await putRequest(
      '/api/services/select',
      body: listService,
    );
  }

  Future<BaseResponse?> changePasswordRenter(
      {required String oldPass,
      required String password,
      required String confirm}) async {
    return await putRequest(
      '/api/renters/change-password',
      body: jsonEncode(<String, dynamic>{
        "oldPassword": oldPass,
        "password": password,
        "confirmPassword": confirm,
      }),
    );
  }

  Future<BaseResponse?> changePasswordTech(
      {required String oldPass,
      required String password,
      required String confirm}) async {
    return await putRequest(
      '/api/employees/change-password',
      body: jsonEncode(<String, dynamic>{
        "oldPassword": oldPass,
        "password": password,
        "confirmPassword": confirm,
      }),
    );
  }

  Future<BaseResponse?> getBasicRental() async {
    return await getResponse('/api/renters/basic-rental');
  }

  Future<BaseResponse?> getInvoiceDetail(String id) async {
    return await getResponse('/api/invoices/$id/user');
  }

  Future<BaseResponse?> deleteTicket(String idTicket) async {
    return await putRequest('/api/tickets/$idTicket/user');
  }

  Future<BaseResponse?> acceptTicket(String idTicket) async {
    return await putRequest('/api/tickets/$idTicket/accept');
  }

  Future<BaseResponse?> resetPassword(String email) async {
    return await postRequest(
      '/api/auth/reset-password',
      body: jsonEncode(
        <String, String>{
          "registeredEmail": email,
        },
      ),
    );
  }

  Future<BaseResponse?> acceptTicketTech(String idTicket) async {
    return await putRequest('/api/tickets/$idTicket/accept-ticket');
  }

  Future<BaseResponse?> solveTicketTech(String idTicket) async {
    return await putRequest('/api/tickets/$idTicket/solve-ticket');
  }

  Future<BaseResponse?> getTicketDetail(String idTicket) async {
    return await getResponse('/api/tickets/$idTicket');
  }
}
