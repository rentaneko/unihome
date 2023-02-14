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
}
