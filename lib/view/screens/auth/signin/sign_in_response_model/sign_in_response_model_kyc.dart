class SignInResponseModelKyc {
  SignInResponseModelKyc({
      String? message, 
      User? user, 
      String? accessToken,}){
    _message = message;
    _user = user;
    _accessToken = accessToken;
}

  SignInResponseModelKyc.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['accessToken'];
  }
  String? _message;
  User? _user;
  String? _accessToken;

  String? get message => _message;
  User? get user => _user;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['accessToken'] = _accessToken;
    return map;
  }

}

class User {
  User({
      String? id, 
      String? fullName, 
      String? email, 
      String? phoneNumber, 
      String? gender, 
      String? address, 
      String? dateOfBirth, 
      String? password, 
      String? kyc, 
      String? rfc, 
      String? creaditCardNumber, 
      String? ine, 
      String? image, 
      String? role, 
      bool? emailVerified, 
      bool? approved, 
      String? isBanned, 
      String? oneTimeCode, 
      String? createdAt, 
      String? updatedAt, 
      int? v,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _gender = gender;
    _address = address;
    _dateOfBirth = dateOfBirth;
    _password = password;
    _kyc = kyc;
    _rfc = rfc;
    _creaditCardNumber = creaditCardNumber;
    _ine = ine;
    _image = image;
    _role = role;
    _emailVerified = emailVerified;
    _approved = approved;
    _isBanned = isBanned;
    _oneTimeCode = oneTimeCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _fullName = json['fullName'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _gender = json['gender'];
    _address = json['address'];
    _dateOfBirth = json['dateOfBirth'];
    _password = json['password'];
    _kyc = json['KYC'];
    _rfc = json['RFC'];
    _creaditCardNumber = json['creaditCardNumber'];
    _ine = json['ine'];
    _image = json['image'];
    _role = json['role'];
    _emailVerified = json['emailVerified'];
    _approved = json['approved'];
    _isBanned = json['isBanned'];
    _oneTimeCode = json['oneTimeCode'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _fullName;
  String? _email;
  String? _phoneNumber;
  String? _gender;
  String? _address;
  String? _dateOfBirth;
  String? _password;
  String? _kyc;
  String? _rfc;
  String? _creaditCardNumber;
  String? _ine;
  String? _image;
  String? _role;
  bool? _emailVerified;
  bool? _approved;
  String? _isBanned;
  String? _oneTimeCode;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get gender => _gender;
  String? get address => _address;
  String? get dateOfBirth => _dateOfBirth;
  String? get password => _password;
  String? get kyc => _kyc;
  String? get rfc => _rfc;
  String? get creaditCardNumber => _creaditCardNumber;
  String? get ine => _ine;
  String? get image => _image;
  String? get role => _role;
  bool? get emailVerified => _emailVerified;
  bool? get approved => _approved;
  String? get isBanned => _isBanned;
  String? get oneTimeCode => _oneTimeCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['gender'] = _gender;
    map['address'] = _address;
    map['dateOfBirth'] = _dateOfBirth;
    map['password'] = _password;
    map['KYC'] = _kyc;
    map['RFC'] = _rfc;
    map['creaditCardNumber'] = _creaditCardNumber;
    map['ine'] = _ine;
    map['image'] = _image;
    map['role'] = _role;
    map['emailVerified'] = _emailVerified;
    map['approved'] = _approved;
    map['isBanned'] = _isBanned;
    map['oneTimeCode'] = _oneTimeCode;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}