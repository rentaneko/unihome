class Technician {
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? imageUrl;
  String? address;
  int? renterId;

  Technician.fromJson(dynamic json) {
    renterId = json['RenterId'] == null ? null : json['RenterId'] as int;
    username =
        json['Username'] == null ? 'Chưa cập nhật' : json['Username'] as String;
    email = json['Email'] == null ? 'Chưa cập nhật' : json['Email'] as String;
    phone = json['Phone'] == null ? 'Chưa cập nhật' : json['Phone'] as String;
    fullname =
        json['FullName'] == null ? 'Chưa cập nhật' : json['FullName'] as String;
    imageUrl = json['EmployeeImageUrl'] == null
        ? null
        : json['EmployeeImageUrl'] as String;
    address =
        json['Address'] == null ? 'Chưa cập nhật' : json['Address'] as String;
  }

  Technician({
    this.address,
    this.email,
    this.fullname,
    this.phone,
    this.renterId,
    this.username,
    this.imageUrl,
  });
}
