import 'dart:convert';

import 'package:platform_device_id/platform_device_id.dart';
import 'package:unihome/constant/value.constant.dart';
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
          "username": username,
          "password": password,
          "deviceToken": deviceId.toString(),
        },
      ),
    );
  }

  Future<BaseResponse?> getContractByRenterId(String idRenter) async {
    return await getResponse('/api/contracts/user/$idRenter/active');
  }

  Future<BaseResponse?> getListInvoiceByRenterId(
      String idRenter, String invoiceId) async {
    return await getResponse('/api/invoices/$invoiceId/user/$idRenter');
  }

  Future<BaseResponse?> getRenterProfile(String idRenter) async {
    return await getResponse('/api/renters/$idRenter');
  }

  Future<BaseResponse?> getListService() async {
    return await getResponse('/api/services');
  }

  Future<BaseResponse?> editProfileRenter(String idRenter) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await putRequest(
      '/api/renters/$idRenter',
      body: jsonEncode(
        <String, dynamic>{
          "username": "renter3",
          "email": "example@gmail.com",
          "password": "renter3",
          "phone": "0123456789",
          "fullName": "Dev Test",
          "birthDate": "2005-08-18T17:18:18.303Z",
          "status": true,
          "contractId": 3,
          "address": "Dev Test",
          "gender": "Male",
          "universityId": 1,
          "majorId": 1,
          "deviceToken": deviceId.toString(),
        },
      ),
    );
  }
}
