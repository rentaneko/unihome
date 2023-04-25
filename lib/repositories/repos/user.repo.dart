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

  Future<BaseResponse?> loginWithTechnician(
      String username, String password) async {
    var res = await userApi.loginWithTechnician(username, password);
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
      required String ticketName,
      required List<File> images}) async {
    var res = await userApi.requestTicket(
        ticketName: ticketName,
        ticketDesc: ticketDesc,
        type: type,
        images: images);
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

  Future<String> changePasswordRenter(
      {required String oldPass,
      required String password,
      required String confirm}) async {
    var res = await userApi.changePasswordRenter(
      confirm: confirm,
      oldPass: oldPass,
      password: password,
    );

    var msg = '';
    if (res!.message!.contains('other')) {}
    return msg;
  }

  Future<bool> changePasswordTech(
      {required String oldPass,
      required String password,
      required String confirm}) async {
    var res = await userApi.changePasswordTech(
      confirm: confirm,
      oldPass: oldPass,
      password: password,
    );

    return res!.code == SUCCESS ? true : false;
  }

  Future<BasicRental?> getBasicRental() async {
    var res = await userApi.getBasicRental();
    return res!.code == SUCCESS ? BasicRental.fromJson(res.data) : null;
  }

  Future<Invoice?> getIndvoiceDetail(String id) async {
    var res = await userApi.getInvoiceDetail(id);
    return res!.code == SUCCESS ? Invoice.fromJson(res.data) : null;
  }

  Future<String?> acceptTicket(String idTicket) async {
    var res = await userApi.acceptTicket(idTicket);
    return res!.code == SUCCESS ? 'true' : res.message;
  }

  Future<String?> deleteTicket(String idTicket) async {
    var res = await userApi.deleteTicket(idTicket);
    return res!.code == SUCCESS ? 'true' : res.message;
  }

  Future<bool> resetPassword(String email) async {
    var res = await userApi.resetPassword(email);
    return res!.code == SUCCESS ? true : false;
  }
}
