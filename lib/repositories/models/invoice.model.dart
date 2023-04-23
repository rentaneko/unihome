import 'package:unihome/repositories/models/admin.model.dart';
import 'package:unihome/repositories/models/invoice_detail.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';

class Invoice {
  int? invoiceId;
  String? invoiceName;
  String? dueDate;
  String? paymentTime;
  String? createTime;
  String? detail;
  String? imageUrl;
  int? amount;
  bool? status;

  Renter? renter;
  AdminAccount? adminAccount;
  List<InvoiceDetail>? invoiceDetails;

  String? invoiceTypeName;
  int? invoiceTypeId;

  Invoice.fromJson(dynamic json) {
    invoiceTypeName = json['InvoiceType']['InvoiceTypeName'] == null
        ? null
        : json['InvoiceType']['InvoiceTypeName'] as String;
    invoiceTypeId = json['InvoiceType']['InvoiceTypeId'] == null
        ? null
        : json['InvoiceType']['InvoiceTypeId'] as int;
    invoiceId = json['InvoiceId'] == null ? null : json['InvoiceId'] as int;
    invoiceName = json['Name'] == null ? null : json['Name'] as String;
    dueDate =
        json['DueDate'] == null ? 'Chưa cập nhật' : json['DueDate'] as String;
    createTime = json['CreatedTime'] == null
        ? 'Chưa cập nhật'
        : json['CreatedTime'] as String;
    detail = json['Detail'] == null ? null : json['Detail'] as String;
    // imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    paymentTime = json['PaymentTime'] == null
        ? 'Chưa cập nhật'
        : json['PaymentTime'] as String;
    invoiceTypeId =
        json['InvoiceTypeId'] == null ? null : json['InvoiceTypeId'] as int;
    amount =
        json['Amount'] == null ? null : int.parse(json['Amount'].toString());
    status = json['Status'] == null ? null : json['Status'] as bool;
    renter = json['Renter'] == null ? null : Renter.fromJson(json['Renter']);
    adminAccount = json['Employee'] == null
        ? null
        : AdminAccount.fromJson(json['Employee']);
    invoiceDetails =
        json['InvoiceDetails'] == null || json['InvoiceDetails'] == []
            ? null
            : (json['InvoiceDetails'] as List)
                .map((e) => InvoiceDetail.fromJson(e))
                .toList();
  }

  Invoice({
    this.amount,
    this.detail,
    this.dueDate,
    this.invoiceId,
    this.imageUrl,
    this.invoiceTypeId,
    this.invoiceName,
    this.paymentTime,
    this.renter,
    this.status,
    this.invoiceDetails,
    this.adminAccount,
    this.invoiceTypeName,
  });
}
