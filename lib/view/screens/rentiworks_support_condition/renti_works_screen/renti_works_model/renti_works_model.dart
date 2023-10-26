import 'dart:convert';

class RentiWorksModel {
  String? message;
  HowRentiWork? howRentiWork;

  RentiWorksModel({
    this.message,
    this.howRentiWork,
  });

  factory RentiWorksModel.fromRawJson(String str) =>
      RentiWorksModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RentiWorksModel.fromJson(Map<String, dynamic> json) =>
      RentiWorksModel(
        message: json["message"],
        howRentiWork: json["howRentiWork"] == null
            ? null
            : HowRentiWork.fromJson(json["howRentiWork"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "howRentiWork": howRentiWork?.toJson(),
      };
}

class HowRentiWork {
  String? id;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  HowRentiWork({
    this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HowRentiWork.fromRawJson(String str) =>
      HowRentiWork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HowRentiWork.fromJson(Map<String, dynamic> json) => HowRentiWork(
        id: json["_id"],
        content: json["content"],
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
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
