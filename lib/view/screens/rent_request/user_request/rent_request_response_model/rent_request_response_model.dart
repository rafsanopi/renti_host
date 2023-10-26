import 'dart:convert';

class RentRequestResponseModel {
  String? message;
  List<RentRequest>? rentRequest;

  RentRequestResponseModel({
    this.message,
    this.rentRequest,
  });

  factory RentRequestResponseModel.fromRawJson(String str) =>
      RentRequestResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RentRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      RentRequestResponseModel(
        message: json["message"],
        rentRequest: json["rentRequest"] == null
            ? []
            : List<RentRequest>.from(
                json["rentRequest"]!.map((x) => RentRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "rentRequest": rentRequest == null
            ? []
            : List<dynamic>.from(rentRequest!.map((x) => x.toJson())),
      };
}

class RentRequest {
  String? id;
  String? rentTripNumber;
  String? totalAmount;
  String? totalHours;
  String? requestStatus;
  String? sentRequest;
  DateTime? startDate;
  DateTime? endDate;
  String? payment;
  Id? userId;
  CarId? carId;
  Id? hostId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RentRequest({
    this.id,
    this.rentTripNumber,
    this.totalAmount,
    this.totalHours,
    this.requestStatus,
    this.sentRequest,
    this.startDate,
    this.endDate,
    this.payment,
    this.userId,
    this.carId,
    this.hostId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RentRequest.fromRawJson(String str) =>
      RentRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RentRequest.fromJson(Map<String, dynamic> json) => RentRequest(
        id: json["_id"],
        rentTripNumber: json["rentTripNumber"],
        totalAmount: json["totalAmount"],
        totalHours: json["totalHours"],
        requestStatus: json["requestStatus"],
        sentRequest: json["sentRequest"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        payment: json["payment"],
        userId: json["userId"] == null ? null : Id.fromJson(json["userId"]),
        carId: json["carId"] == null ? null : CarId.fromJson(json["carId"]),
        hostId: json["hostId"] == null ? null : Id.fromJson(json["hostId"]),
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
        "rentTripNumber": rentTripNumber,
        "totalAmount": totalAmount,
        "totalHours": totalHours,
        "requestStatus": requestStatus,
        "sentRequest": sentRequest,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "payment": payment,
        "userId": userId?.toJson(),
        "carId": carId?.toJson(),
        "hostId": hostId?.toJson(),
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
  String? offerHourlyRate;
  String? registrationDate;
  int? popularity;
  String? gearType;
  String? carType;
  String? specialCharacteristics;
  bool? activeReserve;
  String? tripStatus;
  String? carOwner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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
    this.offerHourlyRate,
    this.registrationDate,
    this.popularity,
    this.gearType,
    this.carType,
    this.specialCharacteristics,
    this.activeReserve,
    this.tripStatus,
    this.carOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
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
        offerHourlyRate: json["offerHourlyRate"],
        registrationDate: json["registrationDate"],
        popularity: json["popularity"],
        gearType: json["gearType"],
        carType: json["carType"],
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
        "offerHourlyRate": offerHourlyRate,
        "registrationDate": registrationDate,
        "popularity": popularity,
        "gearType": gearType,
        "carType": carType,
        "specialCharacteristics": specialCharacteristics,
        "activeReserve": activeReserve,
        "tripStatus": tripStatus,
        "carOwner": carOwner,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
