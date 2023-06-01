class Services {
  int? serviceId;
  String? serviceName;
  String? desc;
  bool? status;
  String? price;
  int? buildingId;
  int? serviceTypeId;
  bool? checked;

  Services({
    this.price,
    this.buildingId,
    this.desc,
    this.serviceId,
    this.serviceName,
    this.serviceTypeId,
    this.status,
    this.checked,
  });

  Services.fromJson(dynamic json) {
    serviceId = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    serviceName = json['Name'] == null ? null : json['Name'] as String;
    desc = json['Description'] == null ? null : json['Description'] as String;
    price =
        json['ServicePrice '] == null ? '0' : json['ServicePrice '] as String;

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
  // int? serviceTypeId;
  // String? serviceTypeName;

  ServiceInInvoice.fromJson(dynamic json) {
    serviceId = json['ServiceId'] == null ? null : json['ServiceId'] as int;
    buildingId = json['BuildingId'] == null ? null : json['BuildingId'] as int;
    // serviceTypeId = json['ServiceType']['ServiceTypeId'] == null
    //     ? null
    //     : json['ServiceType']['ServiceTypeId'] as int;
    amount = json['Amount'] == null ? 0 : json['Amount'] as double;
    status = json['Status'] == null ? false : json['Status'] as bool;
    serviceName = json['Name'] == null ? null : json['Name'] as String;
    desc = json['Description'] == null ? null : json['Description'] as String;
    // serviceTypeName = json['ServiceType']['Name'] == null
    //     ? null
    //     : json['ServiceType']['Name'] as String;
  }
}
