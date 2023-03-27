import 'package:jiffy/jiffy.dart';
import 'package:unihome/repositories/models/renter.model.dart';

class Contract {
  int? id;
  String? name;
  String? dateSigned;
  String? startDate;
  String? endDate;
  String? description;
  String? lastUpdated;
  String? status;

  Contract.fromJson(dynamic json) {
    id = json['ContractId'] == null
        ? null
        : int.parse(json['ContractId'].toString());
    name = json['ContractName'] == null ? null : json['ContractName'] as String;
    dateSigned = json['DateSigned'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['DateSigned'].toString()).format('dd/MM/yyyy');
    endDate = json['EndDate'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['EndDate'].toString()).format('dd/MM/yyyy');
    startDate = json['StartDate'] == null
        ? null
        : Jiffy(json['StartDate'].toString()).format('dd/MM/yyyy');
    description =
        json['Description'] == null ? null : json['Description'] as String;
    lastUpdated = json['LastUpdated'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['LastUpdated'].toString()).format('dd/MM/yyyy');
    status = json['ContractStatus'] == null
        ? null
        : json['ContractStatus'] as String;
  }

  Contract({
    this.dateSigned,
    this.description,
    this.endDate,
    this.id,
    this.lastUpdated,
    this.name,
    this.startDate,
    this.status,
  });
}

class ContractDetail {
  int? contractId;
  String? contractName;
  String? dateSigned;
  String? dateStarted;
  String? dateEnd;
  String? description;
  String? lastUpdated;
  String? status;
  int? roomId;
  int? priceForRent;
  int? priceForWater;
  int? priceForElectric;
  int? priceForService;

  int? buildingId;
  String? buildingName;
  String? buildingPhone;
  String? buildingAddress;

  Renter? renter;

  ContractDetail({
    this.buildingAddress,
    this.buildingId,
    this.buildingName,
    this.buildingPhone,
    this.contractId,
    this.contractName,
    this.dateEnd,
    this.dateSigned,
    this.dateStarted,
    this.description,
    this.lastUpdated,
    this.priceForElectric,
    this.priceForRent,
    this.priceForService,
    this.priceForWater,
    this.renter,
    this.roomId,
    this.status,
  });

  ContractDetail.fromJson(dynamic json) {
    contractId = json['ContractMeterDetail']['ContractId'] == null
        ? null
        : json['ContractMeterDetail']['ContractId'] as int;
    contractName = json['ContractMeterDetail']['ContractName'] == null
        ? null
        : json['ContractMeterDetail']['ContractName'] as String;
    dateSigned = json['ContractMeterDetail']['DateSigned'] == null
        ? null
        : Jiffy(json['ContractMeterDetail']['DateSigned']).format('dd/MM/yyyy');
    dateEnd = json['ContractMeterDetail']['EndDate'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['ContractMeterDetail']['EndDate']).format('dd/MM/yyyy');
    dateStarted = json['ContractMeterDetail']['StartDate'] == null
        ? null
        : Jiffy(json['ContractMeterDetail']['StartDate']).format('dd/MM/yyyy');
    lastUpdated = json['ContractMeterDetail']['LastUpdated'] == null
        ? 'Chưa cập nhật'
        : Jiffy(json['ContractMeterDetail']['LastUpdated'])
            .format('dd/MM/yyyy');
    description = json['ContractMeterDetail']['Description'] == null
        ? null
        : json['ContractMeterDetail']['Description'] as String;
    status = json['ContractMeterDetail']['ContractStatus'] == null
        ? null
        : json['ContractMeterDetail']['ContractStatus'] as String;
    roomId = json['ContractMeterDetail']['RoomId'] == null
        ? null
        : json['ContractMeterDetail']['RoomId'] as int;
    priceForElectric =
        json['ContractMeterDetail']['PriceForElectricity'] == null
            ? 0
            : int.parse(json['ContractMeterDetail']['PriceForElectricity']);
    priceForRent = json['ContractMeterDetail']['PriceForRent'] == null
        ? 0
        : int.parse(json['ContractMeterDetail']['PriceForRent']);
    priceForService = json['ContractMeterDetail']['PriceForService'] == null
        ? 0
        : int.parse(json['ContractMeterDetail']['PriceForService']);
    priceForWater = json['ContractMeterDetail']['PriceForWater'] == null
        ? 0
        : int.parse(json['ContractMeterDetail']['PriceForWater']);

    buildingId = json['Building']['BuildingId'] == null
        ? null
        : json['Building']['BuildingId'] as int;
    buildingName = json['Building']['BuildingName'] == null
        ? null
        : json['Building']['BuildingName'] as String;
    buildingPhone = json['Building']['BuildingPhoneNumber'] == null
        ? null
        : json['Building']['BuildingPhoneNumber'] as String;
    buildingAddress = json['Building']['BuildingAddress'] == null
        ? null
        : json['Building']['BuildingAddress'] as String;

    renter = json['Renter'] == null ? null : Renter.fromJson(json['Renter']);
  }
}
