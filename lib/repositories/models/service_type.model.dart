class ServiceType {
  int? serviceTypeId;
  String? name;
  String? status;

  ServiceType({this.name, this.serviceTypeId, this.status});

  ServiceType.fromJson(dynamic json) {
    serviceTypeId =
        json['ServiceTypeId'] == null ? null : json['ServiceTypeId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
    status = json['Status'] == null ? null : json['Status'] as String;
  }
}
