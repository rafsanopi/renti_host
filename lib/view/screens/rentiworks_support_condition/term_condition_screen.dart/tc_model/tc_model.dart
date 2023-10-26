class TermConditionModel {
  String? message;
  TermsCondition? termsCondition;

  TermConditionModel({this.message, this.termsCondition});

  TermConditionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    termsCondition = json['termsCondition'] != null
        ? TermsCondition.fromJson(json['termsCondition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (termsCondition != null) {
      data['termsCondition'] = termsCondition!.toJson();
    }
    return data;
  }
}

class TermsCondition {
  String? sId;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TermsCondition(
      {this.sId, this.content, this.createdAt, this.updatedAt, this.iV});

  TermsCondition.fromJson(Map<String, dynamic> json) {
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
