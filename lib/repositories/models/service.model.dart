class Services {
  int? id;
  String? name;
  String? description;
  bool? status;

  double? amount;

  int? serviceTypeId;

  Services({
    this.amount,
    this.description,
    this.id,
    this.name,
    this.serviceTypeId,
    this.status,
  });

  Services.fromJson(dynamic json) {
    id = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
    description =
        json['Description'] == null ? null : json['Description'] as String;
    status = json['Status'] == null ? null : json['Status'] as bool;
    amount = json['Amount'] == null ? null : json['Amount'] as double;
    serviceTypeId =
        json['ServiceTypeId'] == null ? null : json['ServiceTypeId'] as int;
  }
}
