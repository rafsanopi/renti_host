import 'dart:convert';

class ReviewModel {
  String? message;
  List<Review>? review;

  ReviewModel({
    this.message,
    this.review,
  });

  factory ReviewModel.fromRawJson(String str) =>
      ReviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        message: json["message"],
        review: json["review"] == null
            ? []
            : List<Review>.from(json["review"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "review": review == null
            ? []
            : List<dynamic>.from(review!.map((x) => x.toJson())),
      };
}

class Review {
  String? id;
  Id? userId;
  Id? hostId;
  CarId? carId;
  String? reviewer;
  int? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Review({
    this.id,
    this.userId,
    this.hostId,
    this.carId,
    this.reviewer,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        userId: json["userId"] == null ? null : Id.fromJson(json["userId"]),
        hostId: json["hostId"] == null ? null : Id.fromJson(json["hostId"]),
        carId: json["carId"] == null ? null : CarId.fromJson(json["carId"]),
        reviewer: json["reviewer"],
        rating: json["rating"],
        comment: json["comment"],
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
        "userId": userId?.toJson(),
        "hostId": hostId?.toJson(),
        "carId": carId?.toJson(),
        "reviewer": reviewer,
        "rating": rating,
        "comment": comment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CarId {
  String? id;
  String? carModelName;
  List<String>? image;
  int? year;
  String? carLicenseNumber;
  String? carDescription;
  String? insuranceStartDate;
  String? insuranceEndDate;
  List<String>? kyc;
  String? carColor;
  String? carDoors;
  String? carSeats;
  String? totalRun;
  String? hourlyRate;
  String? registrationDate;
  int? popularity;
  String? gearType;
  String? specialCharacteristics;
  bool? activeReserve;
  String? tripStatus;
  String? carOwner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  double? averageRatings;
  String? carType;

  CarId({
    this.id,
    this.carModelName,
    this.image,
    this.year,
    this.carLicenseNumber,
    this.carDescription,
    this.insuranceStartDate,
    this.insuranceEndDate,
    this.kyc,
    this.carColor,
    this.carDoors,
    this.carSeats,
    this.totalRun,
    this.hourlyRate,
    this.registrationDate,
    this.popularity,
    this.gearType,
    this.specialCharacteristics,
    this.activeReserve,
    this.tripStatus,
    this.carOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.averageRatings,
    this.carType,
  });

  factory CarId.fromRawJson(String str) => CarId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarId.fromJson(Map<String, dynamic> json) => CarId(
        id: json["_id"],
        carModelName: json["carModelName"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        year: json["year"],
        carLicenseNumber: json["carLicenseNumber"],
        carDescription: json["carDescription"],
        insuranceStartDate: json["insuranceStartDate"],
        insuranceEndDate: json["insuranceEndDate"],
        kyc: json["KYC"] == null
            ? []
            : List<String>.from(json["KYC"]!.map((x) => x)),
        carColor: json["carColor"],
        carDoors: json["carDoors"],
        carSeats: json["carSeats"],
        totalRun: json["totalRun"],
        hourlyRate: json["hourlyRate"],
        registrationDate: json["registrationDate"],
        popularity: json["popularity"],
        gearType: json["gearType"],
        specialCharacteristics: json["specialCharacteristics"],
        activeReserve: json["activeReserve"],
        tripStatus: json["tripStatus"],
        carOwner: json["carOwner"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        averageRatings: json["averageRatings"]?.toDouble(),
        carType: json["carType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "carModelName": carModelName,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "year": year,
        "carLicenseNumber": carLicenseNumber,
        "carDescription": carDescription,
        "insuranceStartDate": insuranceStartDate,
        "insuranceEndDate": insuranceEndDate,
        "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
        "carColor": carColor,
        "carDoors": carDoors,
        "carSeats": carSeats,
        "totalRun": totalRun,
        "hourlyRate": hourlyRate,
        "registrationDate": registrationDate,
        "popularity": popularity,
        "gearType": gearType,
        "specialCharacteristics": specialCharacteristics,
        "activeReserve": activeReserve,
        "tripStatus": tripStatus,
        "carOwner": carOwner,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "averageRatings": averageRatings,
        "carType": carType,
      };
}

class Id {
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
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  dynamic oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? creaditCardNumber;
  String? ine;
  int? averageRatings;

  Id({
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
    this.image,
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.creaditCardNumber,
    this.ine,
    this.averageRatings,
  });

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
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
        creaditCardNumber: json["creaditCardNumber"],
        ine: json["ine"],
        averageRatings: json["averageRatings"],
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
        "image": image,
        "role": role,
        "emailVerified": emailVerified,
        "approved": approved,
        "isBanned": isBanned,
        "oneTimeCode": oneTimeCode,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "creaditCardNumber": creaditCardNumber,
        "ine": ine,
        "averageRatings": averageRatings,
      };
}
