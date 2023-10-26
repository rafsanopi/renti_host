import 'dart:convert';

class SignInResponseModel {
  String? message;
  User? user;
  String? accessToken;

  SignInResponseModel({
    this.message,
    this.user,
    this.accessToken,
  });

  factory SignInResponseModel.fromRawJson(String str) =>
      SignInResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "accessToken": accessToken,
      };
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? rfc;
  String? creaditCardNumber;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
    this.rfc,
    this.creaditCardNumber,
    this.ine,
    this.image,
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        password: json["password"],
        kyc: json["KYC"] == null
            ? []
            : List<String>.from(json["KYC"]!.map((x) => x)),
        rfc: json["RFC"],
        creaditCardNumber: json["creaditCardNumber"],
        ine: json["ine"],
        image: json["image"],
        role: json["role"],
        emailVerified: json["emailVerified"],
        approved: json["approved"],
        isBanned: json["isBanned"],
        oneTimeCode: json["oneTimeCode"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "address": address,
        "dateOfBirth": dateOfBirth,
        "password": password,
        "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
        "RFC": rfc,
        "creaditCardNumber": creaditCardNumber,
        "ine": ine,
        "image": image,
        "role": role,
        "emailVerified": emailVerified,
        "approved": approved,
        "isBanned": isBanned,
        "oneTimeCode": oneTimeCode,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
