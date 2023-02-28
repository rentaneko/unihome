import 'package:unihome/repositories/models/renter.model.dart';

class Invoice {
  String? name;
  String? dueDate;
  String? detail;
  String? imageUrl;
  String? paymentTime;

  double? amount;

  int? id;
  int? renterId;
  int? accountId;
  int? invoiceTypeId;

  bool? status;

  Renter? renter;

  Invoice({
    this.accountId,
    this.amount,
    this.detail,
    this.dueDate,
    this.id,
    this.imageUrl,
    this.invoiceTypeId,
    this.name,
    this.paymentTime,
    this.renter,
    this.renterId,
    this.status,
  });

  Invoice.fromJson(dynamic json) {
    id = json['InvoiceId'] == null ? null : json['InvoiceId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
    dueDate = json['DueDate'] == null ? null : json['DueDate'] as String;
    detail = json['Detail'] == null ? null : json['Detail'] as String;
    imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    paymentTime =
        json['PaymentTime'] == null ? null : json['PaymentTime'] as String;
    renterId = json['RenterId'] == null ? null : json['RenterId'] as int;
    accountId = json['AccountId'] == null ? null : json['AccountId'] as int;
    invoiceTypeId =
        json['InvoiceTypeId'] == null ? null : json['InvoiceTypeId'] as int;
    amount =
        json['Amount'] == null ? null : double.parse(json['Amount'].toString());
    status = json['Status'] == null ? null : json['Status'] as bool;
    renter = json['Renter'] == null ? null : Renter.fromJson(json['Renter']);
  }
}
