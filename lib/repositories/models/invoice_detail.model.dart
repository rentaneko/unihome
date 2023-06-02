class InvoiceDetail {
  int? id;
  double? amount;
  double? price;
  int? invoiceId;
  int? serviceId;
  String? serviceName;
  String? wildCardForFee;
  String? placeHolderForFee;

  InvoiceDetail.fromJson(dynamic json) {
    id =
        json['InvoiceDetailId'] == null ? null : json['InvoiceDetailId'] as int;
    serviceName = json['Name'] == null ? null : json['Name'] as String;
    invoiceId = json['InvoiceId'] == null ? null : json['InvoiceId'] as int;
    serviceId = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    amount = json['Amount'] == null ? 1 : json['Amount'] as double;
    price = json['Price'] == null ? 0 : json['Price'] as double;
    wildCardForFee = json['WildcardIdForFee'] == null
        ? null
        : json['WildcardIdForFee'] as String;
    placeHolderForFee = json['PlaceholderForFee'] == null
        ? null
        : json['PlaceholderForFee'] as String;
  }
}
