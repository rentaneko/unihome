import 'package:unihome/repositories/models/service_type.model.dart';

class Services {
  int? id;
  String? name;
  String? description;
  bool? checked;
  double? amount;

  ServiceType? serviceType;

  Services({
    this.amount,
    this.description,
    this.id,
    this.name,
    this.serviceType,
  });

  Services.fromJson(dynamic json) {
    id = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
    description =
        json['Description'] == null ? null : json['Description'] as String;
    amount = json['Amount'] == null ? null : json['Amount'] as double;
    serviceType = json['ServiceType'] == null
        ? null
        : ServiceType.fromJson(json['ServiceType']);
    checked = false;
  }
}
