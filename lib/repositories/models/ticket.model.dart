import 'package:jiffy/jiffy.dart';
import 'package:unihome/repositories/models/contract.model.dart';

class Ticket {
  int? id;
  String? desc;
  String? name;
  String? status;
  String? createdDate;
  String? solveDate;
  List<String>? imageUrl;
  double? amount;

  Contract? contract;

  TicketType? ticketType;

  Ticket({
    this.name,
    this.desc,
    this.id,
    this.amount,
    this.createdDate,
    this.status,
    this.contract,
    this.imageUrl,
    this.solveDate,
    this.ticketType,
  });

  Ticket.fromJson(dynamic json) {
    id = json['TicketId'] == null ? null : json['TicketId'] as int;
    desc = json['Description'] == null
        ? 'Chưa cập nhật'
        : json['Description'] as String;
    name = json['TicketName'] == null
        ? 'Chưa cập nhật'
        : json['TicketName'] as String;
    status =
        json['Status'] == null ? 'Chưa cập nhật' : json['Status'] as String;
    createdDate = json['CreateDate'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['CreateDate']).format('dd/MM/yyyy');
    solveDate = json['SolveDate'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['SolveDate']).format('dd/MM/yyyy');
    amount =
        json['Amount'] == null ? 0 : double.parse(json['Amount'].toString());
    contract =
        json['Contract'] == null ? null : Contract.fromJson(json['Contract']);
    ticketType = json['TicketType'] == null
        ? null
        : TicketType.fromJson(json['TicketType']);
    // imageUrl = json[''] == null
    //     ? null
    //     : (json[''] as List).map((e) => e.toString()).toList();
  }
}

class TicketType {
  int? id;
  String? name;
  String? desc;

  TicketType({this.desc, this.id, this.name});

  TicketType.fromJson(dynamic json) {
    id = json['TicketTypeId'] == null
        ? null
        : int.parse(json['TicketTypeId'].toString());
    name = json['TicketTypeName'] == null
        ? null
        : json['TicketTypeName'] as String;
    desc = json['Description'] == null ? null : json['Description'] as String;
  }
}
