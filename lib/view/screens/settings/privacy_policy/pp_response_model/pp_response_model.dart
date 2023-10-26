class PrivacyPolicyModel {
  String? message;
  PrivacyPolicy? privacyPolicy;

  PrivacyPolicyModel({this.message, this.privacyPolicy});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    privacyPolicy = json['privacyPolicy'] != null
        ? PrivacyPolicy.fromJson(json['privacyPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (privacyPolicy != null) {
      data['privacyPolicy'] = privacyPolicy!.toJson();
    }
    return data;
  }
}

class PrivacyPolicy {
  String? sId;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PrivacyPolicy(
      {this.sId, this.content, this.createdAt, this.updatedAt, this.iV});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
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
