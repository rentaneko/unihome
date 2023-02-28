import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/res/base_response.dart';

class UserRepo {
  UserApi userApi;
  UserRepo(this.userApi);

  Future<BaseResponse?> loginWithRenter(
      String username, String password) async {
    var res = await userApi.loginWithRenter(username, password);
    return res!.code == SUCCESS ? res : null;
  }

  Future<Contract?> getContractByRenterId(String idRenter) async {
    var res = await userApi.getContractByRenterId(idRenter);

    return res!.code == SUCCESS ? Contract.fromJson(res.data) : null;
  }

  Future<Invoice?> getListInvoiceByRenterId(
      String idRenter, String invoiceId) async {
    var res = await userApi.getListInvoiceByRenterId(idRenter, invoiceId);

    return res!.code == SUCCESS ? Invoice.fromJson(res.data) : null;
  }
}
