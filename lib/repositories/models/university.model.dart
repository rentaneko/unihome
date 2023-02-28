class University {
  int? id;
  String? name;
  String? description;
  String? status;
  String? address;

  University({this.address, this.description, this.id, this.name});

  University.fromJson(dynamic json) {
    id = json['UniversityId'] == null ? null : json['UniversityId'] as int;
    name = json['UniversityName'] == null
        ? null
        : json['UniversityName'] as String;
    description =
        json['Description'] == null ? null : json['Description'] as String;
    status = json['Status'] == null ? null : json['Status'] as String;
    address = json['Address'] == null ? null : json['Address'] as String;
  }
}
