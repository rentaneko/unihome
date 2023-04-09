import 'dart:convert';
import 'dart:io';
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

  Future<List<Invoice>?> getListInvoice() async {
    var res = await userApi.getListInvoice();

    return res!.code == SUCCESS
        ? (res.data as List).map((e) => Invoice.fromJson(e)).toList()
        : null;
  }

  Future<Renter?> getRenterProfile() async {
    var res = await userApi.getRenterProfile();
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
      {required String ticketDesc,
      required int type,
      required List<File> images}) async {
    var res = await userApi.requestTicket(
        ticketDesc: ticketDesc, type: type, images: images);
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

  Future<bool> uploadFile(File image) async {
    var res = await userApi.uploadFiles(image);
    return res!.code == SUCCESS ? true : false;
  }

  Future<bool> addService(List<int> listService) async {
    var res = await userApi.addService(listService);
    return res!.code == SUCCESS ? true : false;
  }
}
