import 'package:unihome/repositories/models/renter.model.dart';

class Invoice {
  int? invoiceId;
  String? invoiceName;
  String? dueDate;
  String? detail;
  String? imageUrl;
  String? paymentTime;
  String? status;

  int? amount;

  int? accountId;
  int? invoiceTypeId;

  Renter? renter;

  Invoice({
    this.accountId,
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
  });

  Invoice.fromJson(dynamic json) {
    invoiceId = json['InvoiceId'] == null ? null : json['InvoiceId'] as int;
    invoiceName = json['Name'] == null ? null : json['Name'] as String;
    dueDate = json['DueDate'] == null ? null : json['DueDate'] as String;
    detail = json['Detail'] == null ? null : json['Detail'] as String;
    imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    paymentTime =
        json['PaymentTime'] == null ? null : json['PaymentTime'] as String;
    accountId = json['AccountId'] == null ? null : json['AccountId'] as int;
    invoiceTypeId =
        json['InvoiceTypeId'] == null ? null : json['InvoiceTypeId'] as int;
    amount =
        json['Amount'] == null ? null : int.parse(json['Amount'].toString());
    status = json['Status'] == null ? null : json['Status'] as String;
    renter = json['Renter'] == null ? null : Renter.fromJson(json['Renter']);
  }
}
