class AboutUsModel {
  String? message;
  About? about;

  AboutUsModel({this.message, this.about});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    about = json['about'] != null ? About.fromJson(json['about']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (about != null) {
      data['about'] = about!.toJson();
    }
    return data;
  }
}

class About {
  String? sId;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? iV;

  About({this.sId, this.content, this.createdAt, this.updatedAt, this.iV});

  About.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
