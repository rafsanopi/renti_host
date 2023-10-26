import 'dart:convert';

class AdminInfoModel {
  String? message;
  List<AdminDatum>? adminData;

  AdminInfoModel({
    this.message,
    this.adminData,
  });

  factory AdminInfoModel.fromRawJson(String str) => AdminInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdminInfoModel.fromJson(Map<String, dynamic> json) => AdminInfoModel(
    message: json["message"],
    adminData: json["adminData"] == null ? [] : List<AdminDatum>.from(json["adminData"]!.map((x) => AdminDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "adminData": adminData == null ? [] : List<dynamic>.from(adminData!.map((x) => x.toJson())),
  };
}

class AdminDatum {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;

  AdminDatum({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
  });

  factory AdminDatum.fromRawJson(String str) => AdminDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdminDatum.fromJson(Map<String, dynamic> json) => AdminDatum(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "address": address,
  };
}
