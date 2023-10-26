class CardDetailsModel {
  CardDetailsModel({
      String? message, 
      List<Card>? card,}){
    _message = message;
    _card = card;
}

  CardDetailsModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['card'] != null) {
      _card = [];
      json['card'].forEach((v) {
        _card?.add(Card.fromJson(v));
      });
    }
  }
  String? _message;
  List<Card>? _card;

  String? get message => _message;
  List<Card>? get card => _card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_card != null) {
      map['card'] = _card?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Card {
  Card({
      String? id, 
      String? accountHolderName, 
      String? phoneNumber, 
      String? email, 
      String? bankAccountNumber, 
      String? addedBy, 
      String? createdAt, 
      String? updatedAt, 
      int? v,}){
    _id = id;
    _accountHolderName = accountHolderName;
    _phoneNumber = phoneNumber;
    _email = email;
    _bankAccountNumber = bankAccountNumber;
    _addedBy = addedBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Card.fromJson(dynamic json) {
    _id = json['_id'];
    _accountHolderName = json['accountHolderName'];
    _phoneNumber = json['phoneNumber'];
    _email = json['email'];
    _bankAccountNumber = json['bankAccountNumber'];
    _addedBy = json['addedBy'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _accountHolderName;
  String? _phoneNumber;
  String? _email;
  String? _bankAccountNumber;
  String? _addedBy;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get accountHolderName => _accountHolderName;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get bankAccountNumber => _bankAccountNumber;
  String? get addedBy => _addedBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['accountHolderName'] = _accountHolderName;
    map['phoneNumber'] = _phoneNumber;
    map['email'] = _email;
    map['bankAccountNumber'] = _bankAccountNumber;
    map['addedBy'] = _addedBy;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}