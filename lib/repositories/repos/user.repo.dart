import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:unihome/constant/value.constant.dart';
import 'package:unihome/repositories/apis/user.api.dart';
import 'package:unihome/repositories/models/contract.model.dart';
import 'package:unihome/repositories/models/invoice.model.dart';
import 'package:unihome/repositories/models/rental.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';
import 'package:unihome/repositories/models/service.model.dart';
import 'package:unihome/repositories/models/technician.model.dart';
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

  Future<Technician?> getTechProfile() async {
    var res = await userApi.getTechProfile();
    return res!.code == SUCCESS ? Technician.fromJson(res.data) : null;
  }

  Future<List<Services>?> getListService() async {
    var res = await userApi.getListService();
    return res!.code == SUCCESS
        ? List.from(res.data as List).map((e) => Services.fromJson(e)).toList()
        : null;
  }

  Future<bool> editProfileRenter(
      {required String email,
      required String phone,
      required String fullname,
      required String address,
      required String birthday,
      required String gender}) async {
    var res = await userApi.editProfileRenter(
        email, phone, fullname, address, birthday, gender);
    return res!.code == SUCCESS ? true : false;
  }

  Future<bool> editProfileTech(
      {required String email,
      required String phone,
      required String fullname,
      required String address}) async {
    var res = await userApi.editProfileTech(email, phone, fullname, address);
    return res!.code == SUCCESS ? true : false;
  }

  Future<bool> requestTicket(
      {required String ticketDesc,
      required int type,
      required String ticketName,
      required List<XFile> images}) async {
    var res = await userApi.requestTicket(
        ticketName: ticketName,
        ticketDesc: ticketDesc,
        type: type,
        images: images);
    return res!.code == SUCCESS ? true : false;
  }

  Future<bool> editTicket(
      {required String ticketDesc,
      required String ticketId,
      required int type,
      required String ticketName,
      required List<XFile> images}) async {
    var res = await userApi.editTicket(
      ticketId: ticketId,
      ticketName: ticketName,
      ticketDesc: ticketDesc,
      type: type,
      images: images,
    );
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

  Future<bool> uploadAvatar(File image) async {
    var res = await userApi.uploadAvatar(image);
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

  Future<String> changePasswordTech(
      {required String oldPass,
      required String password,
      required String confirm}) async {
    var res = await userApi.changePasswordTech(
      confirm: confirm,
      oldPass: oldPass,
      password: password,
    );
    var msg = '';
    if (res!.message!.contains('Mật khẩu đã được cập nhật')) {
      msg = res.message.toString();
    } else {
      msg = res.message.toString();
    }
    return msg;
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

  Future<String?> acceptTicketTech(String idTicket) async {
    var res = await userApi.acceptTicketTech(idTicket);
    return res!.code == SUCCESS ? 'true' : res.message;
  }

  Future<String?> solveTicketTech(String idTicket) async {
    var res = await userApi.solveTicketTech(idTicket);
    return res!.code == SUCCESS ? 'true' : res.message;
  }

  Future<Ticket?> getTicketDetail(String idTicket) async {
    var response = await userApi.getTicketDetail(idTicket);
    return response!.code == SUCCESS ? Ticket.fromJson(response.data) : null;
  }
}
