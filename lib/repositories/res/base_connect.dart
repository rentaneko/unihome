import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
    print(response.body?.toMap());
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
      return response.body;
    } else {
      hideLoading();
      return BaseResponse(
        message: response.statusText,
        code: response.status.code.toString(),
      );
    }
  }

  Future<BaseResponse?> postFormDataRequest(
    String url, {
    required List<XFile> file,
    required int ticketTypeId,
    required String desc,
    required String name,
    headers,
  }) async {
    var form = FormData({});
    if (file.length == 1) {
      form = FormData({
        "TicketTypeId": ticketTypeId,
        "Description": desc,
        "TicketName": name,
        "ImageUploadRequest": [
          MultipartFile(file[0].path, filename: file[0].path),
        ],
      });
    } else if (file.length == 2) {
      form = FormData({
        "TicketTypeId": ticketTypeId,
        "Description": desc,
        "TicketName": name,
        "ImageUploadRequest": [
          MultipartFile(file[0].path, filename: file[0].path),
          MultipartFile(file[1].path, filename: file[1].path),
        ],
      });
    } else if (file.length == 3) {
      form = FormData({
        "TicketTypeId": ticketTypeId,
        "Description": desc,
        "TicketName": name,
        "ImageUploadRequest": [
          MultipartFile(file[0].path, filename: file[0].path),
          MultipartFile(file[1].path, filename: file[1].path),
          MultipartFile(file[2].path, filename: file[2].path),
        ],
      });
    }

    var response = await post(url, form,
        decoder: (map) => BaseResponse.fromMap(map), headers: headers);

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

  Future<BaseResponse?> deleteRequest(String url,
      {dynamic body,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var response = await delete(url,
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
}
