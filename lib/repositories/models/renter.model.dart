import 'package:unihome/repositories/models/major.model.dart';
import 'package:unihome/repositories/models/university.model.dart';

class Renter {
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? birthdate;
  String? imageUrl;
  String? citizenNumber;
  String? citizenImageUrl;
  String? address;
  String? gender;
  String? deviceToken;

  bool? status;

  int? id;
  int? majorId;
  int? universityId;

  Major? major;
  University? university;

  Renter({
    this.address,
    this.birthdate,
    this.citizenImageUrl,
    this.citizenNumber,
    this.deviceToken,
    this.email,
    this.fullname,
    this.gender,
    this.id,
    this.imageUrl,
    this.major,
    this.majorId,
    this.phone,
    this.status,
    this.university,
    this.universityId,
    this.username,
  });

  Renter.fromJson(dynamic json) {
    id = json['RenterId'] == null ? null : json['RenterId'] as int;
    username = json['Username'] == null ? null : json['Username'] as String;
    email = json['Email'] == null ? null : json['Email'] as String;
    phone = json['Phone'] == null ? null : json['Phone'] as String;
    fullname = json['FullName'] == null ? null : json['FullName'] as String;
    birthdate = json['BirthDate'] == null ? null : json['BirthDate'] as String;
    imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    citizenNumber =
        json['CitizenNumber'] == null ? null : json['CitizenNumber'] as String;
    citizenImageUrl = json['CitizenImageUrl'] == null
        ? null
        : json['CitizenImageUrl'] as String;
    address = json['Address'] == null ? null : json['Address'] as String;
    gender = json['Gender'] == null ? null : json['Gender'] as String;
    deviceToken =
        json['DeviceToken'] == null ? null : json['DeviceToken'] as String;

    status = json['Status'] == null ? null : json['Status'] as bool;

    majorId = json['MajorId'] == null ? null : json['MajorId'] as int;
    universityId =
        json['UniversityId'] == null ? null : json['UniversityId'] as int;

    major = json['Major'] == null ? null : Major.fromJson(json['Major']);
    university = json['University'] == null
        ? null
        : University.fromJson(json['University']);
  }
}
