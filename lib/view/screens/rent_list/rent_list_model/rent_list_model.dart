import 'dart:convert';

class RentListModel {
  String? message;
  List<RentedCar>? rentedCars;

  RentListModel({
    this.message,
    this.rentedCars,
  });

  factory RentListModel.fromRawJson(String str) => RentListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RentListModel.fromJson(Map<String, dynamic> json) => RentListModel(
    message: json["message"],
    rentedCars: json["rentedCars"] == null ? [] : List<RentedCar>.from(json["rentedCars"]!.map((x) => RentedCar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rentedCars": rentedCars == null ? [] : List<dynamic>.from(rentedCars!.map((x) => x.toJson())),
  };
}

class RentedCar {
  String? id;
  String? rentTripNumber;
  String? totalAmount;
  String? totalHours;
  String? requestStatus;
  String? sentRequest;
  DateTime? startDate;
  DateTime? endDate;
  String? payment;
  UserId? userId;
  CarId? carId;
  HostId? hostId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RentedCar({
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

  factory RentedCar.fromRawJson(String str) => RentedCar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RentedCar.fromJson(Map<String, dynamic> json) => RentedCar(
    id: json["_id"],
    rentTripNumber: json["rentTripNumber"],
    totalAmount: json["totalAmount"],
    totalHours: json["totalHours"],
    requestStatus: json["requestStatus"],
    sentRequest: json["sentRequest"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    payment: json["payment"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    carId: json["carId"] == null ? null : CarId.fromJson(json["carId"]),
    hostId: json["hostId"] == null ? null : HostId.fromJson(json["hostId"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    year: json["year"],
    carLicenseNumber: json["carLicenseNumber"],
    carDescription: json["carDescription"],
    insuranceStartDate: json["insuranceStartDate"],
    insuranceEndDate: json["insuranceEndDate"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

class HostId {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<dynamic>? kyc;
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

  HostId({
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
  });

  factory HostId.fromRawJson(String str) => HostId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HostId.fromJson(Map<String, dynamic> json) => HostId(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<dynamic>.from(json["KYC"]!.map((x) => x)),
    rfc: json["RFC"],
    image: json["image"],
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    creaditCardNumber: json["creaditCardNumber"],
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
  };
}

class UserId {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? ine;
  dynamic image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  dynamic oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? rfc;
  String? creaditCardNumber;
  double? averageRatings;

  UserId({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
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
    this.rfc,
    this.creaditCardNumber,
    this.averageRatings,
  });

  factory UserId.fromRawJson(String str) => UserId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    ine: json["ine"],
    image: json["image"],
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rfc: json["RFC"],
    creaditCardNumber: json["creaditCardNumber"],
    averageRatings: json["averageRatings"]?.toDouble(),
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
    "RFC": rfc,
    "creaditCardNumber": creaditCardNumber,
    "averageRatings": averageRatings,
  };
}
