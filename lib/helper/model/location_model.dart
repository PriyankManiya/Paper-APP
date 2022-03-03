class LocationModel {
  LocationModel({
    this.id,
    this.address,
    this.postcode,
    this.isDefault,
  });

  int id;
  String address;
  String postcode;
  bool isDefault;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    id: json["id"] == null ? null :  json["id"],
    address: json["address"] == null ? null :json["address"],
    postcode: json["postcode"] == null ? null : json["postcode"],
    isDefault: json["isDefault"] == null ? false : json["isDefault"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address": address == null ? null : address,
    "postcode": postcode == null ? null : postcode,
    "isDefault": isDefault == null ? false : isDefault,
  };
}