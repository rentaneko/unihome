class Ticket {
  int? id;
  String? name;
  String? desc;
  String? type;
  String? status;
  String? createdDate;
  double? amount;

  Ticket({
    this.desc,
    this.id,
    this.name,
    this.type,
    this.amount,
    this.createdDate,
    this.status,
  });

  Ticket.fromJson(dynamic json) {
    id = json['TicketId'] == null ? null : json['TicketId'] as int;
    name = json['TicketName'] == null ? null : json['TicketName'] as String;
    desc = json['Description'] == null ? null : json['Description'] as String;
    type = json['TicketType']['TicketTypeName'] == null
        ? null
        : json['TicketType']['TicketTypeName'] as String;
    status = json['Status'] == null ? null : json['Status'] as String;
    createdDate =
        json['CreateDate'] == null ? null : json['CreateDate'] as String;
    amount =
        json['Amount'] == null ? 0 : double.parse(json['Amount'].toString());
  }
}
