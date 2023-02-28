class Contract {
  int? id;
  String? name;
  String? dateSigned;
  String? startDate;
  String? description;
  String? lastUpdated;
  String? status;
  String? imageUrl;

  double? priceForRent;
  double? priceForWater;
  double? priceForElectricity;
  double? priceForService;

  Contract({
    this.dateSigned,
    this.description,
    this.id,
    this.imageUrl,
    this.lastUpdated,
    this.name,
    this.priceForElectricity,
    this.priceForService,
    this.priceForWater,
    this.startDate,
    this.status,
    this.priceForRent,
  });

  Contract.fromJson(dynamic json) {
    id = json['ContractId'] == null ? null : json['ContractId'] as int;
    name = json['ContractName'] == null ? null : json['ContractName'] as String;
    dateSigned =
        json['DateSigned'] == null ? null : json['DateSigned'] as String;
    startDate = json['StartDate'] == null ? null : json['StartDate'] as String;
    description =
        json['Description'] == null ? null : json['Description'] as String;
    lastUpdated =
        json['LastUpdated'] == null ? null : json['LastUpdated'] as String;
    status = json['ContractStatus'] == null
        ? null
        : json['ContractStatus'] as String;
    imageUrl = json['ImageUrl'] == null ? null : json['ImageUrl'] as String;

    priceForWater =
        json['PriceForWater'] == null ? 0 : json['PriceForWater'] as double;
    priceForElectricity = json['PriceForElectricity'] == null
        ? 0
        : json['PriceForElectricity'] as double;
    priceForService =
        json['PriceForService'] == null ? 0 : json['PriceForService'] as double;
    priceForRent =
        json['PriceForRent'] == null ? 0 : json['PriceForRent'] as double;
  }
}
