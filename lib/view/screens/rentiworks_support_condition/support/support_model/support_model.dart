import 'dart:convert';

class SupportModel {
  String? message;
  Support? support;

  SupportModel({
    this.message,
    this.support,
  });

  factory SupportModel.fromRawJson(String str) =>
      SupportModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        message: json["message"],
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "support": support?.toJson(),
      };
}

class Support {
  String? id;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Support({
    this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Support.fromJson(Map<String, dynamic> json) => Support(
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
