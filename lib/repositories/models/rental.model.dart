import 'package:unihome/repositories/models/renter.model.dart';

class Rental {
  String? flatName;

  int? buildingId;
  String? buildingName;
  String? buildingPhone;
  String? buildingAddress;

  int? accountId;
  String? accountName;
  String? accountPhone;

  int? waterMeterAfter;
  int? electricityMeterAfter;
  int? priceForRent;
  int? priceForWater;
  int? priceForElectricity;
  int? priceForService;

  List<Renter>? renters;

  Rental.fromJson(dynamic json) {
    renters = json['Renters'] == null
        ? null
        : (json['Renters'] as List).map((e) => Renter.fromJson(e)).toList();
    flatName = json['FlatName'] == null ? null : json['FlatName'] as String;

    buildingId = json['BuildingDetailEntity']['BuildingId'] == null
        ? null
        : json['BuildingDetailEntity']['BuildingId'] as int;
    buildingName = json['BuildingDetailEntity']['BuildingName'] == null
        ? null
        : json['BuildingDetailEntity']['BuildingName'] as String;
    buildingAddress = json['BuildingDetailEntity']['BuildingAddress'] == null
        ? null
        : json['BuildingDetailEntity']['BuildingAddress'] as String;
    buildingPhone = json['BuildingDetailEntity']['BuildingPhoneNumber'] == null
        ? null
        : json['BuildingDetailEntity']['BuildingPhoneNumber'] as String;

    accountId = json['BuildingDetailEntity']['Account']['AccountId'] == null
        ? null
        : json['BuildingDetailEntity']['Account']['AccountId'] as int;
    accountName = json['BuildingDetailEntity']['Account']['FullName'] == null
        ? null
        : json['BuildingDetailEntity']['Account']['FullName'] as String;
    accountPhone = json['BuildingDetailEntity']['Account']['Phone'] == null
        ? null
        : json['BuildingDetailEntity']['Account']['Phone'] as String;

    waterMeterAfter = json['FlatMeterEntity']['WaterMeterAfter'] == null
        ? 0
        : int.parse(json['FlatMeterEntity']['WaterMeterAfter'].toString());
    electricityMeterAfter =
        json['FlatMeterEntity']['ElectricityMeterAfter'] == null
            ? 0
            : int.parse(
                json['FlatMeterEntity']['ElectricityMeterAfter'].toString());
    priceForElectricity = json['FlatMeterEntity']['PriceForElectricity'] == null
        ? 0
        : int.parse(json['FlatMeterEntity']['PriceForElectricity']);
    priceForService = json['FlatMeterEntity']['PriceForService'] == null
        ? 0
        : int.parse(json['FlatMeterEntity']['PriceForService']);
    priceForWater = json['FlatMeterEntity']['PriceForWater'] == null
        ? 0
        : int.parse(json['FlatMeterEntity']['PriceForWater']);
    priceForRent = json['FlatMeterEntity']['PriceForRent'] == null
        ? 0
        : int.parse(json['FlatMeterEntity']['PriceForRent']);
  }

  Rental({
    this.accountId,
    this.accountName,
    this.accountPhone,
    this.buildingAddress,
    this.buildingId,
    this.buildingName,
    this.buildingPhone,
    this.electricityMeterAfter,
    this.flatName,
    this.priceForElectricity,
    this.priceForRent,
    this.priceForService,
    this.priceForWater,
    this.renters,
    this.waterMeterAfter,
  });
}
