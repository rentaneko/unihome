import 'package:unihome/repositories/models/major.model.dart';
import 'package:unihome/repositories/models/university.model.dart';

class Renter {
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? birthdate;
  // String? imageUrl;
  String? address;
  String? gender;
  int? renterId;

  Renter.fromJson(dynamic json) {
    renterId = json['RenterId'] == null ? null : json['RenterId'] as int;
    username = json['Username'] == null ? null : json['Username'] as String;
    email = json['Email'] == null ? null : json['Email'] as String;
    phone = json['Phone'] == null ? null : json['Phone'] as String;
    fullname = json['FullName'] == null ? null : json['FullName'] as String;
    birthdate = json['BirthDate'] == null ? null : json['BirthDate'] as String;
    // imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;
    address = json['Address'] == null ? null : json['Address'] as String;
    gender = json['Gender'] == null ? null : json['Gender'] as String;
  }

  Renter({
    this.address,
    this.birthdate,
    this.email,
    this.fullname,
    this.gender,
    this.phone,
    this.renterId,
    this.username,
  });
}
