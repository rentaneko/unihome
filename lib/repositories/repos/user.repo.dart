import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/models/rental.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/models/service.model.dart';
import 'package:unihome/repositories/models/ticket.model.dart';
import 'package:unihome/repositories/res/base_response.dart';

class UserRepo {
  UserApi userApi;
  UserRepo(this.userApi);

  Future<BaseResponse?> loginWithRenter(
      String username, String password) async {
    var res = await userApi.loginWithRenter(username, password);
    return res!.code == SUCCESS ? res : null;
  }

  Future<ContractDetail?> getContractByRenterId(
      {required String idRenter, required String contractId}) async {
    var res = await userApi.getContractByRenterId(
        idContract: contractId, idRenter: idRenter);

    return res!.code == SUCCESS ? ContractDetail.fromJson(res.data) : null;
  }

  Future<Invoice?> getListInvoiceByRenterId(
      String idRenter, String invoiceId) async {
    var res = await userApi.getListInvoiceByRenterId(idRenter, invoiceId);

    return res!.code == SUCCESS ? Invoice.fromJson(res.data) : null;
  }

  Future<Renter?> getRenterProfile(String idRenter) async {
    var res = await userApi.getRenterProfile(idRenter);
    return res!.code == SUCCESS ? Renter.fromJson(res.data) : null;
  }

  Future<List<Services>?> getListService() async {
    var res = await userApi.getListService();
    return res!.code == SUCCESS
        ? List.from(res.data as List).map((e) => Services.fromJson(e)).toList()
        : null;
  }

  Future<bool> editProfileRenter(String idRenter, String email, String phone,
      String fullname, String address, int universityId, int majorId) async {
    var res = await userApi.editProfileRenter(
        idRenter, email, phone, fullname, address, universityId, majorId);
    return res!.code == SUCCESS ? true : false;
  }

  Future<bool> requestTicket(
      String renterId, String ticketName, String ticketDesc, int type) async {
    var res =
        await userApi.requestTicket(renterId, ticketName, ticketDesc, type);
    return res!.code == SUCCESS ? true : false;
  }

  Future<List<Ticket>?> getListTicket() async {
    var res = await userApi.getListTicket();
    return res!.code == SUCCESS
        ? List.from(res.data as List).map((e) => Ticket.fromJson(e)).toList()
        : null;
  }

  Future<List<TicketType>?> getTicketType() async {
    var res = await userApi.getListTicketType();
    return res!.code == SUCCESS
        ? List.from(res.data as List)
            .map((e) => TicketType.fromJson(e))
            .toList()
        : null;
  }

  Future<Rental?> getRentalDetail(String renterId) async {
    var res = await userApi.getRentalDetail(renterId);

    return res!.code == SUCCESS ? Rental.fromJson(res.data) : null;
  }

  Future<List<Contract>?> getListContract() async {
    var res = await userApi.getListContract();
    return res!.code == SUCCESS
        ? (res.data as List).map((e) => Contract.fromJson(e)).toList()
        : null;
  }
}
