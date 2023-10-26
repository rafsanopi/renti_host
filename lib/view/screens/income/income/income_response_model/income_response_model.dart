class IncomeResponseModel {
  IncomeResponseModel({
      String? totalIncomeMessage, 
      int? totalIncome, 
      List<dynamic>? weeklyIncomeList,}){
    _totalIncomeMessage = totalIncomeMessage;
    _totalIncome = totalIncome;
    _weeklyIncomeList = weeklyIncomeList;
}

  IncomeResponseModel.fromJson(dynamic json) {
    _totalIncomeMessage = json['totalIncome_message'];
    _totalIncome = json['totalIncome'];
    _weeklyIncomeList = json['weeklyIncomeList'] != null ? json['weeklyIncomeList'].cast<String>() : [];
  }
  String? _totalIncomeMessage;
  int? _totalIncome;
  List<dynamic>? _weeklyIncomeList;

  String? get totalIncomeMessage => _totalIncomeMessage;
  int? get totalIncome => _totalIncome;
  List<dynamic>? get weeklyIncomeList => _weeklyIncomeList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalIncome_message'] = _totalIncomeMessage;
    map['totalIncome'] = _totalIncome;
    if (_weeklyIncomeList != null) {
      map['weeklyIncomeList'] = _weeklyIncomeList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}