class ServiceType {
  int? serviceTypeId;
  String? name;

  ServiceType({this.name, this.serviceTypeId});

  ServiceType.fromJson(dynamic json) {
    serviceTypeId =
        json['ServiceTypeId'] == null ? null : json['ServiceTypeId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
  }
}
