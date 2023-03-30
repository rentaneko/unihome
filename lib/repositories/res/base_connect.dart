import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/res/base_response.dart';
import 'package:unihome/utils/metric.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = BASE_URL
      ..maxAuthRetries = MAX_AUTH_RETRIES
      ..timeout = const Duration(seconds: MAX_TIME_OUT)
      ..defaultContentType = CONTENT_TYPE
      ..addAuthenticator<dynamic>((request) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        var token = pref.getString(TOKEN);
        Get.log('[TOKEN] $token');
        if (token != null) request.headers[AUTHORIZATION] = "$BEARER $token";
        return request;
      });
  }

  Future<BaseResponse?> getResponse(String url, {dynamic query}) async {
    var response = await get(url, decoder: (map) => BaseResponse.fromMap(map));

    if (response.isOk) {
      return response.body;
    } else {
      hideLoading();
      return BaseResponse(
          message: response.statusText, code: response.status.code.toString());
    }
  }

  Future<BaseResponse?> postRequest(String url,
      {dynamic body,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var response = await post(url, body,
        decoder: (map) => BaseResponse.fromMap(map),
        query: query,
        headers: headers);

    if (response.isOk) {
      return response.body;
    } else {
      hideLoading();
      return BaseResponse(
          message: response.statusText, code: response.status.code.toString());
    }
  }

  Future<BaseResponse?> patchRequest(String url, dynamic body,
      Map<String, dynamic>? query, Map<String, String>? headers) async {
    var response = await patch(url, body,
        decoder: (map) => BaseResponse.fromMap(map),
        query: query,
        headers: headers);
    if (response.isOk) {
      return response.body;
    } else {
      hideLoading();
      return BaseResponse(
          message: response.statusText, code: response.status.code.toString());
    }
  }

  Future<BaseResponse?> putRequest(String url,
      {dynamic body,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var response = await put(url, body,
        decoder: (map) => BaseResponse.fromMap(map),
        query: query,
        headers: headers);

    if (response.isOk) {
      return response.body;
    } else {
      return BaseResponse(code: response.status.code.toString());
    }
  }

  Future<BaseResponse?> putFormDataRequest(String url, File file,
      {dynamic body, dynamic query, headers}) async {
    final form = FormData({
      "Image": MultipartFile(file.path, filename: "file"),
    });
    var response = await put(url, form,
        decoder: (map) => BaseResponse.fromMap(map),
        query: query,
        headers: headers);
    if (response.isOk) {
      Get.log('[RESPONSE] : ${response.body?.toMap()}');
      return response.body;
    } else {
      hideLoading();
      return BaseResponse(
        message: response.statusText,
        code: response.status.code.toString(),
      );
    }
  }
}
