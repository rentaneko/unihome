import 'package:unihome/repositories/models/admin.model.dart';
import 'package:unihome/repositories/models/invoice_detail.model.dart';
import 'package:unihome/repositories/models/renter.model.dart';

class Invoice {
  int? invoiceId;
  String? invoiceName;
  String? dueDate;
  String? detail;
  String? imageUrl;
  String? paymentTime;
  bool? status;

  int? amount;

  int? invoiceTypeId;
  String? invoiceType;

  Renter? renter;
  AdminAccount? admin;
  List<InvoiceDetail>? invoiceDetails;

  Invoice.fromJson(dynamic json) {
    invoiceId = json['InvoiceId'] == null ? null : json['InvoiceId'] as int;
    invoiceName = json['Name'] == null ? null : json['Name'] as String;
    dueDate = json['DueDate'] == null ? null : json['DueDate'] as String;
    detail = json['Detail'] == null ? null : json['Detail'] as String;
    imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    paymentTime =
        json['PaymentTime'] == null ? null : json['PaymentTime'] as String;
    invoiceTypeId =
        json['InvoiceTypeId'] == null ? null : json['InvoiceTypeId'] as int;
    amount =
        json['Amount'] == null ? null : int.parse(json['Amount'].toString());
    status = json['Status'] == null ? null : json['Status'] as bool;
    renter = json['Renter'] == null ? null : Renter.fromJson(json['Renter']);
    admin = json['Employee'] == null
        ? null
        : AdminAccount.fromJson(json['Employee']);
    invoiceDetails = json['InvoiceDetails'] == null
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
    this.admin,
    this.invoiceDetails,
    this.invoiceType,
  });
}
