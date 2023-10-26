class EditProfileModel {
  String? message;
  User? user;

  EditProfileModel({this.message, this.user});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? email;
  String? password;
  String? ine;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? kYC;
  String? rFC;
  String? creaditCardNumber;
  String? image;

  User(
      {this.sId,
      this.fullName,
      this.email,
      this.password,
      this.ine,
      this.role,
      this.emailVerified,
      this.approved,
      this.isBanned,
      this.oneTimeCode,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.phoneNumber,
      this.gender,
      this.address,
      this.dateOfBirth,
      this.kYC,
      this.rFC,
      this.creaditCardNumber,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    ine = json['ine'];
    role = json['role'];
    emailVerified = json['emailVerified'];
    approved = json['approved'];
    isBanned = json['isBanned'];
    oneTimeCode = json['oneTimeCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    kYC = json['KYC'];
    rFC = json['RFC'];
    creaditCardNumber = json['creaditCardNumber'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['ine'] = ine;
    data['role'] = role;
    data['emailVerified'] = emailVerified;
    data['approved'] = approved;
    data['isBanned'] = isBanned;
    data['oneTimeCode'] = oneTimeCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['address'] = address;
    data['dateOfBirth'] = dateOfBirth;
    data['KYC'] = kYC;
    data['RFC'] = rFC;
    data['creaditCardNumber'] = creaditCardNumber;
    data['image'] = image;
    return data;
  }
}
