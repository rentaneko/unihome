class AdminAccount {
  int? id;
  String? username;
  String? fullname;
  String? email;
  String? phone;

  AdminAccount({
    this.email,
    this.fullname,
    this.id,
    this.phone,
    this.username,
  });

  AdminAccount.fromJson(dynamic json) {
    id = json['EmployeeId'] == null ? null : json['EmployeeId'] as int;
    username = json['Username'] == null ? null : json['Username'] as String;
    fullname = json['FullName'] == null ? null : json['FullName'] as String;
    email = json['Email'] == null ? null : json['Email'] as String;
    phone = json['Phone'] == null ? null : json['Phone'] as String;
  }
}
