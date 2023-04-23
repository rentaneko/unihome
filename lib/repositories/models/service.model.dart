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

class ServiceInInvoice {
  int? serviceId;
  String? serviceName;
  String? desc;
  bool? status;
  double? amount;
  int? buildingId;
  int? serviceTypeId;
  String? serviceTypeName;

  ServiceInInvoice.fromJson(dynamic json) {
    serviceId = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    buildingId = json['BuildingId'] == null ? null : json['BuildingId'] as int;
    serviceTypeId = json['ServiceType']['ServiceTypeId'] == null
        ? null
        : json['ServiceType']['ServiceTypeId'] as int;
    amount = json['Amount'] == null ? null : json['Amount'] as double;
    status = json['Status'] == null ? false : json['Status'] as bool;
    serviceName = json['Name'] == null ? null : json['Name'] as String;
    desc = json['Description'] == null ? null : json['Description'] as String;
    serviceTypeName = json['ServiceType']['Name'] == null
        ? null
        : json['ServiceType']['Name'] as String;
  }
}
