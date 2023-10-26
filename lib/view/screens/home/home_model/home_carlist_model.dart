import 'dart:convert';

class HomeCarListModel {
  String? message;
  int? totalCar;
  int? activeCar;
  int? reservedCar;
  List<Car>? cars;
  Pagination? pagination;

  HomeCarListModel({
    this.message,
    this.totalCar,
    this.activeCar,
    this.reservedCar,
    this.cars,
    this.pagination,
  });

  factory HomeCarListModel.fromRawJson(String str) =>
      HomeCarListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeCarListModel.fromJson(Map<String, dynamic> json) =>
      HomeCarListModel(
        message: json["message"],
        totalCar: json["totalCar"],
        activeCar: json["activeCar"],
        reservedCar: json["reservedCar"],
        cars: json["cars"] == null ? []
            : List<Car>.from(json["cars"]!.map((x) => Car.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "totalCar": totalCar,
        "activeCar": activeCar,
        "reservedCar": reservedCar,
        "cars": cars == null
            ? []
            : List<dynamic>.from(cars!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Car {
  String? id;
  String? carModelName;
  dynamic ?image;
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
  String? paymentId;
  List<String>? carImage;
  String? userId;

  Car({
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
    this.paymentId,
    this.carImage,
    this.userId,
  });

  factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        carModelName: json["carModelName"],
        image: json["image"],
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
        paymentId: json["paymentId"],
        carImage: json["carImage"] == null
            ? []
            : List<String>.from(json["carImage"]!.map((x) => x)),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "carModelName": carModelName,
        "image": image,
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
        "paymentId": paymentId,
        "carImage":
            carImage == null ? [] : List<dynamic>.from(carImage!.map((x) => x)),
        "userId": userId,
      };
}

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  dynamic previousPage;
  dynamic nextPage;

  Pagination({
    this.totalDocuments,
    this.totalPage,
    this.currentPage,
    this.previousPage,
    this.nextPage,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalDocuments: json["totalDocuments"],
        totalPage: json["totalPage"],
        currentPage: json["currentPage"],
        previousPage: json["previousPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalDocuments": totalDocuments,
        "totalPage": totalPage,
        "currentPage": currentPage,
        "previousPage": previousPage,
        "nextPage": nextPage,
      };
}
