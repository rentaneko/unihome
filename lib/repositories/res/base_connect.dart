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
      ..maxAuthRetries = maxAuthRetries
      ..timeout = const Duration(seconds: MAX_TIME_OUT)
      ..defaultContentType = CONTENT_TYPE
      ..addAuthenticator<dynamic>((request) async {
        SharedPreferences _pref = await SharedPreferences.getInstance();
        var token = _pref.getString(TOKEN);
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

  Future<BaseResponse?> pathRequest(String url,
      {dynamic body,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
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
}
