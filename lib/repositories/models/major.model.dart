class Major {
  int? id;
  String? name;
  int? universityId;

  Major({this.id, this.name, this.universityId});

  Major.fromJson(dynamic json) {
    id = json['MajorId'] == null ? null : json['MajorId'] as int;
    name = json['Name'] == null ? null : json['Name'] as String;
    universityId =
        json['UniversityId'] == null ? null : json['UniversityId'] as int;
  }
}
